#!/bin/sh
echo deb http://se.archive.ubuntu.com/ubuntu trusty main universe | sudo tee /etc/apt/sources.list.d/temp-trusty.list
echo deb http://security.ubuntu.com/ubuntu trusty-security main universe | sudo tee -a /etc/apt/sources.list.d/temp-trusty.list
sudo apt update
sudo apt install libavcodec54 libavformat54
sudo rm /etc/apt/sources.list.d/temp-trusty.list
sudo apt update

