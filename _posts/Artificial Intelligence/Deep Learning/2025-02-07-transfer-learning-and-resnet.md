---
title: "[Deep Learning] 10. 전이 학습(Transfer Learning)과 ResNet"
date: 2025-02-07 13:00:00 +0900
last_modified_at: 2025-02-07 13:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - neural network

toc: true
toc_sticky: true
---

# 🎯 전이 학습(Transfer Learning)과 ResNet

> 전이 학습(Transfer Learning)과 ResNet을 살펴보자.

## 1. 🔍 전이 학습(Transfer Learning)

> 한 분야의 문제 해결을 위해 얻은 지식/정보를 다른 문제 해결에 사용

- 딥러닝 분야의 전이학습: 하나의 작업을 위해 학습된 신경망 모델을 유사한 다른 작업에 적용시키는 것을 의미한다.

### 🚀 간단한 전이 학습 프로세스

1. 사전 학습된 neural network 모델 선택
  - ex. 1M개 이미지 & 1000개 클래스 분류
2. 최종 Layer만 교체
3. 새로운 데이터에 대한 학습
  - 100개 이미지 & 10개 클래스 분류
4. 예측 및 결과 평가로 neural network 개선

### 💡 전이 학습을 사용하는 이유

![Image](https://github.com/user-attachments/assets/da879f8a-2664-49f4-be2e-475c80b87dd2){: .align-center}

*이미지 출처: [Transfer Learning](https://kr.mathworks.com/discovery/transfer-learning.html)*

- CNN 모델은 네트워크 깊이에 따라 서로 다른 종류의 feature를 학습한다.
- 전이 학습을 사용하여 새로운 데이터 세트로 학습하면 **깊은 계층의 파라미터를 조정할 수 있다.**
  - 아래 그림의 왼쪽이 앝은 layer(일빈적 특징 추출)이고 오른쪽이 깊은 layer(구체적 특징 추출)이다.
- 잘 훈련된 모델이 새로 구성하려는 모델과 유사한 경우, 짧은 시간 내에 높은 정확도 달성이 가능하다.

![Image](https://github.com/user-attachments/assets/bd42d12f-7cfd-4987-b04b-603ae38bd614){: .align-center}

*이미지 출처: [#002 CNN Edge detection](https://datahacker.rs/edge-detection/)*

### 🔍 Transfer Learning과 Fine-tuning

- **Transfer Learning**: 사전 학습된 모델을 사용하여 최종 layer의 parameter를 조정하는 학습을 진행
- **Fine-tuning**: 사전 학습된 모델을 사용하여 모든 layer의 parameter를 조정하는 학습을 진행(초기값은 사전 학습된 모델의 parameter를 사용)
- 아래 그림에서 왼쪽은 Fine-tuning이고 오른쪽은 Transfer Learning이다.

![Image](https://github.com/user-attachments/assets/6b5ffb22-0f0f-4d83-8d8e-110a5ed9a158){: .align-center}

*이미지 출처: [Transfer Learning(전이 학습)](https://choice-life.tistory.com/40)*

## 2. 🧠 ResNet

- ILSVRC(ImageNet Large Scale Visual Recognition Challenge) : 2010년에 시작된 ImageNet 인식 경진대회
- ImageNet : 1000가지 사물로 이루어진 100만개 이미지 데이터
- 2015년 최고 성능의 모델은 152층의 신경망을 사용한 모델(ResNet)이었다.
- AlexNet
  - 깊은 신경망(8 layer) 사용
  - 인식 에러율을 16%로 낮춤
- ResNet
  - 더 깊은 신경망(152 layer) 사용
  - 인간의 인식 에러율보다 낮춤

![Image](https://github.com/user-attachments/assets/22f933f1-febd-4d9a-b1c0-a2a5e28f2a12){: .align-center}

*이미지 출처: [ResearchGate](https://www.researchgate.net/figure/Algorithms-that-won-the-ImageNet-Large-Scale-Visual-Recognition-Challenge-ILSVRC-in_fig2_346091812)*

### 🧠 사전 학습된 신경망 ResNet50

- 50개의 layer로 구성된 CNN 모델
- ImageNet 데이터세트의 이미지(100만개 이상의 이미지)에 대해 사전 학습된 모델
- 다양한 이미지를 대표하는 많은 특징을 학습하여 키보드, 마우스, 연필, 각종 동물 등 1000여개의 사물로 분류 가능
- 224 x 224 크기의 이미지를 입력으로 사용한다.
- **새로운 이미지 분류에 활용하기 위해 Fully-Connected layer를 수정해야 한다.**

![Image](https://github.com/user-attachments/assets/174a8d7f-d5d1-45a7-ac25-ca5ec7226e42){: .align-center}

*이미지 출처: [How to split resnet50 model from top as well as from bottom?](https://stackoverflow.com/questions/54207410/how-to-split-resnet50-model-from-top-as-well-as-from-bottom#)*

### 🧠 ResNet 모델 구조

#### Residual Block

> **Vanishing Gradient 문제**를 피하기 위해 shortcut connection을 추가한 Residual Block을 사용

#### Bottleneck

> 층을 깊게 쌓을 때 발생할 수 있는 성능저하(파라미터 수, 연산량 증가)를 막기 위해 BottleNeck 구조를 사용(1x1 convolution을 사용하여 채널/차원 축소, 비선형성 증가, 과적합 방지)

![Image](https://github.com/user-attachments/assets/0d0fc6ae-2c4e-4121-8c4c-e667ac18bcfd){: .align-center}

*이미지 출처: [모두를 위한 딥러닝 시즌 2: ResNet](https://velog.io/@uonmf97/%EB%AA%A8%EB%91%90%EB%A5%BC-%EC%9C%84%ED%95%9C-%EB%94%A5%EB%9F%AC%EB%8B%9D-%EC%8B%9C%EC%A6%8C-2-ResNet)*

#### Downsampling

> BasicBlock이나 Bottleneck 출력을 결정할때 $F(x)$ 와 $x$ 의 텐서 사이즈가 다를때 Downsampling을 사용함

- Feature map 크기 변화 지점의 shortcut은 ResNet 그림에서 점선으로 표시
  - pooling에 해당하는 부분
  - **채널이 64 -> 128 -> 256로 변경될 때 feature map 크기가 줄어듦**
- ResNet50에서는 단순하게 처리하기 위해 stride 2인 1x1 convolution 사용

![Image](https://github.com/user-attachments/assets/35d8fe3c-e334-4906-b461-58c86ff84df9){: .align-center}

*이미지 출처: [[모두를 위한 딥러닝2] CNN #6 ResNet](https://velog.io/@uvictoli/%EB%AA%A8%EB%91%90%EB%A5%BC-%EC%9C%84%ED%95%9C-%EB%94%A5%EB%9F%AC%EB%8B%9D2-CNN-6-ResNet)*

#### Dropout

> 뉴런이라 부르는 노드를 무작위로 껐다 켰다를 반복하는 것을 Dropout이라 한다.

- Overfitting 방지
- 학습 시간 단축
- 매번 다른 형태의 노드로 학습하기 때문에 여러 형태의 네트워크들을 통해서 앙상블 효과 얻음

#### Layers

> 50개의 layer를 가지고 있으며, 각 conv에 있는 행렬이 residual block이다.

- ResNet50은 layer마다 다른 residual block 형태가 반복되어 학습된다.
- [1x1 , 64]
  - 1x1 convolution을 사용
  - kernel(filter)의 수는 64
- [3x3 , 64]
  - 3x3 convolution을 사용
  - kernel(filter)의 수는 64
- [1x1 , 256]
  - 1x1 convolution을 사용
  - kernel(filter)의 수는 256


![Image](https://github.com/user-attachments/assets/a017f1b9-3bb8-47f6-8d31-1c6e54463efe){: .align-center}

*이미지 출처: [Deep Residual Learning for Image Recognition](https://www.cv-foundation.org/openaccess/content_cvpr_2016/papers/He_Deep_Residual_Learning_CVPR_2016_paper.pdf)*

## 3. 🧠 ResNet 모델 사용

- PyTorch의 라이브러리 중 하나인 TorchVision에서 ResNet50 등 사전 학습된 이미지 인식 모델을 제공한다.
- TorchVision은 dataset, models, transforms 등 다양한 하위 라이브러리를 제공한다.

```python
import torchvision.models as models

resnet50 = models.resnet50(pretrained=True) # 사전 학습된 ResNet50 모델 사용
```

### ❓ input image size가 다른 경우

- 이미지 변환 후 사용 가능
- ResNet50의 경우 224 x 224 크기의 이미지를 입력으로 사용하므로 `transforms.Compose`를 사용하여 변환한다.

```python
from torchvision import transforms

transform = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
])
```

### 💯 간단한 ResNet50을 사용

> Fully-Connected layer를 수정하여 사용한다.
