---
title: "[Azure] Azure AI Vision Custom model 서비스 사용하기(실패)"
date: 2025-03-24 13:00:00 +0900
last_modified_at: 2025-03-24 13:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai vision

toc: true
toc_sticky: true
---

# 🎯 Azure AI Vision Custom model 서비스 사용하기

> Azure AI Vision 서비스 중 모델 학습을 하여 사용하는 방법을 알아보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. 🔧 Azure AI Vision Custom model 기본 세팅

> Azure AI Vision Custom model 서비스는 학습하는데 시간이 걸리므로 만들어두고 나중에 사용하자.

### 1.1 리소스 생성

> Computer Vision 서비스를 사용하기 위해서는 리소스를 생성해야 한다.

- Azure Portal에 들어가서 Resource Group을 들어가서 Resource를 생성하자.
- `vision` 검색 후 `Computer Vision`를 선택하자.
- 아마 `Azure 서비스만`을 체크해야 잘 찾을 수 있을 것이다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/01.png){: .align-center}

- 기본 정보를 입력하고 리소스를 만들자.
  - 지역마다 제공되는 서비스가 많이 다르므로 주의하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/02.png){: .align-center}

### 1.2 스토리지 계정 생성

> 이미지 분석 결과를 저장하기 위해 스토리지 계정을 생성하자.

- Azure Portal에 들어가서 Resource Group을 들어가서 스토리지 계정 Resource를 생성하자.
- `스토리지` 검색 후 `스토리지 계정`을 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/03.png){: .align-center}

- 기본 정보를 입력하고 스토리지 계정을 만들자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/04.png){: .align-center}

### 1.3 스토리지 계정 세팅

> 스토리지 계정을 세팅하자.

- 스토리지 계정에 컨테이너를 하나 생성하자.
  - `kitchen-data` 컨테이너로 생성했다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/05.png){: .align-center}

- 이제 컨테이너에 데이터셋을 올려보자.
  - 이번 데이터셋은 포크 이미지라서 fork로 폴더를 만들고 업로드해주었다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/06.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/07.png){: .align-center}

### 1.4 Vision Studio 세팅

- 우선 Vision Studio에 들어가서 내 리소스가 보이도록 세팅해주자.
  - 아래 `View all resources`를 눌러서 내 리소스를 한 번 확인하면 그 뒤엔 `Recent Resources`에 내 리소스가 보인다.
- 내 리소스로 들어가자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/08.png){: .align-center}

- 이제 Vision Studio에서 데이터셋 등록을 해주자.
  - 필요한 정보를 입력하고 이전에 만든 컨테이너와 연결을 해주자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/09.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/10.png){: .align-center}

- 최종적으로 이런 모습이 되고 만들기를 해주면 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/11.png){: .align-center}

### 1.5 머신러닝 데이터 라벨링 프로젝트 세팅

- 아직 머신러닝 리소스를 만든게 없어서 이름을 적고 `Create a new workspace`를 눌러주자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/12.png){: .align-center}

- Azure Machine Learning 리소스를 만들어주자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/13.png){: .align-center}

- 만든 뒤에는 `Workspace`에 바로 확인이 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/14.png){: .align-center}

- 만들어지면 `Go to Azure ML Data Labeling Project`를 눌러주자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/15.png){: .align-center}

- 최종적으로 Machine Learning Studio에 들어오게 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/16.png){: .align-center}

### 1.6 데이터 라벨링 진행

- 나는 fork 이미지를 올렸기 때문에 fork 라벨만 추가했다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/17.png){: .align-center}

- 라벨을 추가하고 `Start` 버튼을 클릭하면 라벨링 작업으로 진입할 수 있는 `Label data` 버튼이 활성화된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/18.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/19.png){: .align-center}

- `Label data` 버튼을 누르고 진입하면 라벨링 작업을 할 수 있다.
- 아래 그림처럼 직접 드래그해서 포크가 있는 위치를 잡아주자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/20.png){: .align-center}

- 라벨링을 한 뒤에 진짜 제대로 작업이 되었는지 검토를 한다.
- 나는 포크 밖에 없어서 바로 모두 approve를 눌러주었다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/21.png){: .align-center}

- 이제 dashboard에 들어가서 확인하면 모두 라벨링되었고 모두 승인되었음을 확인할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/22.png){: .align-center}

### 1.7 COCO 파일 추가하기

- 이제 라벨링 작업이 끝났으니 COCO 파일을 추가해보자.
- 아래 캡처처럼 Vision Studio에 들어가자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/23.png){: .align-center}

- `Add COCO file` 버튼을 눌러주면 아래처럼 팝업이 뜨는데, `Import COCO file from an Azure ML Data Labeling project`를 눌러주자.
- 그리고 나머지 정보도 입력하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/24.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/25.png){: .align-center}

- `json` 파일이 만들어지면 성공이다!

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/26.png){: .align-center}

### 1.8 모델 학습하기

- 이제 모델을 학습해보자.
- 모델 타입은 반드시 `Object Detection`을 선택해야 한다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/27.png){: .align-center}

- 그 외 세팅은 기본 세팅으로 진행하였다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/28.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/29.png){: .align-center}

- 모델 학습을 진행하면 처음 `Status`가 `Queued`로 변하고 조금 기다리면 `Training`으로 변한다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/30.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/31.png){: .align-center}

## 2. 🧠 모델 사용하기

- 하지만 사용해볼 수 없었다...
- 아무래도 Azure쪽에서 더이상 지원을 하지 않을 생각인 듯 하다...

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-24-use-azure-ai-vision/32.png){: .align-center}