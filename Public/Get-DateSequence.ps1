function Get-DateSequence {
    <#
        .SYNOPSIS
        Generate sequence of dates relative to today.
        .Description
        Usage: dseq LAST
           or: dseq FIRST LAST
           or: dseq FIRST INCREMENT LAST

        .EXAMPLE
        dseq 1       # tomorrow
        .EXAMPLE
        dseq 0 0     # today
        .EXAMPLE
        dseq 7       # next 7 days
        .EXAMPLE
        dseq -2 0	 # day before yesterday till today
        .EXAMPLE
        dseq 1 7 365 # tomorrow and then every week for a year
    #>

    $n = Get-NumberSequence @args
    
    if($n -is [string]) {
        return @'
dseq: missing operand
Try 'help dseq' for more information.
'@
    }

    foreach ($item in $n) {
        (Get-Date).AddDays($item)
    }
}