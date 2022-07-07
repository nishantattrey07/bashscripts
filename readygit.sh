#!/bin/bash
#Do not edit this file until you know what you are doing 
#this is all for you, you can bring up the new changes 
#if the file does not execute then do check the bash position by typinh "which bash" and then copy the location to 1st line
echo "ENter 1 for SSH key"
echo "ENTER 2 for GPG key"
read opt
if [ $opt -eq 1 ]
then
echo "ENter your email $(whoami)"
read email
cd ~/.ssh
ssh-keygen -o -t rsa -C "$email"
echo "         "
echo "         "
echo "ENter the file name in which ssh key is saved with extention .pub  'filename.pub'"
echo "if you have not given any file name type type id_rsa.pub "
read filename
echo "         "
echo "         "
cat $filename
echo "         "
echo "         "
echo " Now you will be redirected to github ssh key section "
xdg-open https://github.com/settings/keys
elif [ $opt -eq 2 ];
then
sudo apt-get install gnupg
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
echo "copy the key id"
echo "sec   4096R/3AA5C34371567BD2"
echo "here the key id is 3AA5C34371567BD2"
echo "enter your key id"
read keyid
echo "         "
echo "         "
gpg --armor --export $keyid
echo "         "
echo "         "
echo " Now you will be redirected to github ssh key section"
xdg-open https://github.com/settings/keys
fi
