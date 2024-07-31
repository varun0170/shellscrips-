#This script will install Git, Ansible, Jenkins, and Docker on any new machine with ubuntu as an os

#/bin/bash

set -e
set -x
set -o pipefail

# Update the package list and upgrade all packages
sudo apt-get update -y && sudo apt-get upgrade -y

# Install Git
sudo apt-get install git -y

# Install Ansible
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Install Jenkins and start jenkins 
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins

#Install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce

# Add the current user to the Docker group (to run Docker without sudo)
sudo usermod -aG docker $USER

# Print out installation status
git --version
ansible --version | head -n 1
sudo systemctl status jenkins --no-pager
docker --version
