if (!(Get-Command choco -errorAction SilentlyContinue))
{
    Write-Output "Chocolatey was not found, installing now..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else 
{
    Write-Output "Chocolatey already installed, continuing..."
}


if (!(Get-Command mpg123 -errorAction SilentlyContinue))
{
    Write-Output "mpg123 was not found, installing now..."
    choco install mpg123
}
else 
{
    Write-Output "mpg123 already installed, continuing..."
}

if (!(Get-Command nodejs -errorAction SilentlyContinue))
{
    Write-Output "Node was not found, installing now..."
    choco install nodejs
}
else 
{
    Write-Output "Node already installed, continuing..."
}
