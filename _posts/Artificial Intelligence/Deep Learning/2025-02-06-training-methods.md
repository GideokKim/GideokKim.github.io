---
title: "[Deep Learning] 8. 딥러닝 모델의 여러 가지 학습 개선 방법"
date: 2025-02-06 15:00:00 +0900
last_modified_at: 2025-02-06 15:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - neural network
  - training methods
  - overfitting
  - weight decay
  - dropout
  - parameter
  - hyperparameter

toc: true
toc_sticky: true
---

# 🎯 여러 가지 학습 개선 방법

> 여러 가지 학습 개선 방법을 살펴보자.

## 1. 🔨 오버피팅(Overfitting) 현상 제어

> 오버피팅 현상은 모델이 학습 데이터에 너무 맞춰져 있어 일반화 성능이 떨어지는 현상이다.

- **매개변수에 비해 상대적으로 학습 데이터 수가 적을 때 오버피팅이 발생한다.**
- 예제: MNIST 데이터셋에 있는 60000개 데이터 중 300개의 학습 데이터를 사용
  - 각 층의 뉴런은 100개, 활성화 함수 ReLU 사용
  - 학습 데이터 성공률은 높으나 테스트 데이터 성공률은 낮다.

### 👀 오버피팅 현상 제어 전 모델 성능 확인

![Image](https://github.com/user-attachments/assets/f1ba2399-1c89-4459-9dcd-a0e15e430c9e){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - 오버피팅 현상 제어 전 모델 성능 확인*

### 🔍 가중치 감소(Weight Decay)

> 학습 과정에서 큰 가중치에 대해서는 그에 상응하는 큰 페널티 부여하여 오버피팅 억제

![Image](https://github.com/user-attachments/assets/a344bd92-802a-40f8-84da-8a0e6b982467){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - 가중치 감소(Weight Decay) weight_decay_lambda=0.1*

### 🔍 드롭아웃(Dropout)

> 학습 과정에서 은닉층의 뉴런을 무작위로 골라 삭제하는 방법. 즉, 신호를 전달하지 않음

![Image](https://github.com/user-attachments/assets/6bc93676-ed6b-4454-a6f3-21d386c04b63){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - 일반 신경망 vs 드롭아웃이 적용된 신경망*

![Image](https://github.com/user-attachments/assets/e7b0a227-6cd3-44d9-bb58-2b0bc53011ce)

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - 드롭아웃(Dropout) dropout_ratio=0.2*

## 2. 📌 Parameter vs Hyperparameter

> 매개변수와 하이퍼매개변수의 차이를 살펴보자.

### 🔍 Parameter

- **데이터를 통해 머신이 학습하는 값**
- 예를 들어 가중치, 편향, Scaling, Shift 가 있다.
- 데이터가 많고 신경망 모델이 좋으면 최적의 값을 머신이 스스로 찾아낸다.

### 🔍 Hyperparameter

- **사람이 결정하는 값**
- 예를 들어, 층의 개수, 뉴런의 개수, 학습률, 손실함수의 종류, 배치 크기, 훈련회수, Optimizer의 종료와 관련 계수값, 가중치 초기값, 가중치 감소 계수, Dropout비율 등
- 좋은 값을 찾기 위해서는 여러 값을 직접 시도해보는 수 밖에 없다.
- 일부 Hyperparameter는 특정 값이 추천되거나 거의 고정되어 있는 경우도 있다.
  - 예시: Momentum계수(0.9), Adam($\beta_1 = 0.9, \beta_2 = 0.999$) 등
- Hyperparameter 탐색 방법
  - 균일하게 선택하는 것보다 랜덤하게 선택하는 것이 좋다.
  - 성능이 가장 좋은 조합 주위의 영역을 줌인해서 다시 선택하는 것이 좋다.
  
