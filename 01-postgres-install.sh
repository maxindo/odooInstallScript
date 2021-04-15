#!/bin/bash
#####################################################################################################
# Script for installing Postgres on Ubuntu 14.04, 15.04 and 16.04 (could be used for other version too)
# Author: Mohamed Hammad
# Inspired by: Yenthe Van Ginneken
#----------------------------------------------------------------------------------------------------
# This script will install Postgres on your Ubuntu 16.04 server.
#-----------------------------------------------------------------------------------------------------
# Make a new file:
# sudo nano 01-postgres-install.sh
# Place this content in it and then make the file executable:
# sudo chmod +x 01-postgres-install.sh
# Execute the script to install Postgres:
# sudo ./01-postgres-install.sh
#######################################################################################################

##fixed parameters
DB_USER="odoo"
DB_PASS="odoo"

#--------------------------------------------------
# Update Server
#--------------------------------------------------
echo -e "\n---- Update Server ----"
# universe package is for Ubuntu 18.x
sudo add-apt-repository universe
# libpng12-0 dependency for wkhtmltopdf
sudo add-apt-repository "deb http://mirrors.kernel.org/ubuntu/ xenial main"
sudo apt-get update
sudo apt-get upgrade -y

#--------------------------------------------------
# Install PostgreSQL Server
#--------------------------------------------------
echo -e "\n---- Install PostgreSQL Server ----"
sudo apt-get install postgresql postgresql-server-dev-all -y

echo -e "\n---- Creating the ODOO PostgreSQL User  ----"
sudo su - postgres -c "createuser -s $OE_USER" 2> /dev/null || true
