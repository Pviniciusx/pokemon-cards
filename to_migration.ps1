$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$outputFile = Join-Path $scriptDir "db_scripts\migration.sql"

if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

$folders = @(
    "db_scripts\tables",
    "db_scripts\seeds",
    "views"
)

foreach ($folder in $folders) {
    $fullPath = Join-Path $scriptDir $folder
    if (Test-Path $fullPath) {
        $sqlFiles = Get-ChildItem -Path $fullPath -Filter "*.sql" | Sort-Object Name
        foreach ($file in $sqlFiles) {
            Get-Content $file.FullName -Raw -Encoding UTF8 | Add-Content -Path $outputFile -Encoding UTF8
            "`n" | Add-Content -Path $outputFile -Encoding UTF8
        }
    }
}

Write-Host "Migration gerada com sucesso em: $outputFile" -ForegroundColor Green