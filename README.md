# :rage:  스팀 OS 3.4.4 한글 로케일 및 ibus 입력기 설치 간소화

![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbUAGSD%2FbtrVo5rsvE4%2FtK46tvRObfgwl7Kl2DaIs1%2Fimg.png)

현재 스팀덱의 데스크탑 모드 실행시 **한글 입력**은 기본적으로 빠져 있습니다.<br/><br/> 

특히나 `fcitx5`를 `Steam OS` 3.4.4 에서 사용할 경우 단어 단위 설정을 끄고 진행하더라도

마지막 문자의 띄어쓰기가 글자 앞으로 튀어 나오기도하고 정신을 못차리고 있는데요.  <br/><br/> 

이를 해결하기 위해 몇가지 입력기를 테스트 해보았으며 결과적으로 `ibus`를 사용하는 것이 낫다는 판단입니다.


쉘까지 만들어가며 공개해주시는 분들이 있기에 저역시 정보성으로 공개해봅니다.


한줄씩 실행하시면 기존 `fcitx` `pacman` 종속성을 삭제하고 `ibus` 관련 종속성을 설치하도록 작성했습니다.  <br/><br/> <br/><br/> 


![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQbIXD%2FbtrVjm129XQ%2FOjKvJHzfnumfiZdOjW3wP0%2Fimg.png)


어플리케이션 런처에서 `Konsole`을 실행합니다.  <br/><br/><br/><br/> 

 
![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F5uPwm%2FbtrVkWV5SCj%2Fi6FD7lCZLffJtSO0rYjveK%2Fimg.png)


`Konsole`을 실행되면 아래 내용을 하나씩 복사 붙여넣기를 해주세요. 

`sudo` 사용을 위해 패스워드를 요구하니 반드시 사전에 `passwd`로 비밀번호를 설정해두셔야합니다.
<br/><br/> <br/><br/> 

  
### 1. 한글 관련 패키지 설치용 sh 다운로드 및 실행
```sh
curl -L https://raw.githubusercontent.com/jshsakura/steamdeck/main/korean_setting.sh | sh
```

<br/><br/>
### 2. ibus 데몬 실행
```sh
ibus-daemon -drxR
```

<br/><br/>
### 3. ibus 설정화면 실행
```sh
ibus-setup
```


<br/><br/>

### 4. GUI에서 ibus 설정하기
![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FIOxaK%2FbtrVmX1pqok%2FSTb1FAIUMh0f08AiC5UR6K%2Fimg.png)

`ibus 설정 화면`에서 `Keyboard Shortcuts` 단축키를 변경합니다. 

사실상 위 숏컷에 설정된 키가 앞으로 사용할 한/영 전환키나 다름 없습니다. 

대부분의 프로그램에서 문제가 없는 `시프트` + `스페이스` 조합을 추천합니다.
<br/><br/><br/><br/>   


   
![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbOwEN4%2FbtrVfrXtkFM%2FKDdNU0axWpZ2VdkSE22Agk%2Fimg.png)

설정 화면 두번째 탭인 `Input Method` 탭에서 `korean` :point_right: `hangul` 입력기를 추가합니다.  <br/><br/><br/><br/>  



![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FddWgR6%2FbtrVpgmE8q8%2Fk2kqIuSd9BkhXQToHAzj60%2Fimg.png)

한글 키보드로 전환시 바로 한글로 동작하도록 설정이 필요합니다.

`Korean - Hangul` 을 선택한채로 우측의 `Preference` 를 눌러주세요.  <br/><br/><br/><br/> 


![img](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FmoesZ%2FbtrVmYtfs1x%2FpM8fskh3B7skkze8WgyhDK%2Fimg.png)

이는 한글 키보드로 전환시 기본적으로 입력기의 언어를 한글모드로 만든다는 의미의 설정입니다.

위 사진처럼 `Start in hangul mode`를 체크한 뒤 아래의 `Apply` :point_right: `OK` 를 눌러 설정을 완료합니다.  <br/><br/><br/><br/>  



단 한가지 아쉬운 점은 재부팅 이후에는 우측 하단의 `ibus-panel` 보이질 않습니다. 

이는 스팀OS 데스크탑 모드의 문제로 환경 설정에 추가해도 데스크탑 세션으로 넘어올때 동작하지 않는 것 같아 보입니다.
<br/><br/>

**그러나 단축키만 등록되어 있다면 트레이 아이콘이 보이지 않아도 잘 동작하며 크롬 및 파이어 폭스, 터미널 한글 사용에 문제가 없었습니다.**<br/><br/>

**여러분 모두 한글 입력의 고통에서 벗어나시길 바랍니다.**

<br/><br/>
#### 만약 정상적인 사용이 되지 않을때 ibus 삭제시 아래 명령어 사용
```sh
curl -L https://raw.githubusercontent.com/jshsakura/steamdeck/main/ibus_uninstall.sh | sh
```

  
<br/><br/>
### 초심자를 위한 조금 더 자세한 안내
---

[스팀덱 ibus 설치 가이드](https://opencourse.kr/seutimdeg-hangeulibryeog-munje-haegyeol-ibus-seolci-gaideu/)

만약 리눅스에 대해 문외한이라 작업이 어려운 분들의 경우, 개인 블로그에 전체 과정을 작성해 두었으니 참고해보시기 바랍니다.

