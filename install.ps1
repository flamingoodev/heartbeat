echo "Installing Heartbeat..."
$heartbeat_name = "HEARTBEAT_HOME"
$heartbeat_value = "C:\Program Files\heartbeat"
$pwd = pwd

$HEARTBEAT_HOME = [Environment]::GetEnvironmentVariable("$heartbeat_name","Machine")
if ([String]::IsNullOrEmpty($HEARTBEAT_HOME)) {
echo "Environment variable 'HEARTBEAT_HOME' not found..."
echo "Setting environment variable 'HEARTBEAT_HOME'..."
[Environment]::SetEnvironmentVariable("$heartbeat_name", "$heartbeat_value", "Machine")
} else {
$HEARTBEAT_HOME = [Environment]::GetEnvironmentVariable("$heartbeat_name","Machine")
echo "Found environment variable 'HEARTBEAT_HOME': $HEARTBEAT_HOME"
}

$HEARTBEAT_HOME = [Environment]::GetEnvironmentVariable("$heartbeat_name","Machine")

echo "Copying files to '$HEARTBEAT_HOME'"
$isExist = Test-Path $HEARTBEAT_HOME

if ($isExist -eq $false) {
 $md = mkdir "$heartbeat_value"
}

cp "$pwd\heartbeat.exe" "C:\Program Files\heartbeat"

.\WinSW-x64.exe install
.\WinSW-x64.exe start
$status = .\WinSW-x64.exe status heartbeat.xml
echo "Heartbeat service status: $status"

