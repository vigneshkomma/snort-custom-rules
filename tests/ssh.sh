#!/bin/bash

# Replace with your Ubuntu VM's IP address
VM_IP="192.168.x.x"

echo "--- Starting Snort Rule Tests against $VM_IP ---"

echo "[1] Testing Connection Established..."
ssh -o ConnectTimeout=2 $VM_IP "exit" &>/dev/null

echo "[2] Testing SYN Scan (Rule 1000002)..."
sudo nmap -sS -p 22 $VM_IP -Pn > /dev/null

echo "[3] Testing Banner Grabbing (Rule 1000003)..."
nmap -sV -p 22 $VM_IP -Pn > /dev/null

echo "[4] Testing Brute Force (Rule 1000004)..."
# Sending 6 quick connection attempts
for i in {1..6}; do nc -z -w1 $VM_IP 22; done

echo "[5] Testing Xmas Scan (Rule 1000005)..."
sudo nmap -sX -p 22 $VM_IP -Pn > /dev/null

echo "[6] Testing Null Scan (Rule 1000006)..."
sudo nmap -sN -p 22 $VM_IP -Pn > /dev/null

echo "--- Tests Complete. Check your Snort Console! ---"
