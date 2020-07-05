$textFileWithAllFiles = 'files_to_look_for.txt'

Get-ChildItem -Recurse > directory_files.txt

$delimiter = "`n"
$nonmatchArrayList = New-Object -TypeName "System.Collections.ArrayList"

[string[]]$pattern= Get-Content -Path $textFileWithAllFiles

For ($i = 0; $i -lt $pattern.Length; $i++) {
    $match = Select-String -Path .\directory_files.txt -Pattern $pattern[$i].Trim()
    if(-Not $match) {
        [void]$nonmatchArrayList.Add($pattern[$i])
    }
}
$nonmatchArrayList > missing_files.txt

Remove-Item -Path .\directory_files.txt