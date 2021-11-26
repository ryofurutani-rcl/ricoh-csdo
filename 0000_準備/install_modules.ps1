# 必要なモジュールをインストールする。
Install-Module -Name AzureAD -Scope CurrentUser
Install-Module -Name MicrosoftTeams -Scope CurrentUser
Install-Module -Name Microsoft.Graph -Scope CurrentUser

# インストールされているモジュール一覧を表示。
$installedModules = Get-InstalledModule
$installedModules.Name