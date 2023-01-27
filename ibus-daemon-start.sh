#!/bin/bash

# 다운로드 받아 파일에 실행 권한 부여
# 명령어 : chmod +x ibus-daemon-start.sh
# 쉘파일에 우 클릭 후 Run In Konsole 실행, 이후 슬립모드에선 데몬이 꺼지지 않아 유용

/usr/bin/ibus-daemon -d -r

echo -e ""
echo -e "ibus daemon started!\n"
