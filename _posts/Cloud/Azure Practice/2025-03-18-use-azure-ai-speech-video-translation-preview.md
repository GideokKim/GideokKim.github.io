---
title: "[Azure] Azure AI Speech - 비디오 번역(Video Translation) 사용하기"
date: 2025-03-18 20:00:00 +0900
last_modified_at: 2025-03-18 20:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai speech
  - azure video translation

toc: true
toc_sticky: true
---

# 🎯 Azure AI Speech - 비디오 번역(Video Translation) 사용하기

> Azure AI Speech Service에서 비디오 번역을 사용해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*
- *🌟특히 Video Translation은 미리 보기 기능이므로 나중에 없어질 수도 있다....!!🌟*


## 1. 🔧 비디오 번역 세팅하기

> 비디오 번역의 경우 딱히 세팅할 부분이 없어 거의 바로 사용할 수 있다.

### 1.1 비디오 번역 기본 세팅

- Azure Portal에 들어가서 이전에 생성한 Speech Resource에 들어가면 Speech Studio에 들어가는 버튼이 있다.

![Image](https://github.com/user-attachments/assets/c62f1311-21ae-45da-bf6a-5768eade1715){: .align-center}

- Speech Studio에 들어가서 스크롤을 내리면 보이는 `비디오 번역(Video Translation)`을 선택하자.

![Image](https://github.com/user-attachments/assets/39ec1bf6-6fd8-4a1e-adce-8d55a0bbc863){: .align-center}

- 프로젝트를 생성하자.
- `음성 유형`을 `개인 보이스`로 하면 바로 사용해볼 수 있다.
- 나는 테스트용 비디오가 스페인어 영상이라 `비디오의 언어`를 스페인어로 선택하였다.

![Image](https://github.com/user-attachments/assets/97ef21e6-d645-4421-9aae-048f74874434){: .align-center}

## 2. 🤖 비디오 번역 테스트

> 학습 필요 없이 바로 결과물이 나온다.

- 영상을 재생하면 스페인어 영상에 한국어 자막도 생기고 옆에 스크립트 표현도 나온다!
- 영상 다운로드도 가능하다!
- 이 정도 퀄리티면 진짜 쓸 수 있는 곳이 많을 것 같다.

![Image](https://github.com/user-attachments/assets/652ace1c-1f5f-48af-8e39-6e556a268e8e){: .align-center}