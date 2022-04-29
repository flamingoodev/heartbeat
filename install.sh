ln -s "$(pwd)/heartbeat.service" /etc/systemd/system/heartbeat.service
systemctl daemon-reload
systemctl start heartbeat.service
