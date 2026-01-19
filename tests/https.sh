#!/bin/bash

# Target IP (Your VM)
VM_IP="192.168.x.x"

echo "--- Starting HTTPS Protocol Tests ---"

echo "[1] Testing Domain Detection (Rule 4000001)..."
# We use --resolve to trick curl into thinking your VM is github.com
curl -k --resolve github.com:443:$VM_IP https://github.com/ &>/dev/null

echo "[2] Testing Port Scan (Rule 4000003)..."
sudo nmap -sS -p 443 $VM_IP > /dev/null

echo "[3] Testing Large Data Upload (Rule 4000004)..."
# Sends a 2KB junk file to the HTTPS port
dd if=/dev/zero bs=2048 count=1 2>/dev/null | nc -w 1 $VM_IP 443

echo "--- HTTPS Tests Complete. Check Snort! ---"
