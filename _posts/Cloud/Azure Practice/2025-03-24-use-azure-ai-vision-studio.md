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

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/01.png){: .align-center}

- 기본 정보를 입력하고 리소스를 만들자.
  - **지역마다 제공되는 서비스가 많이 다르므로 주의하자.**

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/02.png){: .align-center}

## 2. Azure AI Vision Studio 사용하기

### 2.1 Detect common objects in images

> 이미지에서 일반적인 객체를 감지하는 서비스이다.

- 모델을 학습하는 것이 아니라 이미 학습된 모델을 사용하는 서비스이다.
- Vision Studio에 들어가서 `Detect common objects in images`를 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/03.png){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/04.png){: .align-center}

### 2.2 Add captions to images

> 이미지에 대한 설명을 추가하는 서비스이다. 한 문장으로 해준다.

- Vision Studio에 들어가서 `Add captions to images`를 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/05.png){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/06.png){: .align-center}

### 2.3 Add dense captions to images

> 이미지에 대한 설명을 추가하는 서비스이다. 위와 다른 특징은 사진마다 바운딩 박스가 생기고 바운딩 박스마다 캡션이 생긴다는 점이다.

- Vision Studio에 들어가서 `Add dense captions to images`를 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/07.png){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.
  - 이전과는 다르게 여러 바운딩 박스가 생긴 것을 확인할 수 있고 각 바운딩 박스마다 캡션이 있다.
  - json으로 보면 confidence도 있는 것을 확인할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/08.png){: .align-center}

### 2.4 Extract common tags from images

> 수천 개의 인식 가능한 객체, 생물, 풍경 및 행동을 기반으로 태그를 추출한다.

- Vision Studio에 들어가서 `Extract common tags from images`를 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/09.png){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/10.png){: .align-center}

### 2.5 Create smart-cropped images

> 이미지를 자동으로 자르기하여 이미지의 가장 중요한 영역을 강조한다.

- Vision Studio에 들어가서 `Create smart-cropped images`를 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/11.png){: .align-center}

- 이미지를 업로드하고 결과를 확인할 수 있다.
  - 자동으로 잘라주는 기능인데, 굳이 쓸 일이 있을까 싶은 수준의 결과를 보여준다.
  - ~~딱히 smart하다고 보기 힘든 기능~~

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision-studio/12.png){: .align-center}