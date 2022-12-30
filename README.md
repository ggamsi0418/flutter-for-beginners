# 🚀 Flutter로 웹툰 앱 만들기

## 만들어 본 것

### 1. Mobile Wallet(UI)

<img width=80% src="https://user-images.githubusercontent.com/58096698/210097126-a7f6ed47-e191-413d-91d9-c9c0e1b666c0.png"></img>

## ⚙ 환경 세팅 (Windows10 기준) ⚙

### 1. Flutter 버전 관리 매니저 설치

- 윈도우에서는 `asdf`를 이용할 수 없어 `fvm`을 사용하기로 결정
- choco를 이용하여 설치
  ```shell
  $ choco install fvm
  ```
- 명령어

  ```shell
  $ fvm releases # 원격 저장소로부터 설치 가능한 sdk 버전 확인
  $ fvm install <version> # 특정 버전 입력하여 설치. 3.3.10 설치
  $ fvm use 3.3.10 # 프로젝트 내에서 사용할 Flutter 버전을 지정 -> .fvm 폴더 생김
  ```

- 이후 터미널에서 flutter 또는 dart 명령어를 사용할 때는 항상 앞에 `fvm`을 붙여야 한다.

  ```shell
  # 예시

  $ fvm flutter --version
  $ fvm flutter run main.dart
  ```

- 참고
  - https://fvm.app/docs/getting_started/installation
  - https://velog.io/@knh4300/fvm

### 2. 비쥬얼 스튜디오 설치

- Flutter에서 Windows 데스크톱 앱으로 빌드할 때 필요
- 다음 링크에서 Visual Studio 2022 다운로드 후 설치
  - https://visualstudio.microsoft.com/ko/downloads/
  - `C++를 사용한 데스크톱 개발` 선택 후 설치

### 3. 안드로이드 스튜디오 설치 및 VDM 구성

- 안드로이드 스튜디오 다운로드 후 설치
  - https://developer.android.com/studio?hl=ko
- 기본적인 설치가 완료되면 `SDK Manager`를 통해 필요한 tool들을 설치
- 윈도우 `시스템 환경 변수 편집`에서 환경 변수 추가
- VDM에서 에뮬레이터 추가
- 참고
  - https://velog.io/@completed1991/%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4-%EC%84%A4%EC%B9%98-%EB%B0%8F-%ED%99%98%EA%B2%BD%EB%B3%80%EC%88%98-%EC%85%8B%ED%8C%85
  - https://velog.io/@qkrtnfks128/Flutter%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0%EC%9C%88%EB%8F%84%EC%9A%B0
  - https://fre2-dom.tistory.com/175

### 4. Flutter 준비 상태 확인

- ![image](https://user-images.githubusercontent.com/58096698/210065024-f2a437a2-acac-48fb-b8b8-de503b157dcf.png)

## ⚙ 환경 세팅 (WSL2 기준, 안드로이드 에뮬레이터 연동 불가) ⚙

<details>
<summary>상세 보기</summary>

### [사전준비] asdf(버전 관리 매니저) 및 flutter 설치 방법

- 참고: https://github.com/ggamsi0418/dart-for-beginners#readme

### 1. 구글 설정

- `Ubuntu(wsl2)` 내에 `크롬`을 설치한다.
  ![image](https://user-images.githubusercontent.com/58096698/209977325-b0e60494-bb52-4acf-af16-ec6406397e23.png)

- `.zshrc` 파일에 크롬 실행 경로를 추가한다.
  ```bash
  # Chrome path
  export CHROME_EXECUTABLE=/opt/google/chrome/chrome
  ```

### 2. 안드로이드 스튜디오 설치 (`에뮬레이터 구성 불가`)

```
에뮬레이터 사용이 불가하므로 안드로이드 스튜디오 설치는 필요x
```

- 홈 디렉토리(~/ or $HOME)에 `Application 폴더` 생성 후 이동

  ```shell
  $ mkdir ~/Application && cd ~/Application
  ```

- 안드로이트 스튜디오(Linux) 다운로드
  ```shell
  $ get https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.3.1.17/android-studio-2021.3.1.17-linux.tar.gz
  ```
- 압축 해제(= 설치)
  ```shell
  $ tar -xvf android-studio-2021.3.1.17-linux.tar.gz
  ```
- 안드로이드 스튜디오 실행
  ```shell
  $ sh ~/Applications/android-studio/bin/studio.sh
  ```
- 기본 설치 후 SDK TOOL에서 추가 설치
  ![image](https://user-images.githubusercontent.com/58096698/209960909-b03ffbcb-5d40-4a0c-91ad-82bb9f299783.png)

- 프로젝트 폴더로 이동하여 flutter와 안드로이드 스튜디오 연동

  ```shell
  $ cd ~/Workspace/nomad-coders/flutter-for-beginners
  $ flutter config --android-sdk $HOME/Android/Sdk
  $ flutter config --android-studio-dir $HOME/Applications/android-studio/
  ```

- 안드로이드 스튜디오 라이센스 추가 설정

  ```shell
  $ flutter doctor --android-licenses
  ```

- 마지막으로 최종 확인

  ```shell
  $ flutter doctor -v
  ```

  ![image](https://user-images.githubusercontent.com/58096698/209958812-2e6fc832-5ad4-4b0d-99fc-e1cde4cf8c83.png)

- 참고: https://addshore.com/2022/01/installing-android-studio-on-wsl2-for-flutter/

</details>
