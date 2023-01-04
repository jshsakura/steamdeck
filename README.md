# 스팀덱 3.4.4 한글설정 ibus install 간소화

현재 스팀덱의 데스크탑모드의 한글 입력은 기본적으로 빠져 있습니다.

특히나 3.5.X 버전부터 사용하게될 fcitx5를 3.4.X 에서 사용할 경우

단어 단위 설정을 끄고 진행해도 띄어쓰기가 글자 앞으로 튀어 나오는등 정신을 못차리고 있는데요.


이를 해결하기 위해 몇가지 입력기를 테스트 해보았으며 결과적으로 ibus를 사용하는 것이 낫다는 판단이 섰습니다.

쉘까지 만들어가며 도와주신 분들이 있기에 정보성으로 공유해봅니다.


한줄씩 실행하시면 기존 fcitx pacman 종속성을 삭제하고 ibus 종속성을 설치하도록 작성했습니다.



Konsole을 실행하고 한줄씩 복사 붙여넣기를 해주세요.

### ibus 설치 스크립트 다운로드
```sh
curl -fsSL -o korean_setting.sh https://raw.githubusercontent.com/jshsakura/steamdeck/main/korean_setting.sh
```

```sh
sh ./korean_setting.sh
```

```sh
ibus-daemon -drxR
```

```sh
ibus-setup
```


쉘파일 설치가 끝나면 트레이에 ibus를 데몬을 실행하고 ibus 설정을 열어줍니다.

ibus 설정 화면에서 Keyboard Shortcuts에서 단축키를 변경합니다.

설정 화면 두번째 Input Method 탭에서 korean -> hangul 입력기를 추가하고 사용하시면 되겠습니다.

모두 한글입력의 고통에서 벗어나시길 바랍니다.



PS: 루트 파티션 용량 5기가 실화입니까....




https://opencourse.tistory.com/769


만약 리눅스에 대해 문외한인 전체과정이 필요한 뉴비라면 개인 블로그에 전문을 올려놓았으니 참고해보시기 바랍니다.
