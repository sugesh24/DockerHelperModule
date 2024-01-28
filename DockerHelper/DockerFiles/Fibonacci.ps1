param (
    [int]$n = -1
)

function Get-Fibonacci {
    param (
        [int]$n
    )

    $a = 0
    $b = 1

    for ($i = 0; $i -lt $n; $i++) {
        Write-Output $a
        $temp = $a
        $a = $b
        $b = $temp + $b
        Start-Sleep -Seconds 0.5
    }
}

if ($n -ge 0) {
    Get-Fibonacci -n $n
} else {
    Get-Fibonacci -n [System.Int32]::MaxValue
}
