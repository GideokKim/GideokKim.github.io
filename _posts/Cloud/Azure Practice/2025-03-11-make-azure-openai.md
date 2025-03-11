---
title: "[Azure] Azure OpenAI Service 만들기"
date: 2025-03-11 11:00:00 +0900
last_modified_at: 2025-03-11 11:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - openai
  - azure portal

toc: true
toc_sticky: true
---

# 🎯 Azure OpenAI Service 만들기

> Azure에 있는 Azure OpenAI Service를 만들어보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*

## 1. ✨ Azure OpenAI Service란?

> Azure OpenAI Service는 OpenAI의 강력한 언어 모델에 대한 접근을 제공한다. 이 서비스는 최신 OpenAI 모델을 포함(아무래도 Microsoft가 OpenAI의 지분을 확보하고 있기 때문에)하며, 특정 작업에 쉽게 적응할 수 있다. 이러한 작업에는 콘텐츠 생성, 요약, 이미지 이해, 의미 검색, 자연어를 코드로 변환하는 작업 등이 포함된다.

## 2. 📦 Azure OpenAI Service 만들기

> Azure Portal에 로그인 후 Azure OpenAI Service를 만들어보자.

- Azure Portal에서 내 리소스 그룹에 들어가서 `만들기` 클릭

![Image](https://github.com/user-attachments/assets/f7554c82-c9ab-47bb-9a8a-1de395bb4863){: .align-center}

- openai 검색 후 `Azure OpenAI` 클릭

![Image](https://github.com/user-attachments/assets/072f0fb0-4daa-4687-8df7-dac341fa5f92){: .align-center}

- `만들기` 클릭

![Image](https://github.com/user-attachments/assets/619e769b-d8c8-44cf-927f-7390fc8addd4){: .align-center}

- 인스턴스 세부 정보를 입력하자.
  - 지역은 할당 받은 지역을 선택하자. 하지만 지역별로 기능이 다를 수도 있으니 언제나 공식 문서를 참고하자.

![Image](https://github.com/user-attachments/assets/0f4afa26-cb52-4697-9dd5-2c73e33cfb54){: .align-center}

- 다른 설정은 수정하지 않고 `만들기`를 클릭하면 리소스가 생성된다.

![Image](https://github.com/user-attachments/assets/89c2ae0d-a81a-420c-875a-c513f7f68942){: .align-center}

- 만들어지면 선택한 리소스 그룹에 들어가서 리소스를 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/8048bba0-c501-4a33-9c58-df3690c17e54){: .align-center}