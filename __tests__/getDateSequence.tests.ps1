Describe "Test Date Sequence" {
    BeforeAll {
        Import-Module "$PSScriptRoot/../PowerShellSequenceUtils.psd1" -force
    }

    It "Tests today date" {
        $actual = dseq 0 0
        $expected = (Get-Date).ToLongDateString()

        $actual.ToLongDateString() | Should -BeExactly $expected
    }

    It "Tests next 3 days" {
        $actual = dseq 3
        
        $expected = foreach ($i in 1..3) {
            (Get-Date).AddDays($i).ToLongDateString()
        }

        $actual.ToLongDateString() | Should -BeExactly $expected
    }
}