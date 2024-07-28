function New-DictionaryPassword
{
    param (
        [Parameter(Mandatory=$false)]
        [int]$quantity
    )
    
    try {
        $words = Get-Content .\words.txt 
    }
    catch {
        Write-Output $_
        break
    }
    
    if($quantity) {$end = $quantity}
    else {[int]$end = 1}
    
    $n = 0
    while ($n -lt $end)
    {
        $1 = Get-Random $words
        $2 = Get-Random $words
        while($2 -eq $1)
        {
            $2 = Get-Random $words
        }
        $3 = Get-Random $words
        while($3 -eq $1 -or $3 -eq $2)
        {
            $3 = Get-Random $words
        }
        $pw = $1 + $2 + $3
        $n++
        Write-Output $pw
    }
}