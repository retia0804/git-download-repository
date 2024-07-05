#!/bin/sh

# 패키지 목록 업데이트
echo "Updating package list..."
sudo apt update || { echo "Failed to update package list"; exit 1; }

# 필수 패키지 설치
echo "Installing required packages: python3-pip, curl, wget..."
sudo apt install -y python3-pip curl wget || { echo "Failed to install required packages"; exit 1; }

# apt-select 설치
echo "Installing apt-select..."
sudo pip3 install apt-select || { echo "Failed to install apt-select"; exit 1; }

# 현재 위치 국가의 미러 서버 선택
echo "Selecting best mirror for current country..."
sudo apt-select --country $(curl -s https://ipinfo.io/country) || { echo "Failed to select best mirror"; exit 1; }

# 기존 sources.list 파일 백업
echo "Backing up current sources.list..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak || { echo "Failed to backup sources.list"; exit 1; }

# 새로운 sources.list 파일 이동
echo "Moving new sources.list to /etc/apt/..."
sudo mv sources.list /etc/apt/sources.list || { echo "Failed to move new sources.list"; exit 1; }

# 패키지 목록 업데이트
echo "Updating package list with new sources..."
sudo apt update || { echo "Failed to update package list with new sources"; exit 1; }

echo "Setup complete."
