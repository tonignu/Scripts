# Propósito: Creación masiva de usuarios locales desde CSV
# Formato CSV: Name,FullName,Description

$CsvPath = "users.csv"

if (-not (Test-Path $CsvPath)) {
    Write-Error "Archivo $CsvPath no encontrado."
    return
}

$Users = Import-Csv $CsvPath

foreach ($User in $Users) {
    if (-not (Get-LocalUser -Name $User.Name -ErrorAction SilentlyContinue)) {
        $Password = ConvertTo-SecureString "TempPass2026!" -AsPlainText -Force
        New-LocalUser -Name $User.Name -Password $Password -FullName $User.FullName -Description $User.Description
        Write-Host "Usuario $($User.Name) creado con éxito." -ForegroundColor Green
    } else {
        Write-Warning "El usuario $($User.Name) ya existe."
    }
}
