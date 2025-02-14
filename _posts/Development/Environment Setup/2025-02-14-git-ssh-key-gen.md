---
title: "[Environment Setup] Git & GitHub SSH Key 생성 및 연동하기"
date: 2025-02-14 13:00:00 +0900
last_modified_at: 2025-02-14 13:00:00 +0900
categories: 
  - Environment Setup
tags:
  - environment setup
  - git
  - github
  - ssh key
toc: true
toc_sticky: true
---

# 🎯 Git & GitHub SSH Key 생성 및 연동하기

>  Windows 환경에서 GitHub 연동을 위한 SSH Key를 생성하고 연동하는 방법을 정리한다.

## 1. 🔑 SSH Key 생성

> 아래 명령어를 실행하여 SSH Key를 생성한다.

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- 명령어를 친 이후에 파일 저장 위치나 패스워드 설정이 있는데, 그냥 전부 엔터로 넘어갔다. ~~보안상 패스워드를 설정하는 것이 좋겠지만, 귀찮아서 엔터로 넘어갔다.~~

![Image](https://github.com/user-attachments/assets/ab8d0eca-37c1-4922-b33a-585efaca4575){: .align-center}

### 🧠 RSA vs ED25519

> SSH Key 생성 관련 블로그 포스팅들을 보면 암호화 방식에 따라 명령어들이 다르다. RSA 방식과 ED25519 방식이 있는데, 둘의 차이는 암호화 방식의 차이이다.

- 현재 권장하는 암호화 방식은 ED25519 방식이다.
- 성능이 더 빠르다고 하는데, 우리가 신경 쓸만한 수준은 아닌 것 같다.

## 2. 🔄 생성한 SSH Key 연동

### 📝 SSH Key 복사

> public key를 클립보드에 복사하여 GitHub에 붙여넣기 한다.

```bash
Get-Content ~\.ssh\id_ed25519.pub | Set-Clipboard
```

### 🔄 SSH Key 연동

- GitHub에 들어가서 내 프로필의 `Settings`에 들어가서 `SSH and GPG keys` 탭에 들어간다.

![Image](https://github.com/user-attachments/assets/716af3d5-8cd3-43f4-a3a3-17653afff819){: .align-center}

![Image](https://github.com/user-attachments/assets/70644a96-6180-4deb-8805-af53c7571bbd){: .align-center}

- `New SSH key` 버튼을 눌러 위에서 복사한 public key를 붙여넣기 한다.

![Image](https://github.com/user-attachments/assets/f8a67d93-3654-4c6c-bd5f-e3ad47a5a7ab){: .align-center}

![Image](https://github.com/user-attachments/assets/135d1f70-4e25-455c-95f1-d637d698a661){: .align-center}

- 정상적으로 연동되면 아래와 같은 화면이 나온다.

![Image](https://github.com/user-attachments/assets/27f12c72-1a3f-49bf-9fd0-fd926e4e91f1){: .align-center}

## 3. ✅ 연동 확인

> git clone 명령어로 연동을 확인한다.

- `code .` 명령어로 터미널에서 바로 VSCode를 열 수 있다.

```bash
# git clone git@github.com:Gideok/food-decoder.git
git clone git@github.com:username/repository.git
```

![Image](https://github.com/user-attachments/assets/6515f19d-96b4-4b68-aa39-90f62800c1a6){: .align-center}

![Image](https://github.com/user-attachments/assets/957926d7-ebdc-45ff-a981-d4a1dcd6765a){: .align-center}