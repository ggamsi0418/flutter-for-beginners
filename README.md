# 🚀 Flutter로 웹툰 앱 만들기

## ⚙ 환경 세팅 (WSL2 기준) ⚙

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

### 2. 안드로이드 스튜디오 설치 (`현재 에뮬레이터 실행하는 것은 실패`)

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
