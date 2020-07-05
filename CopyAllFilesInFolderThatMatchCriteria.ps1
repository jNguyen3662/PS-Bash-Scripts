$sourcePath = 'C:\Users\Jen\Google Drive\Ringtones\MGS Sounds'
$destPath = 'C:\Users\Jen\Google Drive\Ringtones\MGS Sounds (phone)'

Get-ChildItem $sourcePath -Recurse -Include '*.wav', '*.mid' | Foreach-Object `
    {
        $destDir = Split-Path ($_.FullName -Replace [regex]::Escape($sourcePath), $destPath)
        if (!(Test-Path $destDir))
        {
            New-Item -ItemType directory $destDir | Out-Null
        }
        Copy-Item $_ -Destination $destDir
    }