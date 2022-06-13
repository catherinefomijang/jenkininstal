#!/bin/bash

#Author : Catherine 
#Date : 06/12/22

##------------Description : Jenkins installation script -------------------


# Installing java 
sudo yum install java-1.8.0-openjdk-devel -y
echo ""
echo ""
sleep 1
# Enabling the Jenkins repository 
sudo yum install wget -y
echo ""
echo ""
sleep 1
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
echo ""
sleep 1
# Disabling the key check on repository
sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo
echo ""
sleep 1
# Installing the last version of Jenkins
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
echo""
sleep 2
# Enabling Jenkins to start on system reboot 
sudo systemctl enable jenkins
echo ""
sleep 1
# Adjusting firewall
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp 
sudo firewall-cmd --reload
echo ""
echo ""
echo ""
sleep 3
# Opening the Jenkins page from web browser 
echo "Copy and paste this URL into your web browser:"
echo ""
echo "http://192.168.56.39:8080"
echo ""
echo ""
sleep 10

# Administrator password that is to be copied and then pasted into 'Unlock Jenkins'

echo "Copy and paste this 32 digit password into the 'Unlock Jenkins'"
echo ""
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Instructions for user when Jenkins is installed 

echo "When prompted to customize plug-ins for Jenkins, select 'install suggested plugins'."
echo""
echo""
sleep 1
echo "For first admin user, type 'utrains' for username, 'school1' for password, and 'your@email' for email"
echo ""
echo ""
sleep 1
echo "Now click 'Save and Finish' for the instance configuration page"
echo ""
echo ""
echo ""
sleep 1
echo "---------------------------------------------------"
sleep 1
echo "Process Complete!"
