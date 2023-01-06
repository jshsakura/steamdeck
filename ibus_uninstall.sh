#!/bin/bash

# 읽기전용 스팀 OS 설정 비활성화
sudo steamos-readonly disable

yes | sudo pacman -Rc ibus
yes | sudo pacman -Rc libibus

# 기존 ibus 설정 문구가 있다면 제거
sudo sed -i "s%GTK_IM_MODULE=ibus%%" /etc/environment
sudo sed -i "s%QT_IM_MODULE=ibus%%" /etc/environment
sudo sed -i "s%XMODIFIERS=@im=ibus%%" /etc/environment
sudo sed -i "/^$/d" /etc/environment

# 기존 bashrc ibus 설정 문구가 있다면 제거 (터미널 한글 입력용)
sed -i "/export GTK_IM_MODULE=ibus/d" $HOME/.bashrc
sed -i "/export QT_IM_MODULE=ibus/d" $HOME/.bashrc
sed -i "/export XMODIFIERS=@im=ibus/d" $HOME/.bashrc

# ibus 입력기 및 한글 종속성 remove
yes | sudo pacman -Rc ibus ibus-hangul libhangul

# 읽기전용 스팀 OS 설정 활성화(원복)
sudo steamos-readonly enable

echo -e ""
echo -e "korean setting uninstall finished!\n"
