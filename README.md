# 스팀덱 한글설정 간소화

현재 스팀덱의 데스크탑모드의 한글 입력은 끔찍한 수준입니다.
특히나 fcitx의 단어단위 설정을 끄고 진행해도 띄어쓰기시 정신을 못차리고 있는데요.

이를 해결하기 위해 몇가지 입력기를 테스트 해보았으며 결과적으로 ibus를 사용하는 것이 낫다는 판단이 섰습니다.
갤러리에서 쉘까지 만들어가며 도와주신 분들이 있기에 정보성으로 공유해봅니다.

한줄씩 실행하시면 기존 fcitx pacman 종속성을 삭제하고 ibus 종속성을 설치하도록 작성했습니다.
Konsole을 실행하고 한줄씩 복사 붙여넣기를 해주세요.

```sh
  curl -fsSL -o korean_setting.sh https://raw.githubusercontent.com/jshsakura/steamdeck/main/korean_setting.sh
```

```sh
sh ./korean_setting.sh
```

모두 한글입력의 고통에서 벗어나시길 바랍니다.

PS: 루트 파티션 용량 5기가 실화입니까... 이걸로 뭘 하라는 건지 슬픕니다.

https://opencourse.tistory.com/769
만약 리눅스에 대해 문외한인 전체과정이 필요한 뉴비라면 개인 블로그에 전문을 올려놓았으니 참고해보시기 바랍니다.
설치가 끝나면 재부팅 한번 하고 사용하시면 되겠습니다.
