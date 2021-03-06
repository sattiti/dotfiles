# $env:HOMEPATH/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

# use TLS1.2 {{{
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
# }}}

# LANG {{{
$env:LANG = "ja_JP.UTF-8"
# }}}

# change executionPolicy {{{
if($(Get-ExecutionPolicy) -ne "RemoteSigned"){
  Set-ExecutionPolicy -Force -ExecutionPolicy RemoteSigned -Scope CurrentUser
}
# }}}

# set PATH {{{
# Set-Item Env:Path "PATH1;PATH2"
# }}}

# Variables {{{
# app path
$appExplorer = "C:¥Windows¥explorer.exe"
$appIE       = "C:\Program Files\internet explorer\iexplore.exe"
# }}}
# Function {{{
# callapp func {{{
function callapp($path, $a){
  if($a.Length -gt 0){
    Start-Process -FilePath $path -ArgumentList $a
  }
  else{
    Start-Process -FilePath $path
  }
}
# }}}

# lock {{{
function lock(){
  rundll32.exe user32.dll, LockWorkStation
}
# }}}
# reboot {{{
function reboot(){
  cleanall
  Restart-Computer -Force
}
# }}}
# shutdown {{{
function gohome(){
  cleanall
  Stop-Computer -Force
}
# }}}

# show all env {{{
function env(){
  (gci env:*).GetEnumerator() | Sort-Object Name | Out-String
}
# }}}
# print formatted query string {{{
function qs(){
  $s     = $Args[0]
  $usage = "qs QUERY_STRING"
  
  if($Args.length -ne 1){
    echo $usage
    return
  }
  
  $s=$s.replace("?","`n").replace("&","`n")
  $u=$($s.Split("`n") | Select-Object -First 1)
  $s=$s.replace($u,"")
  echo $u
  ConvertFrom-Csv $s -Delimiter "=" -Header Key,Value
}
# }}}
# Print calendar on Python {{{
function cal(){
  python -c "import calendar;import datetime;c=calendar.TextCalendar(6);c.pryear(datetime.datetime.now().year)"
}
# }}}

# nginx on/off {{{
function ngup(){
  Start-Process nginx.exe -WindowStyle Hidden -ArgumentList "-p $($env:USERPROFILE)\usr\local\etc\nginx" 
}

function ngdown(){
  Stop-Process -Force -ProcessName nginx
}
# }}}

# phpcgi {{{
function phpcgiup(){
  Start-Process php-cgi.exe -WindowStyle Hidden -ArgumentList "-b 127.0.0.1:9001 -c $($env:USERPROFILE)\usr\local\etc\php.ini"
}

function phpcgidown(){
  Stop-Process -Force -ProcessName php-cgi
}
# }}}

# git cmd {{{
function gitr(){
  $a      = $Args[1]
  $cmd    = $Args[0]
  $usage  = "gitr CMD[pu(ll), pus(h), fe(tch), st(atus), add, log, br(anch)] WORK_TREE_PATH"
  $errMsg = "No such file or directory."

  if($Args.length -ne 2){
    echo $usage
    return
  }

  if(Test-Path -Type Container -Path $a){
    ls -Hidden -Recurse $a | % {
      if($_.Name -eq ".git" -and (Test-Path -Type Container -Path $_.FullName)){
        $parent = $_.Parent.FullName
        if($cmd -eq "pull" -or $cmd -eq "pu" -or $cmd -eq "pul" -or $cmd -eq "get"){
          git -C $parent pull -v --progress --no-rebase
        }
        elseif($cmd -eq "push" -or $cmd -eq "pus" -or $cmd -eq "up"){
          git -C $parent push -u -v --progress
        }
        elseif($cmd -eq "fetch" -or $cmd -eq "fe"){
          git -C $parent fetch -v -p --all
        }
        elseif($cmd -eq "status" -or $cmd -eq "st"){
          git -C $parent status -v
        }
        elseif($cmd -eq "log"){
          git -C $parent log --oneline --stat --decorate=full
        }
        elseif($cmd -eq "checkout" -or $cmd -eq "ch"){
          git -C $parent checkout
        }
        elseif($cmd -eq "branch" -or $cmd -eq "br"){
          git -C $parent branch -a -l
        }
        elseif($cmd -eq "add" -or $cmd -eq "aa"){
          git -C $parent add .
        }
        else{
          echo $usage
          return
        }
      }
    }
  }
  else{
    echo $errMsg
    return
  }
}

function gitv(){
  $range  = $Args[0]
  $dist   = $Args[1]
  $usage  = "gitv RANGE WORK_TREE_PATH"
  $errMsg = "No such file or directory."
  $pat    = "\.html|\.httxt"

  if($Args.length -ne 2){
    echo $usage
    return
  }

  if($range.GetType().Name -eq "String"){
    git -C $dist diff --name-only $range | echo | sls -Pattern $pat | % {
      $file = "${dist}\${_}"
      echo $file
      htmlhint $file
    }
  }
  else{
    foreach($i in 1.."${range}"){
      echo $i
      git -C $dist diff --name-only HEAD~$i | echo | sls -Pattern $pat | % {
        $file = "${dist}\${_}"
        echo $file
        htmlhint $file
      }
    }
  }
}
# }}}
# scoop update {{{
function scoopup(){
  scoop update * && scoop cleanup *
}
# }}}
# cleanup {{{
function cleanup(){
  clear
  Clear-Host
  Clear-History
  Clear-RecycleBin -Force 2>&1 | Out-Null
}
# }}}
# cleanupall {{{
function cleanall(){
  cleanup

  $list = @(
  # "$HOME/AppData/Local/go-build",
  # "$HOME/AppData/Local/"
  )

  if($list.Length -gt 0){
    foreach($item in $list){
      if(Test-Path -Path $item){
        $access = $(Get-Acl -Path $item).Access.AccessControlType
        if(Test-Path -Path $item -Type Leaf){
          rm -Force -Recurse $item 2>&1 | Out-Null
        }
        else{
          rm -Force -Recurse "$item/*" 2>&1 | Out-Null
        }
      }
    }
  }
}
# }}}
# kill garbage ps {{{
function killps(){
  $list = @(
  )
  if($list.Length -gt 0){
    (Get-Process).ProcessName | foreach($_){
      foreach($item in $list){
        if($_ -match $item){
          $mid = (Get-Process -Name $_).id
          if($mid -ne $null){
            Stop-Process -Id $mid -Force 2>&1 | Out-Null
          }
        }
      }
    }
  }
}
# }}}
# }}}

# main {{{
function init_profile(){
  $mutex = New-Object System.Threading.Mutex -ArgumentList $false, "Global¥$(Split-Path -Path $PSCommandPath -Leaf)"

  try{
    if(-not $mutex.WaitOne(0, $false)){
      $mutex.Close()
      exit
    }
  }
  catch [System.Threading.AbandonedMutexException]{}

  # Do something around 0800-0900
  # if(($date).Hour -ge 8 -and $(date).Hour -le 9 -and ($(date).minute -ge 0 -and $(date).minute -le 59)){}
  
  if($(Get-Process).Name -match 'nginx'){
    ngdown
  }

  $runningProcresses = @(
  #   "^iexplore",
  #   "OUTLOOK",
  #   "nginx"
  )

  if($runningProcresses.Length -gt 0){
    foreach($p in $runningProcresses){
      if(-not($(Get-Process).Name -match $p)){
        ngup
      }
    }
  }

  killps
  cleanall

  $mutex.ReleaseMutex()
  $mutex.Close()

  # Install those module by hand typing if necessary.
  # Install-Module -Name posh-git -AllowPrerelease -Force -Scope CurrentUser
  # Install-Module -Name PowerShellGet -Force
  # Install-Module -Name oh-my-posh -Scope CurrentUser

  # set theme
  Set-Theme Paradox
}

init_profile
# }}}
