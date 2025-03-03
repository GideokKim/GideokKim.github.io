---
title: "[Environment Setup] WSL2에서 한글 설정하기"
date: 2025-03-03 16:00:00 +0900
last_modified_at: 2025-03-03 16:00:00 +0900
categories:
  - Environment Setup
tags:
  - environment setup
  - wsl2
  - korean
  - setting
  - ubuntu
  - locale
  - font
  - fontconfig

toc: true
toc_sticky: true
---

# 🎯 WSL2에서 한글 설정하기

> WSL2에서 한글 설정하는 방법을 정리한다.

## 1. ✅ locale 설정

> locale 목록을 확인하고 한글 locale을 설정하자.

### 🚧 locale 목록 확인

```bash
locale -a
```

- 위 명령어를 입력하면 터미널에서 현재 설정된 locale 목록을 확인할 수 있다.
- 내가 확인했을 때는 한글이 없어 보인다. 한글 로케일을 설정해보자.

![Image](https://github.com/user-attachments/assets/d4d1aced-7000-4df5-baf8-c33e318d56ac){: .align-center}

### 📦 한글 locale 생성 및 설정

```bash
sudo apt update
```

```bash
sudo apt install language-pack-ko
```

```bash
sudo locale-gen ko_KR.UTF-8
```

```bash
sudo update-locale LANG=ko_KR.UTF-8
```

```bash
sudo update-locale LANG=ko_KR.UTF-8
```

## 2. 📦 한글 폰트 다운로드 및 설정

> 한글 폰트를 다운로드 및 설정하자.

### 📦 한글 폰트 다운로드

- 필요한 패키지 설치

```bash
sudo apt install -y fonts-nanum fonts-nanum-coding fonts-nanum-extra
```

- fontconfig 설치

```bash
sudo apt install fontconfig
```

- 폰트 캐시 생성

```bash
sudo fc-cache -fv
```

- local.conf 파일 수정

```bash
sudo vim /etc/fonts/local.conf
```

- 파일 내에 다음 내용 추가

```bash
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <alias>
        <family>sans-serif</family>
        <prefer>
            <family>Nanum Gothic</family>
        </prefer>
    </alias>
    <alias>
        <family>serif</family>
        <prefer>
            <family>Nanum Myeongjo</family>
        </prefer>
    </alias>
    <alias>
        <family>monospace</family>
        <prefer>
            <family>Nanum Gothic Coding</family>
        </prefer>
    </alias>
</fontconfig>
```
