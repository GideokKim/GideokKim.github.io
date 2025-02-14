---
title: "[Environment Setup] gitmoji를 사용하여 가독성 있는 커밋 메시지 작성하기"
date: 2025-02-14 16:00:00 +0900
last_modified_at: 2025-02-14 16:00:00 +0900
categories: 
  - Environment Setup
tags:
  - environment setup
  - git
  - github
  - gitmoji
  - commit message

toc: true
toc_sticky: true
---

# 🎯 gitmoji를 사용하여 가독성 있는 커밋 메시지 작성하기

> gitmoji를 사용하여 가독성 있는 커밋 메시지를 작성하는 방법을 정리한다.

## 1. 📦 node.js 설치

> Windows 환경에서 node.js를 설치하는 방법을 정리한다.

- 우선 google에 nodejs를 검색하여 [Download Node](https://nodejs.org/ko/download)로 들어가보자.

![Image](https://github.com/user-attachments/assets/2df7660e-ce4c-4a70-8b1f-b9f8dc444381){: .align-center}

- LTS 중 최신 버전을 선택하여 설치에 필요한 명령어들을 얻는다.
  - **관리자 권한의 cmd 창에서 설치 명령어를 입력하여 설치를 진행한다.**

```bash
# fnm 다운로드 및 설치:
winget install Schniz.fnm

# Node.js 다운로드 및 설치:
fnm install 22

# Node.js 버전 확인:
node -v # "v22.14.0"가 출력되어야 합니다.

# npm 버전 확인:
npm -v # 10.9.2가 출력되어야 합니다.
```

![Image](https://github.com/user-attachments/assets/a71b34c9-cd6a-4558-9497-bbfbe6871c1b){: .align-center}

![Image](https://github.com/user-attachments/assets/3cc01dd8-e753-45f8-bb47-b563014268ee){: .align-center}

![Image](https://github.com/user-attachments/assets/81bb907d-30bb-4df4-97c7-7a6c1df853b3){: .align-center}

### 🚧 Windows 환경 변수 설정

- 시작 메뉴에서 `시스템 환경 변수 편집`을 검색하여 클릭한다.

![Image](https://github.com/user-attachments/assets/2c7048dd-3803-4f3e-887e-4747a02c666c){: .align-center}

![Image](https://github.com/user-attachments/assets/845850ee-59b6-447c-bb99-32329a986e73){: .align-center}

- 환경 변수 편집 창에서 `시스템 변수` 탭에 들어가서 `Path` 변수를 클릭한다.
- `nodejs` 설치 경로를 추가한다.
  - 나의 경우 `C:\Users\EL020\AppData\Roaming\fnm\node-versions\v22.14.0\installation`에 있었으므로 참고하자.

![Image](https://github.com/user-attachments/assets/9988ae38-13aa-422a-ab87-593d3b2efd6a){: .align-center}

### ✅ `npm` 및 `node` 버전 확인

> 터미널에서 아래 명령어를 입력하여 `npm` 및 `node` 버전을 확인한다.

```bash
npm -v
node -v
```

## 2. 📦 gitmoji 설치

> [gitmoji](https://gitmoji.dev/)를 살펴보면 이번 커밋이 어떤 작업을 한 것인지 한눈에 알 수 있다.

![Image](https://github.com/user-attachments/assets/81acf994-5102-4c80-920c-37045d14bf1b){: .align-center}

- 아래 명령어로 바로 설치가 가능하다.

```bash
npm install -g gitmoji-cli
```

### ✅ 설치 확인

> 터미널에서 아래 명령어를 입력하여 설치가 정상적으로 되었는지 확인한다.

```bash
gitmoji --version
```

## 3. 🎨 gitmoji 사용해보기

> 내가 수정한 파일 하나를 stage에 올리고 터미널에서 아래 명령어를 입력하여 gitmoji를 사용해보자.

```bash
gitmoji -c
```

- ~~생각보다 로딩 시간을 먹긴하는데, 가독성이 좋고 보기 좋으니 참고 쓰자.~~
- 터미널 창에서 화살표 위아래를 누르면 이모지를 선택할 수 있다. 선택 후 엔터를 치자.

![Image](https://github.com/user-attachments/assets/f4f29a0c-c05f-4f03-936a-bcc2cd751105){: .align-center}

- 이후 commit title을 적으면 된다.

![Image](https://github.com/user-attachments/assets/e9f6d4a8-e9ac-4a96-9bf4-ba7a82cea522){: .align-center}

- commit title을 적고 엔터를 치면 commit message를 작성할 수 있다. 필요하면 적고 엔터를 치면 커밋이 완료된다.
  - 필요 없다고 생각이 들면 엔터로 넘어가면 된다.

![Image](https://github.com/user-attachments/assets/fe3e79fa-1229-4a41-8937-a2a635e6645d){: .align-center}

- 아래는 커밋이 된 모습이다.

![Image](https://github.com/user-attachments/assets/61f9acb0-76d7-46ca-ac0f-dbbaeab0878b){: .align-center}