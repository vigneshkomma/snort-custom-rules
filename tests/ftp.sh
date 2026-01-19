#!/bin/bash

# Target Ubuntu VM IP
VM_IP="192.168.x.x"

echo "--- Starting FTP Protocol Tests ---"

echo "[1] Testing Standard Login (Rule 3000001)..."
timeout 2 ftp -n $VM_IP <<END_SCRIPT
user myuser mypassword
quit
END_SCRIPT

echo "[2] Testing Anonymous Login (Rule 3000003)..."
timeout 2 ftp -n $VM_IP <<END_SCRIPT
user anonymous guest
quit
END_SCRIPT

echo "[3] Testing Sensitive File Access (Rule 3000004)..."
timeout 2 ftp -n $VM_IP <<END_SCRIPT
user myuser mypassword
get /etc/passwd
quit
END_SCRIPT

echo "[4] Testing Brute Force Simulation (Rule 3000002)..."
# Attempting 6 failed logins rapidly
for i in {1..6}; do
  timeout 1 ftp -n $VM_IP <<END_SCRIPT
user admin wrongpass$i
quit
END_SCRIPT
done

echo "--- FTP Tests Complete. Check Snort! ---"
