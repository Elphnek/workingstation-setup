#!/bin/bash

echo "=== Creating Ansible files structure from captured configs ==="

# Create necessary directories
mkdir -p roles/{base,development,personal,work}/{tasks,files}
mkdir -p files/configs

# Copy captured configurations to Ansible files directory
if [ -f files/current_config/bashrc ]; then
    cp files/current_config/bashrc files/configs/
fi

if [ -f files/current_config/gitconfig ]; then
    cp files/current_config/gitconfig files/configs/
fi

if [ -d files/current_config/guake_conf ]; then
    cp -r files/current_config/guake_conf files/configs/
fi

# Create package lists for different roles
if [ -f files/current_config/installed_packages.txt ]; then
    mkdir -p roles/development/files roles/base/files
    grep -i "dev\|build\|docker\|python\|node\|java" files/current_config/installed_packages.txt > roles/development/files/dev_packages.txt || touch roles/development/files/dev_packages.txt
    grep -i "vim\|git\|curl\|wget" files/current_config/installed_packages.txt > roles/base/files/base_packages.txt || touch roles/base/files/base_packages.txt
fi

# Show created structure
echo -e "\nCreated directory structure:"
tree roles/

echo -e "\nAnsible files structure created!"
