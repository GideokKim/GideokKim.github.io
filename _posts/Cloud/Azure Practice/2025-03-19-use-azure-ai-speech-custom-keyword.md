---
title: "[Azure] Azure AI Speech - 사용자 지정 키워드(Custom Keyword) 사용하기"
date: 2025-03-19 10:00:00 +0900
last_modified_at: 2025-03-19 10:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai speech
  - azure custom keyword

toc: true
toc_sticky: true
---

# 🎯 Azure AI Speech - 사용자 지정 키워드(Custom Keyword) 사용하기

> Azure AI Speech Service에서 사용자 지정 키워드를 사용해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. 🔧 사용자 지정 키워드 세팅하기

> 사용자 지정 키워드는 학습하는데 시간이 걸리므로 만들어두고 나중에 사용하자.

### 1.1 비디오 번역 기본 세팅

- Azure Portal에 들어가서 이전에 생성한 Speech Resource에 들어가면 Speech Studio에 들어가는 버튼이 있다.

![Image](https://github.com/user-attachments/assets/c62f1311-21ae-45da-bf6a-5768eade1715){: .align-center}

- Speech Studio에 들어가서 스크롤을 내리면 보이는 `사용자 지정 키워드(Custom Keyword)`를 선택하자.

![Image](https://github.com/user-attachments/assets/76d64777-9bdc-4ebe-a1f8-522ccf6c80e0){: .align-center}

- 프로젝트를 생성하자.
- 현재는 프로젝트 생성에 옵션이 많이 없고 언어 선택도 제한적이다.

![Image](https://github.com/user-attachments/assets/29587fc4-46a4-4c96-821e-49ca4d3d4b86){: .align-center}

### 1.2 모델 생성

- `새 모델 만들기`로 모델을 생성할 수 있다.
- 현재는 키워드가 Hey Computer를 해야 가장 잘 잡아낸다고 한다.
- 나머지 옵션은 크게 건드릴 부분이 없다.

![Image](https://github.com/user-attachments/assets/8cb765c3-dc54-41bd-97cc-27c97412d5bc){: .align-center}

## 2. 🤖 사용자 지정 키워드 테스트

> 학습이 완료되면 모델 테스트가 가능하다.

- 최초 모델 테스트로 들어가면 `구성`쪽에 기본값으로 안적혀 있고 로딩 시간이 좀 필요하니 기다리자.
- 나는 바로 마이크로 테스트를 시작했다.

![Image](https://github.com/user-attachments/assets/ad39a4ea-31cc-4c62-bc3d-7e928f55a05d){: .align-center}

- `Hey Computer`라고 마이크로 말하면 인식을 한다.
  - 마치 우리가 빅스비나 시리를 사용하는 것과 같다고 생각하면 된다.

![Image](https://github.com/user-attachments/assets/3021f7b3-9e1a-41c8-b3cc-db8cb51b9e30){: .align-center}