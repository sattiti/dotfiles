# WinUser/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

# use TLS1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

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
  Clear-RecycleBin -Force > $null
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
        rm -Force -Recurse $item | Out-Null
      }
      else{
        rm -Force -Recurse "$item/*" | Out-Null
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
          Stop-Process -Id $mid -Force
        }
      }
    }
  }
}

# main
killps
prune
