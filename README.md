# 스팀덱 3.4.4 한글설정 ibus install 간소화

현재 스팀덱의 데스크탑모드의 한글 입력은 기본적으로 빠져 있습니다.

특히나 3.5.X 버전부터 사용하게될 fcitx5를 3.4.X 에서 사용할 경우

단어 단위 설정을 끄고 진행해도 띄어쓰기가 글자 앞으로 튀어 나오는등 정신을 못차리고 있는데요.


이를 해결하기 위해 몇가지 입력기를 테스트 해보았으며 결과적으로 ibus를 사용하는 것이 낫다는 판단이 섰습니다.

쉘까지 만들어가며 도와주시는 분들이 있기에 정보성으로 공개해봅니다.





한줄씩 실행하시면 기존 fcitx pacman 종속성을 삭제하고 ibus 종속성을 설치하도록 작성했습니다.



Konsole을 실행하고 한줄씩 복사 붙여넣기를 해주세요.

### 한글 관련 패키지 설치용 sh 다운로드
```sh
curl -fsSL -o korean_setting.sh https://raw.githubusercontent.com/jshsakura/steamdeck/main/korean_setting.sh
```


### 한글 관련 패키지 설치 실행
```sh
sh ./korean_setting.sh
```


### ibus 데몬 실행
```sh
ibus-daemon -drxR
```

### ibus 설정화면 실행
```sh
ibus-setup
```




![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FIOxaK%2FbtrVmX1pqok%2FSTb1FAIUMh0f08AiC5UR6K%2Fimg.png)
쉘파일 설치가 끝나면 ibus 설정 화면에서 Keyboard Shortcuts 단축키를 변경합니다.




![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbOwEN4%2FbtrVfrXtkFM%2FKDdNU0axWpZ2VdkSE22Agk%2Fimg.png)
설정 화면 두번째 Input Method 탭에서 korean -> hangul 입력기를 추가하고 사용하시면 되겠습니다.

모두 한글입력의 고통에서 벗어나시길 바랍니다.



PS: 루트 파티션 용량 5기가 실화입니까....




https://opencourse.tistory.com/769


만약 리눅스에 대해 문외한인 전체과정이 필요한 뉴비라면 개인 블로그에 전문을 올려놓았으니 참고해보시기 바랍니다.
