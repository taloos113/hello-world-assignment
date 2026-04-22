$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$dotnetTools = Join-Path $env:USERPROFILE '.dotnet\tools'
if (Test-Path $dotnetTools) {
    $env:PATH = "$env:PATH;$dotnetTools"
}

Write-Host '[1/7] Restore packages'
dotnet restore HelloWorldAssignment.sln

Write-Host '[2/7] Verify formatting'
dotnet format HelloWorldAssignment.sln --verify-no-changes --no-restore

Write-Host '[3/7] Build Debug'
dotnet build HelloWorldAssignment.sln -c Debug --no-restore

Write-Host '[4/7] Build Release'
dotnet build HelloWorldAssignment.sln -c Release --no-restore

Write-Host '[5/7] Run unit tests'
dotnet test HelloWorldAssignment.sln -c Release --no-build --no-restore

Write-Host '[6/7] Install DocFX if needed'
if (-not (Get-Command docfx -ErrorAction SilentlyContinue)) {
    dotnet tool install --global docfx
    $env:PATH = "$env:PATH;$dotnetTools"
}

Write-Host '[7/7] Generate documentation'
docfx metadata docs/docfx.json
docfx build docs/docfx.json

Write-Host 'Build completed successfully.'
