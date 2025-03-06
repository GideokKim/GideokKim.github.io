---
title: "[Environment Setup] WSL2 설치하기"
date: 2025-03-06 18:00:00 +0900
last_modified_at: 2025-03-06 18:00:00 +0900
categories:
  - Environment Setup
tags:
  - environment setup
  - wsl2
  - setting
  - ubuntu
  - install

toc: true
toc_sticky: true
---

# 🎯 WSL2 설치하기

> Windows에서 Linux 계열의 OS를 쓸 수 있게 해주는 WSL2를 설치하는 방법을 정리한다.

## 1. 📦 WSL2 설치

> 명령어 하나로 간단히 설치해보자.

### 🌐 WSL2 설치 명령어

- Google Chrome에 enable wsl2를 검색해보자.

![Image](https://github.com/user-attachments/assets/25c114a9-b01a-4986-971a-6f90cee176d4){: .align-center}

- 바로 보이는 곳으로 접속하면 아래 명령어를 통해 설치할 것을 현재 권장하고 있다.
- PowerShell을 열어 아래 명령어를 입력하자.

```bash
wsl --install
```

![Image](https://github.com/user-attachments/assets/656a1f03-8ae3-4f5a-8efe-2316ab2556ab){: .align-center}

- Ubuntu까지 알아서 설치해준다.

![Image](https://github.com/user-attachments/assets/6f0946ff-1dbf-4b3a-95d7-905093e21161){: .align-center}

![Image](https://github.com/user-attachments/assets/02add7e9-db91-4116-a3a2-4f83a8c7403f){: .align-center}

- 이제 PC를 재시작하여 추가 설치를 진행하자.
  - 생각보다 오래 걸리니 기다려주자.
- 시작 페이지를 보면 Ubuntu가 설치되어 있는 것을 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/c2cc1396-40b1-49d3-aaab-a282245acf40){: .align-center}

![Image](https://github.com/user-attachments/assets/9c34dcf8-390d-4d59-a65d-6ca026d2b0d1){: .align-center}

## 2. 🔑 Ubuntu 계정 만들기

> WSL2는 Ubuntu 기반이기 때문에 Ubuntu 계정이 필요하다.

### user name & password 설정

- user name은 자기가 사용하고자 하는 것으로 정하자.
- 나는 `noah`로 설정했다.
- password는 반드시 들어가야 한다. 입력하지 않으면 다음으로 넘어갈 수 없다.
  - 입력해도 화면에는 표시가 되지 않는 것을 확인할 수 있는데, 입력되고 있는 것이니 계속 입력하자.

![Image](https://github.com/user-attachments/assets/5363e349-f977-40dd-b7f6-a28f6f0442f6){: .align-center}

![Image](https://github.com/user-attachments/assets/f8eb7207-faf7-4da6-8979-3de5bbbb72bd){: .align-center}


### 생성된 계정 및 WSL2 확인

- 계정이 정상적으로 생성되면 아래 캡처처럼 나오게 된다.

![Image](https://github.com/user-attachments/assets/6c04fb30-a823-4e13-9666-8e367d756163){: .align-center}

- 아래 명령어로 WSL2가 잘 설치된 것도 확인할 수 있다.

```bash
wsl --list --verbose
```

![Image](https://github.com/user-attachments/assets/8980d1b1-bb44-423f-a056-62cd1186f127){: .align-center}

## 3. 🖥️ Terminal 설정

> 이제부터 `Windows Terminal`을 사용하여 WSL2를 사용할 것이다.

### ⚙ 터미널 설정

- Windows Terminal을 열고 상단 메뉴에서 `설정`을 클릭한다.

![Image](https://github.com/user-attachments/assets/6fe28f1d-49d8-4359-a9bb-52897ca409f8){: .align-center}

- 다음과 같이 뜨는데 좌측 제일 아래 json 파일 열기를 하면 VSCode를 설치했다면 VSCode가 열린다.

![Image](https://github.com/user-attachments/assets/0023d4c9-0e00-41e1-b97b-5f437742710a){: .align-center}

- VSCode가 열리면 아래로 스크롤해서 `"source": "CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc"` 위에 있는 name 부분을 WSL2로 변경해주자.

![Image](https://github.com/user-attachments/assets/c7222944-bed2-4143-86af-9c3eae59b4ff){: .align-center}

- 이제는 WSL2로 보이는 것을 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/0f546186-0b41-418e-8453-9f21dcb032f5){: .align-center}

- 그리고 디폴트 터미널을 우분투로 해주기 위해 `"defaultProfile":`을 변경해주자. 아마 최초는 PowerShell의 guid가 있을텐데 WSL2의 guid로 변경해주면 된다.

![Image](https://github.com/user-attachments/assets/9db16072-8342-4034-967a-e04af6549bac){: .align-center}

- 이제 터미널을 열면 WSL2로 열리는 것을 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/c8082c50-613b-4c2c-9301-aaac17e69722){: .align-center}

