#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt install -y curl apt-transport-https ca-certificates

# Add Microsoft repository
echo "Adding Microsoft repository..."
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/debian/12/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

# Update the apt package index
echo "Updating apt package index..."
sudo apt update

# Install SQL Server
echo "Installing SQL Server..."
sudo ACCEPT_EULA=Y apt install -y mssql-server

# Configure SQL Server
echo "Configuring SQL Server..."
sudo /opt/mssql/bin/mssql-conf setup

# Start SQL Server
echo "Starting SQL Server..."
sudo systemctl start mssql-server

# Enable SQL Server to start on boot
echo "Enabling SQL Server to start on boot..."
sudo systemctl enable mssql-server

echo "Microsoft SQL Server installation completed!"
