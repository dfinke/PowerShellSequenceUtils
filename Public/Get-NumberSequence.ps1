function Get-NumberSequence {
    <#
        .SYNOPSIS
        The seq command generates a number sequence

        .DESCRIPTION
        seq [start] [end] [step]
        seq [OPTION]... LAST
        seq [OPTION]... FIRST LAST
        seq [OPTION]... FIRST INCREMENT LAST
        
        format = use printf style floating-point FORMAT
        separator = use STRING to separate numbers (default: `n)
        equalWidth = equalize width by padding with leading zeroes          

        # (Measure-Command { $r = seq 250000 }).TotalSeconds

        .EXAMPLE
        seq 10
        .EXAMPLE
        seq 10 20
        .EXAMPLE
        seq 10 2 20
        .EXAMPLE
        seq 1 .2 2
        .EXAMPLE
        seq 24 -6 12
        .EXAMPLE
        seq -sep ',' 6 6 36
        .EXAMPLE
        seq -sep : 6 6 36
        .EXAMPLE
        seq -sep '--' 6 6 36
        .EXAMPLE
        seq 6 -Format '{0}'
        .EXAMPLE
        seq 6 -Format '{0:00}'
        .EXAMPLE
        seq 6 -Format 'Number {0:00} in a C-like format string'
        .EXAMPLE
        seq 1 .2 2 -Format '{0:C}'
        .EXAMPLE
        seq 100 100 1000 -EqualWidth
        .EXAMPLE
        seq 10 10 100 -EqualWidth
        .EXAMPLE
        seq 10 100 -EqualWidth
        .EXAMPLE
        seq -separator * 6 | Invoke-Expression
        .EXAMPLE
        seq -separator + 10 | Invoke-Expression        
    #>
    param(        
        [decimal]$Number1,
        [decimal]$Number2,
        [decimal]$Number3,
        # $Separator = "`n",
        $Separator,
        $Format,
        [Switch]$EqualWidth
    )

    if (-not $PSBoundParameters.ContainsKey("Number1") -and 
        -not $PSBoundParameters.ContainsKey("Number2") -and
        -not $PSBoundParameters.ContainsKey("Number3")) {
            @"
seq: missing operand
Try 'help seq' for more information.
"@
        
        return 
    }

    if ($PSBoundParameters.ContainsKey("Number1") -and 
        -not $PSBoundParameters.ContainsKey("Number2") -and
        -not $PSBoundParameters.ContainsKey("Number3")) {
        
        $First = 1
        $Increment = 1
        $Last = $Number1
    }
    elseif ($PSBoundParameters.ContainsKey("Number1") -and $PSBoundParameters.ContainsKey("Number2") -and
        -not $PSBoundParameters.ContainsKey("Number3")) {        
        $Increment = 1
        $First = $Number1
        $Last = $Number2
    }
    elseif (
        $PSBoundParameters.ContainsKey("Number1") -and 
        $PSBoundParameters.ContainsKey("Number2") -and
        $PSBoundParameters.ContainsKey("Number3")
    ) {        
        $First = $Number1
        $Increment = $Number2
        $Last = $Number3
    }
    else {
        return
    }

    if ($Last -lt $First -and $Increment -ge 0) { return }
    if ($Last -gt $First -and $Increment -le 0) { return }

    if ($EqualWidth) {
        $padLength = "0" * $Last.ToString().Length
    }

    if ($Last -lt $First) {
        $result = for ($idx = $First; $idx -ge $Last; $idx += $Increment) {
            if ($Format) {
                $Format -f $idx
            }
            elseif ($EqualWidth) {
                "{0:$padLength}" -f $idx
            }
            else {
                $idx
            }
        }

        if ($Separator) {
            [string]::Join($Separator, $result)        
        }
        else {
            $result
        }
    }
    else {
        $result = for ([decimal]$idx = $First; $idx -le $Last; $idx += $Increment) {
            if ($Format) {
                $Format -f $idx
            }
            elseif ($EqualWidth) {
                "{0:$padLength}" -f $idx
            }
            else {
                $idx
            }
        }

        if ($Separator) {
            [string]::Join($Separator, $result)        
        }
        else {
            $result
        }
    }
}