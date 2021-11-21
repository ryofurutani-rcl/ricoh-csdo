
# AzureADのモジュールを読み込む。
Import-Module -Name AzureAD
​​
# ActiveDirectoryにログインする。
# ログイン画面が自動で開くので、メールアドレスとパスワードを入れて接続方法を選ぶと、AzureADにログインする。
# ログインしたらPowerShellでの処理が再開される。
Connect-AzureAD
​
​# AzureADのユーザー全員の情報を取得。
$azureAdAllUsers = Get-AzureADUser -All $true
​
# csvにチームのメンバー情報を書き出す。
​
# csvに書き出す情報を入れておくためのハッシュを作っておく。
$members = @()
​
foreach($member in $azureAdAllUsers){
    # AzureADの全ユーザーからチームのメンバーを抽出する。
    $currentUser = $azureAdAllUsers
    # 必要な情報を入れておくためのオブジェクトを作っておく。
    $obj = New-Object PSObject
    # ユーザーの名前を取得。
    $obj | Add-Member -MemberType NoteProperty -Name DisplayName -Value $currentUser.DisplayName
    # ユーザーのメールアドレスを取得。
    $obj | Add-Member -MemberType NoteProperty -Name Mail -Value $currentUser.UserPrincipalName
    # ユーザーの部署を取得。
    $obj | Add-Member -MemberType NoteProperty -Name Department -Value $currentUser.Department
    # ユーザーの役職(担当とか室長とか)を取得。
    $obj | Add-Member -MemberType NoteProperty -Name JobTitle -Value $currentUser.JobTitle
    # 作っておいたハッシュに取得した情報を入れる。
    $members += $obj
}
​
# csvに書き出す。
$members | Export-Csv -Path .\TeamMember.csv -Encoding UTF8 -NoTypeInformation