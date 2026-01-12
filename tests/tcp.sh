#!/bin/bash
VM_IP="192.168.x.x"

echo "--- Starting Advanced TCP Scan Tests ---"

# Test Rule 2000001 (Fast SYN Scan)
sudo nmap -sS -T4 -F $VM_IP

# Test Rule 2000003 (Null Scan)
sudo nmap -sN -p 80,443,22 $VM_IP

# Test Rule 2000004 (FIN Scan)
sudo nmap -sF -p 80,443,22 $VM_IP

# Test Rule 2000005 (Xmas Scan)
sudo nmap -sX -p 80,443,22 $VM_IP

# Test Rule 2000006 (Port Sweep)
sudo nmap -sS -p 1-100 $VM_IP

echo "--- Tests Complete ---"
