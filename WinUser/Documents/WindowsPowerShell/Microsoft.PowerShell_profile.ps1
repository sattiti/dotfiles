# WinUser/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

# use TLS1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

# set to utf-8
$env:LANG = "ja_JP.UTF-8"

# set PATH
# Set-Item Env:Path "PATH1;PATH2"

# change executionPolicy
if($(Get-ExecutionPolicy) -ne "RemoteSigned"){
  Set-ExecutionPolicy -Force -ExecutionPolicy RemoteSigned -Scope CurrentUser
}

# path
$vimexe      = ""
$chromexe    = ""
$firefoxexe  = ""
$explorerexe = "C:¥Windows¥explorer.exe"

# callapp func
function callapp($path, $a){
  if($a.Length -gt 0){
    Start-Process -FilePath $path -ArgumentList $a
  }
  else{
    Start-Process -FilePath $path
  }
}

# reboot pc
function reboot(){
  cleanup
  Restart-Computer -Force
}

# shutdown
function gohome(){
  cleanup
  Stop-Computer -Force
}

# show all env
function env(){
  (gci env:*).GetEnumerator() | Sort-Object Name | Out-String
}

# lock
function lock(){
  rundll32.exe user32.dll, LockWorkStation
}

# shortcut
function vim(){
  callapp $vimexe $Args
}

function ggc(){
  $a = $Args
  $a = $a + "—incognito"
  callapp $chromeexe $a
}

# cleanup
function cleanup(){
  clear
  Clear-Host
  Clear-History
  Clear-RecycleBin -Force > $null > 2
}

# use python to print calendar
function cal(){
  python -c "import calendar;import datetime;c=calendar.TextCalendar(6);c.pryear(datetime.datetime.now().year)"
}

# nginx on off
function ngup(){
  $cwd = $(pwd).Path
  $ng  = "NGINX_PATH"
  cd $ng
  Stop-Process -Name nginx 2>&1 | Out-Null
  Start-Process "./nginx.exe"
  cd $cwd
}

function ngdown(){
  Stop-Process -Force -ProcessName nginx
}

# git cmd
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
    ls -Hidden -Depth 1 $a | % {
      if(Test-Path -Type Container -Path $_.FullName){
        $parent = $_.Parent.FullName
        if($cmd -eq "pull" -or $cmd -eq "pu" -or $cmd -eq "pul"){
          git -C $parent pull -v --progress --no-rebase
        }
        elseif($cmd -eq "push" -or $cmd -eq "pus"){
          git -C $parent push -u -v --progress
        }
        elseif($cmd -eq "fetch" -or $cmd -eq "fe"){
          git -C $parent fetch -v -p --all
        }
        elseif($cmd -eq "status" -or $cmd -eq "st"){
          git -C $parent status
        }
        elseif($cmd -eq "log"){
          git -C $parent log --online --stat --decorate=full
        }
        elseif($cmd -eq "checkout" -or $cmd -eq "co"){
          git -C $parent checkout
        }
        elseif($cmd -eq "branch" -or $cmd -eq "br"){
          git -C $parent branch -a
        }
        elseif($cmd -eq "add"){
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

function prune(){
  cleanup
  
  $list = @(
  "$HOME/AppData/Local/go-build",
  "$HOME/AppData/Local/"
  )
  
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

# kill garbage ps
function killps(){
  $list = @(
    ""
  )

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

# main
if(($date).Hour -ge 8 -and $(date).Hour -le 9 -and ($(date).minute -ge 0 -and $(date).minute -le 59)){}

killps
prune
cleanup