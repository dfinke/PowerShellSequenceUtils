foreach ($file in Get-ChildItem $PSScriptRoot/Public *.ps1) {
    . $file.FullName
    #$file.FullName | Write-Host
}

Set-Alias dseq Get-DateSequence
Set-Alias seq Get-NumberSequence