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

![Image](https://github.com/user-attachments/assets/5985c7c6-3f8a-4d4a-a3f5-79c43dcefcaa){: .align-center}

- 기본 정보를 입력하고 리소스를 만들자.
  - 지역마다 제공되는 서비스가 많이 다르므로 주의하자.

![Image](https://github.com/user-attachments/assets/8f16cc55-ca8c-4752-bde4-115cbc82199a){: .align-center}

### 1.2 스토리지 계정 생성

> 이미지 분석 결과를 저장하기 위해 스토리지 계정을 생성하자.

- Azure Portal에 들어가서 Resource Group을 들어가서 스토리지 계정 Resource를 생성하자.
- `스토리지` 검색 후 `스토리지 계정`을 선택하자.

![Image](https://github.com/user-attachments/assets/9b61031e-5b97-4567-80e8-0ec57564d8ef){: .align-center}

- 기본 정보를 입력하고 스토리지 계정을 만들자.

![Image](https://github.com/user-attachments/assets/27196505-5e38-4198-99c4-ca5eb580e191){: .align-center}

### 1.3 스토리지 계정 세팅

> 스토리지 계정을 세팅하자.

- 스토리지 계정에 컨테이너를 하나 생성하자.
  - `kitchen-data` 컨테이너로 생성했다.

![Image](https://github.com/user-attachments/assets/442c3140-8478-4603-9023-1baf8cc74564){: .align-center}

- 이제 컨테이너에 데이터셋을 올려보자.
  - 이번 데이터셋은 포크 이미지라서 fork로 폴더를 만들고 업로드해주었다.

![Image](https://github.com/user-attachments/assets/1180d532-4ae7-4714-99b7-7648afea7d20){: .align-center}

![Image](https://github.com/user-attachments/assets/3e32e5ae-1164-45a0-8930-4da9760b6b2c){: .align-center}

### 1.4 Vision Studio 세팅

- 우선 Vision Studio에 들어가서 내 리소스가 보이도록 세팅해주자.
  - 아래 `View all resources`를 눌러서 내 리소스를 한 번 확인하면 그 뒤엔 `Recent Resources`에 내 리소스가 보인다.
- 내 리소스로 들어가자.

![Image](https://github.com/user-attachments/assets/0351c22e-6fa2-4d8f-a70d-b8024ec57ed7){: .align-center}

- 이제 Vision Studio에서 데이터셋 등록을 해주자.
  - 필요한 정보를 입력하고 이전에 만든 컨테이너와 연결을 해주자.

![Image](https://github.com/user-attachments/assets/b2a04604-6587-4162-be25-227b70dfdef9){: .align-center}

![Image](https://github.com/user-attachments/assets/c70d1791-ddc3-41e6-aa26-af4226c70aec){: .align-center}

- 최종적으로 이런 모습이 되고 만들기를 해주면 된다.

![Image](https://github.com/user-attachments/assets/f72c0f34-62ab-4e43-b75a-7287cebac943){: .align-center}

### 1.5 머신러닝 데이터 라벨링 프로젝트 세팅

- 아직 머신러닝 리소스를 만든게 없어서 이름을 적고 `Create a new workspace`를 눌러주자.

![Image](https://github.com/user-attachments/assets/6694c7b3-352a-4d2b-b246-7eeee7b3178d){: .align-center}

- Azure Machine Learning 리소스를 만들어주자.

![Image](https://github.com/user-attachments/assets/c1e1db8e-ea3b-4cd6-a2dc-b8461bd245f0){: .align-center}

- 만든 뒤에는 `Workspace`에 바로 확인이 된다.

![Image](https://github.com/user-attachments/assets/e0af924b-688e-462a-b33b-d8751a73b7a2){: .align-center}

- 만들어지면 `Go to Azure ML Data Labeling Project`를 눌러주자.

![Image](https://github.com/user-attachments/assets/84567c86-adb6-455b-9e5f-47e353f4c605){: .align-center}

- 최종적으로 Machine Learning Studio에 들어오게 된다.

![Image](https://github.com/user-attachments/assets/4badb17a-6189-4e85-a9b3-b594fa5d365f){: .align-center}

### 1.6 데이터 라벨링 진행

- 나는 fork 이미지를 올렸기 때문에 fork 라벨만 추가했다.

![Image](https://github.com/user-attachments/assets/0f7fd684-33cb-4ecd-b9e3-bb65deeecade){: .align-center}

- 라벨을 추가하고 `Start` 버튼을 클릭하면 라벨링 작업으로 진입할 수 있는 `Label data` 버튼이 활성화된다.

![Image](https://github.com/user-attachments/assets/6bc75429-fde5-4efc-bd3d-5994800bef6c){: .align-center}

![Image](https://github.com/user-attachments/assets/79b593df-9297-4322-bc9b-943231506e16){: .align-center}

- `Label data` 버튼을 누르고 진입하면 라벨링 작업을 할 수 있다.
- 아래 그림처럼 직접 드래그해서 포크가 있는 위치를 잡아주자.

![Image](https://github.com/user-attachments/assets/f0e960b5-8ce0-40c4-b8a9-03d49a4d7d1d){: .align-center}

- 라벨링을 한 뒤에 진짜 제대로 작업이 되었는지 검토를 한다.
- 나는 포크 밖에 없어서 바로 모두 approve를 눌러주었다.

![Image](https://github.com/user-attachments/assets/c793bca1-abfe-47f4-9d9c-76dc7d042f74){: .align-center}

- 이제 dashboard에 들어가서 확인하면 모두 라벨링되었고 모두 승인되었음을 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/c28c5661-02f4-4ca4-9fec-68c4e0bd7b26)

### 1.7 COCO 파일 추가하기

- 이제 라벨링 작업이 끝났으니 COCO 파일을 추가해보자.
- 아래 캡처처럼 Vision Studio에 들어가자.

![Image](https://github.com/user-attachments/assets/5e76e1da-cd1e-4531-aa86-4e5b5a59cd91){: .align-center}

- `Add COCO file` 버튼을 눌러주면 아래처럼 팝업이 뜨는데, `Import COCO file from an Azure ML Data Labeling project`를 눌러주자.
- 그리고 나머지 정보도 입력하자.

![Image](https://github.com/user-attachments/assets/c4d207cd-9f7a-429d-ac28-594b93d3141a){: .align-center}

![Image](https://github.com/user-attachments/assets/2bbbf814-b019-4abb-a4b5-9f69e24910dd){: .align-center}

- `json` 파일이 만들어지면 성공이다!

![Image](https://github.com/user-attachments/assets/a56bd28d-8c00-48f5-ac5f-cb4e62ad9ee8){: .align-center}

### 1.8 모델 학습하기

- 이제 모델을 학습해보자.
- 모델 타입은 반드시 `Object Detection`을 선택해야 한다.

![Image](https://github.com/user-attachments/assets/e288ee16-86cd-4417-8ea2-76ed01996c58){: .align-center}

- 그 외 세팅은 기본 세팅으로 진행하였다.

![Image](https://github.com/user-attachments/assets/23da3173-768d-4a16-9273-cc17e89c5542){: .align-center}

![Image](https://github.com/user-attachments/assets/c951ecac-7eec-4154-99ab-b74f2f595550){: .align-center}

- 모델 학습을 진행하면 처음 `Status`가 `Queued`로 변하고 조금 기다리면 `Training`으로 변한다.

![Image](https://github.com/user-attachments/assets/158c5f3a-e02d-4c14-8637-54a81e6ff759){: .align-center}

![Image](https://github.com/user-attachments/assets/6ab8e910-79b3-4bc3-a8f7-2705f8da7471){: .align-center}

## 2. 🧠 모델 사용하기

- 하지만 사용해볼 수 없었다...
- 아무래도 Azure쪽에서 더이상 지원을 하지 않을 생각인 듯 하다...

![Image](https://github.com/user-attachments/assets/13616515-488c-4184-befc-c8884f6cc02f){: .align-center}