Describe "Test Number Sequence" {
    BeforeAll {
        Import-Module "$PSScriptRoot/../PowerShellSequenceUtils.psd1" -force
    }

    It "Tests simple sequence" {
        $actual = seq 3
        $expected = 1..3

        $actual | Should -Be $expected
    }

    It "Tests sequence range" {
        $actual = seq 10 15
        $expected = 10..15

        $actual | Should -Be $expected
    }

    It "Tests sequence increment" {
        $actual = seq 10 2 20
        $expected = 10, 12, 14, 16, 18, 20

        $actual | Should -Be $expected
    }

    It "Tests sequence with decimals" {
        $actual = seq 5 .2 6.6
        $expected = 5, 5.2, 5.4, 5.6, 5.8, 6.0, 6.2, 6.4, 6.6        

        $actual | Should -Be $expected
    }

    It "Tests return null if increment cannot get you to the last positive numbers" {
        $actual = seq 10 2 1
        $actual | Should -BeNullOrEmpty
    }

    It "Tests return null if increment cannot get you to the last for negative numbers" {
        $actual = seq -5 2 -10
        $actual | Should -BeNullOrEmpty
    }

}