---
title: "[Deep Learning] 5. 매개변수를 갱신하는 다양한 방법"
date: 2025-02-05 22:00:00 +0900
last_modified_at: 2025-02-05 22:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - neural network
  - optimizer
  - gradient descent
  - stochastic gradient descent

toc: true
toc_sticky: true
---

# 🎯 매개변수를 갱신하는 다양한 방법

> 다양한 optimizer를 사용해 매개변수를 갱신해보자. 학습률과 기울기 결정 방법에 따라 다양한 방법이 있다.

- 현재 Adam Optimizer가 가장 많이 사용되고 있다.
- 모든 optimizer가 결국 시간이 지나면 전부 수렴하지만 수렴 속도가 달라서 대형 모델의 경우 이 차이로 비용 차이가 커진다.
- 그러므로 현업에서는 optimizer의 성능도 무시할 수 없다.

![Image](https://github.com/user-attachments/assets/8d2aa263-b68c-41a0-800e-aebd497a52e6){: .align-center}

*이미지 출처: 자체 제작*

## 1. 📈 경사 하강법(Gradient Descent)

### 기본 경사 하강법

> 기본 경사 하강법: **모든 데이터를 대상**으로 기울기를 계산한다.

![Image](https://github.com/user-attachments/assets/c7568ce5-5c99-4e53-96fb-0ec866e83a23){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250205)*

### 확률적 경사 하강법(Stochastic Gradient Descent)

> 확률적 경사 하강법: **미니배치를 무작위로 선택**해 기울기를 계산한다.

- 기본 경사 하강법과 확률적 경사 하강법의 차이는 기울기를 계산하는 대상이 다르다는 점이다.
- 기본 경사 하강법은 모든 데이터를 대상으로 기울기를 계산하지만, 확률적 경사 하강법은 미니배치를 무작위로 선택해 기울기를 계산한다.
- 확률적 경사 하강법은 기본 경사 하강법에 비해 계산 시간이 적게 걸리고, 더 빠르게 학습할 수 있다.
- **수렴 방향이 흔들리는 문제(비효율적인 탐색 경로 유발)가 있다.**
- **학습률의 초기값에 따라 성능 편차가 크다.**

$$
W_{t+1} = W_t - \eta \frac{\partial L}{\partial W}
$$

- $W_{t+1}$: 다음 매개변수
- $W_t$: 현재 매개변수
- $\eta$: 학습률
- $\frac{\partial L}{\partial W}$: 기울기

![Image](https://github.com/user-attachments/assets/c17b5c32-e0eb-49c1-a274-dd13357cd550){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250205)*

## 2. 💪 모멘텀(Momentum)

> 모멘텀: 이전 기울기의 영향을 반영한다. Gradient Descent에 현재 관성을 추가한다.

- **극소점에 빠지더라도 관성의 힘으로 탈출할 가능성이 생김**

$$
v = \alpha v - \eta \frac{\partial L(W)}{\partial W}
$$

- $v$: 이동 속도
- $\alpha$: 관성 계수(반영률)
- $\eta$: 학습률
- $\nabla E(W)$: 기울기

$$
W_{t+1} = W_t + v_t
$$

- $W_{t+1}$: 다음 매개변수
- $W_t$: 현재 매개변수
- $v_t$: 현재 이동 속도

![Image](https://github.com/user-attachments/assets/26732553-b1dd-49cb-83f6-c2f9a520cf72){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250205)*

## 3. 🔄 AdaGrad

> AdaGrad: 매개변수와 스텝마다 학습률이 변한다.

- 학습률 조정값의 특성
  - 각 축 별로 학습률을 조정하는 효과
  - 큰 변화를 겪은 변수의 학습률은 대폭 작아짐
  - 작은 변화를 겪은 변수의 학습률은 소폭 작아짐
  - 단점: 무한 학습시 갱신량이 0이되어 전혀 갱신되지 않음

$$
h = h + \frac{\partial L(W)}{\partial W} \odot \frac{\partial L(W)}{\partial W}
$$

- $h$: 학습률 조정값
- $\odot$: 요소 곱

$$
W_{t+1} = W_t - \frac{\eta}{\sqrt{h}} \frac{\partial L(W)}{\partial W}
$$

- $W_{t+1}$: 다음 매개변수
- $W_t$: 현재 매개변수
- $\eta$: 학습률
- $\sqrt{h}$: 학습률 조정값의 제곱근
- $\frac{\partial L(W)}{\partial W}$: 기울기

![Image](https://github.com/user-attachments/assets/895bee2c-ff33-4472-93bd-595b4e10159b){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250205)*

## 4. ↗️ NAG(Nesterov Accelerated Gradient)

> NAG: 현재 위치에서 관성방향으로 움직인 후(모멘텀) 위치에서의 기울기 반대 방향을 합한다.

$$
v_t = \alpha v_{t-1} - \eta \nabla f(W + \alpha v_{t-1}) \quad where \quad v_{-1} = 0
$$

- $v_t$: 이동 속도
- $\alpha$: 관성 계수(반영률)
- $\eta$: 학습률
- $\nabla f(W)$: 기울기

$$
W_{t+1} = W_t + v_t
$$

- $W_{t+1}$: 다음 매개변수
- $W_t$: 현재 매개변수
- $v_t$: 현재 이동 속도

### NAG vs 기존 모멘텀

![Image](https://github.com/user-attachments/assets/7a94f8de-72c1-4550-bb64-be59bf8c8f1f){: .align-center}

*이미지 출처: 자체 제작*

1. **기존 모멘텀**
   - 현재 위치에서 그래디언트 계산
   - 그래디언트와 이전 모멘텀을 결합
   - **보고 이동하는 방식**

2. **NAG**
   - 모멘텀 방향으로 미리 이동
   - 예상 위치에서 그래디언트 계산
   - **이동하고 보는 방식**
   - 더 현명한 방향 결정 가능

![Image](https://github.com/user-attachments/assets/adac02d7-b642-40ed-a68f-376a9fd47663){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250205)*

## 5. 📉 RMSProp

> RMSProp: 기울기의 제곱을 평균내어 학습률을 조정한다.

- AdaGrad는 스텝이 많이 진행되면 누적치 hn이 너무 커져서 학습률이 너무 작아져 학습이 거의 되지 않는 문제가 발생한다.
- RMSProp은 이를 보완한 방법으로 $\gamma$를 조정하여 학습률 조정값의 과거 값 반영 비율을 조정한다.

$$
h_t = \gamma h_{t-1} + (1 - \gamma) \nabla f(W_t) \odot \nabla f(W_t) \quad where \quad h_{-1} = 0
$$

- $h_t$: 학습률 조정값
- $\gamma$: 관성 계수(반영률)
- $\nabla f(W_t)$: 기울기

$$
W_{t+1} = W_t - \frac{\eta}{\sqrt{h_t}} \nabla f(W_t)
$$

- $W_{t+1}$: 다음 매개변수
- $W_t$: 현재 매개변수
- $\eta$: 학습률
- $\sqrt{h_t}$: 학습률 조정값의 제곱근

![Image](https://github.com/user-attachments/assets/5fcdf84e-27f7-454e-98dc-baca8a0403d6){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250205)*

## 6. 🚀 Adam(Adaptive Moment Estimation)

> Adam: 모멘텀과 RMSProp을 결합한 방법

- 경우에 따라 다르지만 일반적으로 가장 최고의 성능을 보여주는 optimizer이다.
- 하이퍼 파라미터의 편향 보정(bias correction)이 진행된다.

$$
m_t = \beta_1 m_{t-1} + (1 - \beta_1) \nabla f(W_t)
$$

- $m_t$: 모멘텀
- $\beta_1$: 관성 계수(반영률)
- $\nabla f(W_t)$: 기울기

$$
v_t = \beta_2 v_{t-1} + (1 - \beta_2) \nabla f(W_t) \odot \nabla f(W_t)
$$

- $v_t$: 학습률 조정값
- $\beta_2$: 관성 계수(반영률)

$$
W_{t+1} = W_t - \frac{\eta}{\sqrt{v_t}} \frac{m_t}{\sqrt{\epsilon}}
$$

- $W_{t+1}$: 다음 매개변수
- $W_t$: 현재 매개변수
- $\eta$: 학습률
- $\epsilon$: 안정화 상수

![Image](https://github.com/user-attachments/assets/9fba3882-9588-4296-bad6-41712397a5c5){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250205)*

## 7. 📊 MNIST 데이터셋으로 본 다양한 optimizer의 성능 비교

![Image](https://github.com/user-attachments/assets/9e7c9b35-d9ef-41f8-9a8f-01156be4773d){: .align-center}