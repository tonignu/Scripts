# Propósito: Monitorea el espacio en disco y genera una alerta visual si el espacio libre es inferior al 10%
$Threshold = 10 # Porcentaje de alerta

Get-Volume | Where-Object { $_.DriveLetter -ne $null } | ForEach-Object {
    $FreePercent = [Math]::Round(($_.SizeRemaining / $_.Size) * 100, 2)
    
    $Status = "OK"
    if ($FreePercent -lt $Threshold) {
        $Status = "CRÍTICO: Espacio bajo"
        Write-Host "Alerta en Unidad $($_.DriveLetter): $FreePercent% libre" -ForegroundColor Red
    }

    [PSCustomObject]@{
        Drive  = $_.DriveLetter
        Label  = $_.FileSystemLabel
        Free % = $FreePercent
        Status = $Status
    }
} | Format-Table
