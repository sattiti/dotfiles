# [System.EnvironmentVariableTarget]::Machine
# [System.EnvironmentVariableTarget]::User
# [System.EnvironmentVariableTarget]::Process

$path = [System.Environment]::GetEnvironmentVariable("PATH", # [System.EnviromentVariableTarget]::User)

$pathList = @(
  "C:${env:HOMEPATH}\.bin"
)

$path = $path + $pathList -join ""

[System.Environment]::SetEnvironmentVariable("PATH", $path, # [System.EnviromentVariableTarget]::User)
