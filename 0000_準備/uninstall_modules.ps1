# Microsoft Graphモジュールの削除。
Uninstall-Module -Name Microsoft.Graph
# Microsoft Graphモジュールの依存モジュールを削除。
Get-InstalledModule -Name Microsoft.Graph.* | %{ if($_.Name -ne "Microsoft.Graph.Authentication"){ Uninstall-Module $_.Name } }
Uninstall-Module -Name Microsoft.Graph.Authentication

# AzureとTeamsのモジュールを削除。
Uninstall-Module -Name AzureAD
Uninstall-Module -Name MicrosoftTeams