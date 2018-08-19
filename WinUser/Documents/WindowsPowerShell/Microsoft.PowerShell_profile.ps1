# WinUser/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

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

# shortcut
function vim(){
  callapp $vimexe $Args
}

function ggc(){
  $a = $Args
  $a = $a + "—incognito"
  callapp $chromeexe $a
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
        Stop-Process -Id $mid -Force
      }
    }
  }
}

# main
killps
