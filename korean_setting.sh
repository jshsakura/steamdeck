#!/bin/bash

# 읽기전용 스팀 OS 설정 비활성화(Immutable OS 설정 임시해제)
sudo steamos-readonly disable

# 팩맨 인증서 초기화
sudo pacman-key --init

# 팩맨 마스터키 추가
sudo pacman-key --populate archlinux

# 한글폰트 추가
yes | sudo pacman -S terminus-font noto-fonts-cjk ttf-dejavu

# GNU의 C 라이브러리 구현 추가
yes | sudo pacman -S glibc

# 다국어 설정 - 국제화 프레임워크 추가 (설정에서 한국어 선택 가능)
yes | sudo pacman -S ki18n

# 다국어 설정 이후 스팀덱의 데스크탑인 KDE 플라즈마 재설치
sudo pacman -S --noconfirm plasma

# ibus 입력기 및 한글 종속성 추가 설치
sudo pacman -S --noconfirm ibus ibus-hangul libhangul

# 기존 fcitx 설정이 있다면 삭제 
sudo pacman -R --noconfirm fcitx5-im fcitx5-hangul fcitx5-configtool

# 기존 fcitx 설정 문구가 있다면 삭제
sudo sed -i "s%GTK_IM_MODULE=fcitx%%" /etc/environment
sudo sed -i "s%QT_IM_MODULE=fcitx%%" /etc/environment
sudo sed -i "s%XMODIFIERS=@im=fcitx%%" /etc/environment

# 기존 ibus 설정 문구가 있다면 삭제
sudo sed -i "s%GTK_IM_MODULE=ibus%%" /etc/environment
sudo sed -i "s%QT_IM_MODULE=ibus%%" /etc/environment
sudo sed -i "s%XMODIFIERS=@im=ibus%%" /etc/environment
sudo sed -i "/^$/d" /etc/environment

# 현재 데몬 자동실행이 정상적으로 되진 않지만 권고사항이니 추가
sudo sed -i "5s/$/\nGTK_IM_MODULE=ibus\nQT_IM_MODULE=ibus\nXMODIFIERS=@im=ibus/g" /etc/environment

# 읽기전용 스팀 OS 설정 활성화(Immutable OS 설정 원복)
sudo steamos-readonly enable

# ibus 최초 설정을 위해 데몬 실행
ibus-daemon -drxR

# 터미널 종료
exit 0
