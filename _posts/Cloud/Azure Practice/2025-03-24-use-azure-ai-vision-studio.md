---
title: "[Azure] Azure AI Vision Studio 사용하기"
date: 2025-03-24 18:00:00 +0900
last_modified_at: 2025-03-24 18:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai vision
  - azure ai vision studio

toc: true
toc_sticky: true
---

# 🎯 Azure AI Vision Studio 사용하기

> Azure AI Vision Studio를 사용하여 이미지 분석, 비디오 분석, 문서 분석 등을 해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. 🔧 Azure AI Vision Studio 기본 세팅

> Azure AI Vision Studio에 있는 서비스들은 리소스의 지역에 따라 사용 가능한 서비스가 다르므로 잘 보고 만들어야 한다.

### 1.1 리소스 생성

> Computer Vision 서비스를 사용하기 위해서는 리소스를 생성해야 한다.

- Azure Portal에 들어가서 Resource Group을 들어가서 Resource를 생성하자.
- `vision` 검색 후 `Computer Vision`를 선택하자.
- 아마 `Azure 서비스만`을 체크해야 잘 찾을 수 있을 것이다.

![Image](https://github.com/user-attachments/assets/5985c7c6-3f8a-4d4a-a3f5-79c43dcefcaa){: .align-center}

- 기본 정보를 입력하고 리소스를 만들자.
  - 지역마다 제공되는 서비스가 많이 다르므로 주의하자.

![Image](https://github.com/user-attachments/assets/8f16cc55-ca8c-4752-bde4-115cbc82199a){: .align-center}

## 2. Azure AI Vision Studio 사용하기

### 2.1 Detect common objects in images

> 이미지에서 일반적인 객체를 감지하는 서비스이다.

- 모델을 학습하는 것이 아니라 이미 학습된 모델을 사용하는 서비스이다.
- Vision Studio에 들어가서 `Detect common objects in images`를 선택하자.

![Image](https://github.com/user-attachments/assets/3461f131-6e22-4530-8104-f6461e1dd7fa){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/74c12a70-cc28-4177-a50b-49861fe26736){: .align-center}

### 2.2 Add captions to images

> 이미지에 대한 설명을 추가하는 서비스이다. 한 문장으로 해준다.

- Vision Studio에 들어가서 `Add captions to images`를 선택하자.

![Image](https://github.com/user-attachments/assets/1d85f446-0246-41d4-a1da-479256959d23){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/752f89b5-30e8-4a05-bcee-06f17caeb73b){: .align-center}

### 2.3 Add dense captions to images

> 이미지에 대한 설명을 추가하는 서비스이다. 위와 다른 특징은 사진마다 바운딩 박스가 생기고 바운딩 박스마다 캡션이 생긴다는 점이다.

- Vision Studio에 들어가서 `Add dense captions to images`를 선택하자.

![Image](https://github.com/user-attachments/assets/15656a41-4e5c-4bad-9ffb-b6531eb527c1){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.
  - 이전과는 다르게 여러 바운딩 박스가 생긴 것을 확인할 수 있고 각 바운딩 박스마다 캡션이 있다.
  - json으로 보면 confidence도 있는 것을 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/d0a7790d-d3a9-4acc-ab9c-d2ee4a065b45){: .align-center}

### 2.4 Extract common tags from images

> 수천 개의 인식 가능한 객체, 생물, 풍경 및 행동을 기반으로 태그를 추출한다.

- Vision Studio에 들어가서 `Extract common tags from images`를 선택하자.

![Image](https://github.com/user-attachments/assets/3be56a5d-2dfc-491d-8d6d-90f1b406ea8d){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/1faecc0b-1a28-4e68-b639-90d2fc20f5af){: .align-center}

### 2.5 Create smart-cropped images

> 이미지를 자동으로 자르기하여 이미지의 가장 중요한 영역을 강조한다.

- Vision Studio에 들어가서 `Create smart-cropped images`를 선택하자.

![Image](https://github.com/user-attachments/assets/f18a68fd-9907-49f9-8920-8c177635a4c8){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.
  - 자동으로 잘라주는 기능인데, 굳이 쓸 일이 있을까 싶은 수준의 결과를 보여준다.
  - ~~딱히 smart하다고 보기 힘든 기능~~

![Image](https://github.com/user-attachments/assets/65ef8357-6fa9-40df-b349-3cc633f9e260){: .align-center}