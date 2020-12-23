# Installing Haskell

## Windows

Although I do not recommend the usage of Haskell on Windows (or using Windows at all for development), it is of course still possible to install Haskell on Windows. The basic procedure for installing Haskell on ALL operating systems can be found at https://www.haskell.org/platform/. 

### Installing Chocolatey
1. Start PowerShell as Admin
2. Run `Get-ExecutionPolicy`
	2a. If it returns 'Restricted', then run `Set-ExecutionPolicy AllSigned`
3. Run `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`
4. Run `choco` or `choco -?` to verify installation worked.

### Installing Haskell
1. Start PowerShell as Admin
2. Run `choco install haskell-dev`
3. Run `refreshenv`

## MacOS/Linux