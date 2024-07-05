#!/bin/sh

# 필요한 파일 다운로드
sudo apt update
sudo apt install wget curl

# 작업할 디렉토리
mkdir -p ~/Downloads && cd ~/Downloads
# Github에서 필요한 파일 다운롣,
wget https://raw.githubusercontent.com/retia0804/git-download-repository/main/update_mirror_server.sh
# 권한 부여
chmod +x update_mirror_server.sh
# 실행
./update_mirror_server.sh


