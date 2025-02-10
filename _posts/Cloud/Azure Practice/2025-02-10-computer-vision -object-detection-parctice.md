---
title: "[Azure] Custom Vision을 사용하여 객체 감지 서비스를 노코딩으로 구현하기"
date: 2025-02-10 11:00:00 +0900
last_modified_at: 2025-02-10 11:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - custom vision
  - object detection
  - no-code
  - computer vision

toc: true
toc_sticky: true
---

# 🎯 Custom Vision 개체 감지 AI 모델을 노코딩으로 구현하기

> Azure의 Custom Vision 서비스를 활용해서 특정 개체를 감지하는 애플리케이션을 만들어본다

## 1. 🔍 Object Detection 과정

### 1단계: 데이터 준비

- 다양한 변형을 찾을 수 있도록 가능한 한 많은 이미지를 수집한다.

### 2단계: 특징 추출

- 인간의 뇌는 각 이미지에서 특징을 추출하려고 한다. 특징에는 색 조합, 날카로운 가장자리, 원형 패턴, 표면의 질감, 크기 등이 있다. 인간의 뇌는 자연스럽게 이러한 특징들을 고려하여 분류를 진행한다. AI에서는 이러한 특징을 말그대로 **특징 (feature)**이라고 한다

### 3단계: 관계 찾기

- 인간은 사진에 표시된 개체의 특징과 종류 간의 관계를 찾으려고 한다. 뇌는 각 개체 종류의 특성 및 특징을 분리하거나 대조하려고 한다.

### 4단계: 종류 분류

- 새로운 이미지가 제공되면 뇌는 해당 특성을 추출하고 이미 만들어 놓은 연관 관계를 사용하여 개체 종류를 결정한다.

## 2. 💡 Custom Vision으로 객체 감지 모델 만들기

### 1단계: Azure Custom Vision 리소스 만들기

- Azure Portal에 접속하여 Custom Vision 리소스를 만든다.

![Image](https://github.com/user-attachments/assets/cdbd4525-aed7-4e2a-8970-294140e7c7fa){: .align-center}

- Custom Vision을 검색하여 결과에서 **Custom Vision** 리소스를 선택한다.
  - 만들기에 있는 옵션들은 이름만 내가 정하고 나머지는 기본값으로 설정한다.
  - East US 리전을 선택한 이유는 여기에 custom vision으로 제공하는 기능이 많기 때문이다.
  - 나는 이미 만들어둔 리소스가 있어서 그 리소스를 뒤에서부터는 그 리소스를 사용할 것이다.

![Image](https://github.com/user-attachments/assets/748e6a6f-3ebf-4da1-aaa2-cc9e9f133248){: .align-center}

![Image](https://github.com/user-attachments/assets/c36cbea1-ed86-4366-9fd7-ecc58ad7564c){: .align-center}

### 2단계: 프로젝트 만들기

- 리소스 그룹으로 가면 내가 만든 custom vision 리소스가 있다.
  - 만들어진 리소스(`6b005cv20250210`)를 클릭하여 들어가자.
  - `Custom Vision 포털에서 서비스 이용해 보기`가 있고 Custom Vision 포털로 이동할 수 있는 링크가 있는데 그걸 클릭한다.

![Image](https://github.com/user-attachments/assets/30465bda-205a-4108-ad73-74952dcc2d89){: .align-center}

- `SIGN IN` 버튼을 클릭하여 로그인 후 프로젝트를 만들 수 있는 페이지로 이동한다.

![Image](https://github.com/user-attachments/assets/347bdc3b-969b-464e-9032-d0052940570c){: .align-center}

- 프로젝트 이름을 입력하고 반드시 **내가 만든 custom vision 리소스의 이름을 입력해야 한다.**

![Image](https://github.com/user-attachments/assets/ec5158e5-7c31-4d6b-8286-cd589c5c1d32){: .align-center}

### 3단계: 데이터 업로드 및 전처리

- training 데이터(bungee image 15장)를 업로드 한다.
  - bungee는 오버 더 문 애니메이션에 나오는 캐릭터이다.
- 업로드한 데이터는 전부 untagged 데이터이므로 하나하나 태그를 붙여줘야 한다.

![Image](https://github.com/user-attachments/assets/cfd941e8-6a81-4a16-af4a-e7422b375249){: .align-center}

- 이미지를 클릭하고 bungee로 보이는 위치에 마우스 커서를 올리면 자동으로 태그를 붙일 박스가 생긴다.
  - 박스 위치가 마음에 안들면 모서리를 드래그하여 조정할 수 있다.
- 박스를 클릭하면 태그 이름을 붙일 수 있다.
- 모든 데이터에 태그를 붙여주자.

![Image](https://github.com/user-attachments/assets/3afd08d4-fbb9-46ef-a2d0-c86876fa7888){: .align-center}

### 4단계: 모델 훈련

- 우측 상단에 있는 `Train` 버튼을 클릭하여 모델을 훈련한다.
  - 훈련 시간은 몇 분 정도 걸린다.

![Image](https://github.com/user-attachments/assets/4deaaeef-35b8-4bde-94d0-795a4498edf9)

- 훈련이 완료되면 아래와 같은 화면이 보이고 우측 상단에 `Test` 버튼을 클릭하여 모델을 테스트할 수 있다.
  - `Precision`, `Recall` 등의 지표가 좋지 않게 나왔다.(이전에 했을 때는 괜찮게 나왔지만...)
- custom vision으로 훈련을 할 때 사용자가 제어할 수 있는 부분은 태그 정도라 나머지 파라미터가 랜덤이고 원래 코드에서 제아할 수 있는 하이퍼 파라미터를 건들지 못해서 이렇게 될 수도 있다.
  - ~~노코딩이라 쉽지만 그만큼 퍼포먼스를 끌어올리기 쉽지 않다.~~

![Image](https://github.com/user-attachments/assets/77486dab-59d3-4802-9f3d-3f00ff237be1)