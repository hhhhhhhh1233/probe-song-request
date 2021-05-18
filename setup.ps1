if (!(Get-Command choco -errorAction SilentlyContinue))
{
    Write-Output "Chocolatey was not found, installing now..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

if (!(Get-Command mpg123 -errorAction SilentlyContinue))
{
    choco install mpg123
}

if (!(Get-Command nodejs -errorAction SilentlyContinue))
{
    choco install nodejs
}
