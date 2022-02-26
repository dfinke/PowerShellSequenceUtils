# PowerShell Sequence Utilities

- Generate Sequence of Numbers - Print a sequence of numbers with specified increment or format with seq command
- Generate Sequence of Dates

## Get-NumberSequence

```powershell
seq 3

1
2
3
```

Range 

```powershell
seq 3 10

3
4
5
6
7
8
9
10
```

Range with Increment

```powershell
seq 10 2 10

10
12
14
16
18
20
```

Equalize width by padding with leading zeroes

```powershell
seq 100 100 1000 -e 

0100
0200
0300
0400
0500
0600
0700
0800
0900
1000
```

Use -f FORMAT

```powershell
seq 1 .2 2 -Format '{0:C}'

$1.00
$1.20
$1.40
$1.60
$1.80
$2.00
```

Use a separator for numbers 

```powershell
seq -sep ',' 6 6 36

6,12,18,24,30,36
```

```powershell
seq -sep : 6 6 36

6:12:18:24:30:36
```
## Get-DateSequence

Get next three days.
```powershell
dseq 3

Thursday, February 24, 2022
Friday, February 25, 2022
Saturday, February 26, 2022
```

Get next three days, save it to a file

```powershell
dseq 3 > dates.txt
gc dates.txt

Thursday, February 24, 2022
Friday, February 25, 2022
Saturday, February 26, 2022
```

Get day before yesterday till today

```powershell
dseq -2 0

Monday, February 21, 2022
Tuesday, February 22, 2022
Wednesday, February 23, 2022
```

## For Loop

```powershell
foreach($item in seq 10 2 20) {
    "And the number is: $item"
}
```

```
And the number is: 10
And the number is: 12
And the number is: 14
And the number is: 16
And the number is: 18
And the number is: 20
```