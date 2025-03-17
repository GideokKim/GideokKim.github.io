---
title: "[Azure] Azure AI Speech - Custom Speech 만들기"
date: 2025-03-17 18:00:00 +0900
last_modified_at: 2025-03-17 18:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai speech
  - azure custom speech 

toc: true
toc_sticky: true
---

# 🎯 Azure AI Speech - Custom Speech 만들기

> Azure AI Speech Service에서 Custom Speech를 만들어보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. 🔧 Custom Speech 세팅하기

1. 프로젝트를 만들고 모델의 fine tuning을 위한 텍스트 파일을 업로드한다.
2. 모델 테스트를 하기 위한 오디오 데이터 세트를 업로드한다.

### 1.1 Speech Studio 기본 세팅

- Azure Portal에 들어가서 이전에 생성한 Speech Resource에 들어가면 Speech Studio에 들어가는 버튼이 있다.

![Image](https://github.com/user-attachments/assets/c62f1311-21ae-45da-bf6a-5768eade1715){: .align-center}

- Speech Studio에 들어가서 스크롤을 내리면 보이는 `Custom Speech`를 선택하자.

![Image](https://github.com/user-attachments/assets/0a67f20b-5b96-4b07-b4c9-d49cefec71c3){: .align-center}

- 들어가서 `Custom Speech 프로젝트`를 선택하자.

![Image](https://github.com/user-attachments/assets/40bddc40-0dbf-4fd9-a0cc-c612c614b959){: .align-center}

- 진행하고자 하는 프로젝트의 정보를 넣고 프로젝트를 만들자.
- 만들게 되면 아래 화면처럼 금방 만들어진다.

![Image](https://github.com/user-attachments/assets/b090183a-9ad9-4fb7-b803-a01c1d20b33a){: .align-center}

![Image](https://github.com/user-attachments/assets/6b79c156-e47f-48c8-9118-febdbb71a9b8){: .align-center}

### 1.2 음성 데이터 세트 설정 - txt 파일

- 프로젝트가 생성되어 들어가보면 음성 데이터 세트 데이터를 업로드할 수 있다.

![Image](https://github.com/user-attachments/assets/83433fd3-736f-44cd-a439-bbb0e5b3e1c6){: .align-center}

- 나는 예시 데이터인 txt 파일을 업로드하기로 했다.
- 이미 준비된 txt 파일을 끌어다가 업로드했다.
- 이후 설정들은 크게 건드리지 않아도 되므로 `다음`을 클릭하여 `저장 후 닫기`를 눌러 끝내자.

![Image](https://github.com/user-attachments/assets/bc3ffcc0-f98b-4098-86c6-d5e0afdb2647){: .align-center}

![Image](https://github.com/user-attachments/assets/d200fb30-2874-40bb-8052-3c40c8ec0e40){: .align-center}

### 1.3 사용자 지정 모델 학습

- 업로드한 txt 파일을 사용하여 사용자 지정 모델 학습을 진행하자.
- 모델 선택은 원하는 모델로 선택하면 되고 이름 및 설명도 마음대로 작성하면 된다.
  - 이후 `저장 후 닫기`를 하면 모델 학습이 진행된다.
- 참고로 모델 학습은 생각보다 오래 걸리므로 좀 기다려야 한다.

![Image](https://github.com/user-attachments/assets/1f8f2041-08b2-467f-9ef0-ee838eafc255){: .align-center}

### 1.4 음성 데이터 세트 설정 - 오디오 데이터 세트

- 준비된 오디오 데이터 세트를 zip 파일 형태로 업로드하자.
- txt 파일과 마찬가지로 이미 준비된 오디오 데이터 세트를 끌어다가 업로드했다.

![Image](https://github.com/user-attachments/assets/8ae55120-bb20-4301-a1e6-edf52ee61a4b){: .align-center}

![Image](https://github.com/user-attachments/assets/b0bc30d4-2ac1-4ff5-822e-0636c4c1dabd){: .align-center}

![Image](https://github.com/user-attachments/assets/7ff64f1d-22d4-46d3-aa6e-d88f276a71a6){: .align-center} 
