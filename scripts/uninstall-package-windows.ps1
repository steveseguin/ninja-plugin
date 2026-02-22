param(
    [switch]$CurrentUser,
    [string]$ObsRoot = "$env:ProgramFiles\obs-studio",
    [switch]$RemoveData
)

$ErrorActionPreference = "Stop"

if ($CurrentUser) {
    $dstPluginDir = Join-Path $env:APPDATA "obs-studio\plugins\obs-vdoninja\bin\64bit"
    $dstDataDir = Join-Path $env:APPDATA "obs-studio\plugins\obs-vdoninja\data"
    $dstPluginRoot = Join-Path $env:APPDATA "obs-studio\plugins\obs-vdoninja"
} else {
    $dstPluginDir = Join-Path $ObsRoot "obs-plugins\64bit"
    $dstDataDir = Join-Path $ObsRoot "data\obs-plugins\obs-vdoninja"
    $dstPluginRoot = ""
}

$pluginDll = Join-Path $dstPluginDir "obs-vdoninja.dll"

Write-Host "Uninstalling OBS VDO.Ninja plugin..."
Write-Host "Plugin path: $pluginDll"
Write-Host "Data path:   $dstDataDir"

if (Test-Path $pluginDll) {
    Remove-Item $pluginDll -Force
    Write-Host "Removed: $pluginDll"
} else {
    Write-Host "Not found: $pluginDll"
}

if ($RemoveData) {
    if (Test-Path $dstDataDir) {
        Remove-Item $dstDataDir -Recurse -Force
        Write-Host "Removed data: $dstDataDir"
    } else {
        Write-Host "No data folder found."
    }
}

if ($CurrentUser -and $RemoveData -and (Test-Path $dstPluginRoot)) {
    $left = Get-ChildItem $dstPluginRoot -Recurse -ErrorAction SilentlyContinue
    if (-not $left) {
        Remove-Item $dstPluginRoot -Recurse -Force
        Write-Host "Removed empty plugin root: $dstPluginRoot"
    }
}

Write-Host ""
Write-Host "Uninstall complete. Restart OBS Studio."
