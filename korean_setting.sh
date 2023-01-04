#!/bin/bash

# 읽기전용 스팀 OS 설정 비활성화
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
# 다국어 설정 이후 스팀덱의 데스크탑인 KDE 플라스마 재설치
sudo pacman -S --noconfirm plasma
# ibus 입력기 및 한글 종속성 추가 설치
sudo pacman -S --noconfirm ibus ibus-hangul libhangul

# 기존 fcitx 패키지가 존재하면 삭제 
if pacman -Qs fcitx5-im > /dev/null ; then
    sudo pacman -R --noconfirm fcitx5-im
    echo "The package fcitx5-im is removed"
fi

if pacman -Qs fcitx5-hangul > /dev/null ; then
    sudo pacman -R --noconfirm fcitx5-hangul
    echo "The package fcitx5-hangul is removed"
fi

if pacman -Qs fcitx5-configtool > /dev/null ; then
    sudo pacman -R --noconfirm fcitx5-configtool
    echo "The package fcitx5-configtool is removed"
fi

# 기존 fcitx 설정 문구가 있다면 삭제
sudo sed -i "s%GTK_IM_MODULE=fcitx%%" /etc/environment
sudo sed -i "s%QT_IM_MODULE=fcitx%%" /etc/environment
sudo sed -i "s%XMODIFIERS=@im=fcitx%%" /etc/environment

# 기존 ibus 설정 문구가 있다면 삭제
sudo sed -i "s%GTK_IM_MODULE=ibus%%" /etc/environment
sudo sed -i "s%QT_IM_MODULE=ibus%%" /etc/environment
sudo sed -i "s%XMODIFIERS=@im=ibus%%" /etc/environment
sudo sed -i "/^$/d" /etc/environment

# 기존 bashrc ibus 설정 문구가 있다면 삭제
#sed -i "/export GTK_IM_MODULE=ibus/d" $HOME/.bashrc
#sed -i "/export QT_IM_MODULE=ibus/d" $HOME/.bashrc
#sed -i "/export XMODIFIERS=@im=ibus/d" $HOME/.bashrc

# 데스크탑 환경에서 데몬 자동실행을 위해 .bashrc 에 추가
sudo sed -i "5s/$/\nGTK_IM_MODULE=ibus\nQT_IM_MODULE=ibus\nXMODIFIERS=@im=ibus\n/g" /etc/environment
#sed -i "1s/$/\nexport GTK_IM_MODULE=ibus\nexport QT_IM_MODULE=ibus\nexport XMODIFIERS=@im=ibus\n/g" $HOME/.bashrc

# 읽기전용 스팀 OS 설정 활성화(원복)
sudo steamos-readonly enable

echo -e ""
echo -e "korean setting finished!\n"

exit 0
