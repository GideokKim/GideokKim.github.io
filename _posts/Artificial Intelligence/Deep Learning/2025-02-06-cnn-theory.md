---
title: "[Deep Learning] 9. 합성곱 신경망(Convolutional Neural Network, CNN) 소개"
date: 2025-02-06 18:00:00 +0900
last_modified_at: 2025-02-06 18:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - neural network
  - transfer learning
  - ResNet
  - CNN
  - computer vision
  - ImageNet
  - pytorch

toc: true
toc_sticky: true
---

# 🎯 합성곱 신경망(Convolutional Neural Network, CNN) 소개

> 합성곱 신경망(Convolutional Neural Network, CNN)을 살펴보자.

## 1. 🔍 CNN 전체 구조

### 🔍 완전 연결 심층 신경망(Fully Connected Deep Neural Network, FC-DNN)

- 이전까지 살펴본 신경망은 모두 **완전 연결 심층 신경망(Fully Connected Deep Neural Network)**이었다.
- 완전 연결 심층 신경망은 입력 데이터가 1차원 데이터인 경우에 사용되었다.
- 이미지 데이터를 강제로 1차원으로 펼쳐서 표현하면서 수직 방향의 특징을 잃어버리는 문제(**인접 영역 상관관계 손실**)가 있다.

### 🔍 합성곱 신경망(Convolutional Neural Network, CNN)

- 이미지 데이터를 2차원 데이터로 표현하여 **수직 방향의 특징을 유지하는 신경망**
- 이미지 데이터의 공간적 상관관계를 유지하며 이미지내 특징 추출 가능
- **Convolution + Pooling + Flatten 층 구조**를 사용하여 이미지 데이터 처리

![Image](https://github.com/user-attachments/assets/845d4ab3-3aca-4c11-a7d6-3e686c61323e){: .align-center}

*이미지 출처: [Basics of CNN in Deep Learning](https://www.analyticsvidhya.com/blog/2022/03/basics-of-cnn-in-deep-learning/)*

![Image](https://github.com/user-attachments/assets/274a254a-b04a-4fdf-90b6-d8a1d91459d9){: .align-center}

*이미지 출처: [Beginners Guide to Convolutional Neural Network with Implementation in Python](https://www.analyticsvidhya.com/blog/2021/08/beginners-guide-to-convolutional-neural-network-with-implementation-in-python/)*

### 📊 FC-DNN vs CNN 전체 구조 비교

#### FC-DNN 전체 구조

![Image](https://github.com/user-attachments/assets/73c82cba-dbb0-470c-8aba-a8c4f375324a){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - FC-DNN 전체 구조*

#### CNN 전체 구조

![Image](https://github.com/user-attachments/assets/9c2a5f83-264c-4078-8163-346106ab2a14){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - CNN 전체 구조*

## 2. 🔢 합성곱 연산(Convolution)

> 이미지 위에 필터를 이동시키면서 겹치는 부분의 원소별 곱셈의 합을 구하는 연산

- CNN 이미지의 합성곱 : 이미지 위에서 필터(filter)를 이동시키면서 겹치는 부분의 원소별 곱셈의 합 연산
- 데이터와 필터(filter, kernel)의 합성곱으로 **feature map 생성**

### 🔑 Convolution 연산 파라미터

![Image](https://github.com/user-attachments/assets/fc4fe9c1-9e73-4d78-844b-8294816eaefd){: .align-center}

*이미지 출처: [Convolutional Neural Network (CNN) – Simply Explained](https://vitalflux.com/convolutional-neural-network-cnn-simply-explained/)*

#### Padding

> 이미지 주변에 추가적인 픽셀을 추가하여 이미지 크기를 유지하는 연산(상단 이미지 참고)

#### Stride

> Filter가 이동하는 보폭(Step)의 크기. Stride에 따라 피처맵의 크기와 학습 속도가 달라진다.

![Image](https://github.com/user-attachments/assets/f0ba9dbf-d9b7-4a76-aafe-dae29e388680){: .align-center}

*이미지 출처: [Basics of CNN in Deep Learning](https://www.analyticsvidhya.com/blog/2022/03/basics-of-cnn-in-deep-learning/)*

### 🚀 3차원 tensor에 대한 Convolution

![Image](https://github.com/user-attachments/assets/f152f034-f207-4646-a07a-1a6253fd0fd4){: .align-center}

*이미지 출처: [How many weight convolution layer has?](https://stackoverflow.com/questions/62586931/how-many-weight-convolution-layer-has)*

> 필터가 여러개일 때 3차원 tensor에 대한 Convolution

![Image](https://github.com/user-attachments/assets/1c38f174-181f-4e39-a0ae-dcfd17bdf0cb){: .align-center}

*이미지 출처: [ResearchGate](https://www.researchgate.net/figure/A-demo-of-a-CONV-layer_fig2_364953720)*

![Image](https://github.com/user-attachments/assets/f431b58b-c56b-4ee4-98aa-18169557c3ec){: .align-center}

*이미지 출처: [Convolutional neural networks](https://bfirst.tech/en/convolutional-neural-networks/)*

#### 채널(Channel)

> 채널(Channel)은 이미지나 데이터의 깊이(depth) 차원을 의미

- RGB 이미지: 3개 채널 (Red, Green, Blue)
- 흑백 이미지: 1개 채널 (Grayscale)
- 예시 크기: (높이, 너비, 채널) = (28, 28, 3) for RGB
- **입력 데이터의 채널과 필터의 채널수가 동일해야 한다.**

![Image](https://github.com/user-attachments/assets/0e7ec6ee-424a-405f-ac68-68a6c3c0535e){: .align-center}

## 3. 🧠 필터(Filter, Kernel) 학습

> 역전파 알고리즘을 사용하여 입력 데이터와 연결된 필터의 가중치를 학습한다.

### 🌱 학습 전

![Image](https://github.com/user-attachments/assets/875063aa-6342-4067-9123-46156f751504){: .align-center}

### 🧠 학습 후

![Image](https://github.com/user-attachments/assets/319f4686-47a2-4a9c-bd64-06c684d9fdcf){: .align-center}

## 4. 📦 풀링(Pooling)

> 피처맵을 대표하는 값으로 압축함(sub sampling)

- 피처맵에서 필터 크기를 바탕으로 최대값이나 평균값을 취한다.
- 지역 정보 중 두드러진 정보를 추출한다.

![Image](https://github.com/user-attachments/assets/9e470716-5a61-4094-8eff-c2aa47b5a0c2){: .align-center}

*이미지 출처: [Convolutional neural networks](https://bfirst.tech/en/convolutional-neural-networks/)*

### Convolution layer vs Pooling layer

- Convolution layer
  - 필터와 편향을 학습시킨다.
  - 채널이 사라진다.
  - 필터를 훈련시켜 낮은 층의 필터는 저수준의 로컬한 특징을 찾아내고 높은 층의 필터는 더 고수준의 더 글로벌한 특징을 찾아내는 것이 목표다.
- Pooling layer
  - 학습시킬 parameter가 없다.
  - 채널별로 독립적으로 시행한다.
  - DownSampling을 통하여 다음 Convolution layer에서 더 빨리 글로벌한 특징을 찾아낼 수 있게 한다.
  - parameter 숫자를 줄여서 계산비용을 줄이고 overfitting을 억제한다.
  - 약간의 평행이동에 대하여 변하지 않도록 한다.

## 5. 🚀 CNN 최종 구조

> Convolution layer와 Max pooling층이 반복되다가 후반에 Fully Connected layer가 등장한다.

- Convolution layer의 필터들은 학습 시작전에 랜덤하게 생성한다.
- 데이터를 통한 학습을 통해 손실함수값을 낮추도록 필터를 훈련시킨다.
- 충분한 학습이 이루어지면 낮은 층의 필터는 저수준의 로컬한 특징을 찾아내고 층이 높아질수록 더 고수준의 더 글로벌한 특징을 찾아낸다.

