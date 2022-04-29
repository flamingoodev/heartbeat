echo "Uninstalling Heartbeat..."
$heartbeat_name = "HEARTBEAT_HOME"
$heartbeat_value = "C:\Program Files\heartbeat"
$pwd = pwd

echo "Stopping Heartbeat service..."

.\WinSW-x64.exe stop

$status = .\WinSW-x64.exe status heartbeat.xml
echo "Heartbeat service status: $status"

echo "Uninstalling Heartbeat service..."
.\WinSW-x64.exe uninstall

$HEARTBEAT_HOME = [Environment]::GetEnvironmentVariable("$heartbeat_name","Machine")
if ([String]::IsNullOrEmpty($HEARTBEAT_HOME)) {
echo "Environment variable 'HEARTBEAT_HOME' not found..."
} else {
[Environment]::SetEnvironmentVariable('$HEARTBEAT_HOME', $null, 'Machine')
echo "Removing environment variable 'HEARTBEAT_HOME'"
}

echo "Removing installed files..."

$isExist = Test-Path $heartbeat_value

if ($isExist -eq $true) {
Remove-Item -Recurse -Force $heartbeat_value
}

echo "Uninstalling Heartbeat has successfully!"

