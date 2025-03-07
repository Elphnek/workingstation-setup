#!/bin/bash

echo "=== Phase 1: Installing Prerequisites ==="
echo "Checking and installing prerequisites..."

# Check for Python3 and pip3
if ! command -v python3 &> /dev/null; then
    echo "Installing Python3 and pip3..."
    sudo apt update
    sudo apt install -y python3 python3-pip
fi

# Install Ansible if not present
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y ansible
fi

# Install required Ansible collections
echo "Installing required Ansible collections..."
ansible-galaxy collection install community.general

echo "Prerequisites installation complete!"
echo "You can now proceed with running the Ansible playbook."
