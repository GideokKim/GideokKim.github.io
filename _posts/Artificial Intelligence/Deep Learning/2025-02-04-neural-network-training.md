---
title: "[Deep Learning] 3. 신경망 학습(Neural Network Training)에 대해 알아보자"
date: 2025-02-04 15:00:00 +0900
last_modified_at: 2025-02-04 15:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - deep learning
  - neural network
  - neural network training
  - loss function
  - gradient descent
  - backpropagation

toc: true
toc_sticky: true
---

# 🎯 신경망 학습(Neural Network Training)

> 신경망 학습에 필요한 지식인 손실 함수, 수치미분, 기울기, 학습 알고리즘 구현 등을 공부한다.

## 💡 1. Rule-based vs. Data-driven

- Rule-based 학습: 명시적인 규칙을 사용하여 데이터를 분류하거나 예측하는 접근법
- Data-driven 학습: 대량의 데이터에서 패턴을 학습하고 예측 모델을 생성하는 접근법

## 🚀 2. 손실 함수(Loss Function)

> 신경망 학습에서 손실 함수는 신경망 모델의 예측값과 실제값 사이의 차이를 측정하는 함수이다.

- 모델의 성능을 평가하고 모델의 가중치를 업데이트하여 학습을 진행하는 데 중요한 역할을 한다.
- 손실 함수의 출력은 주어진 데이터셋에 대한 모델의 예측 정확도를 수치적으로 나타낸다.

### 왜 손실 함수를 설정하는가?

- 신경망 학습에서는 최적의 매개변수(가중치와 편향)를 탐색할 때 손실 함수의 값을 가능한한 작게하는 매개변수 값을 찾는다.
- 이때 매개변수의 미분(정확히는 기울기)을 계산하고, 그 미분값을 단서로 매개변수의 값을 서서히 갱신하는 과정을 반복한다.

#### 예시

> 가상의 신경망이 있고, 그 신경망의 어느 한 가중치 매개변수가 있을 때

1. 가중치 매개변수의 손실 함수 미분 -> 가중치 매개변수의 값을 아주 조금 변화시켰을 때 손실 함수가 어떻게 변화하는가
2. 미분값이 음수 -> 가중치 매개변수를 양의 방향으로 변화시켜 손실 함수 값을 줄임
3. 미분값이 양수 -> 가중치 매개변수를 음의 방향으로 변화시켜 손실 함수 값을 줄임
4. 미분값이 0 -> 가중치 매개변수를 어느 쪽으로 움직여도 손실 함수 값이 줄어들지 않음
   - 미분값이 0이 될 때 가중치 매개변수의 갱신이 멈춤. 학습 종료

### 손실 함수의 종류

- 평균 제곱 오차(Mean Squared Error, MSE)
  - 예측값: $y_{i}$
  - 실제값: $t_{i}$

$$
E_1 = \frac{1}{n} \sum_{i=1}^{n} (y_{i} - t_{i})^2 \\

E_2 = \frac{1}{2} \sum_{i=1}^{n} (y_{i} - t_{i})^2
$$

- 교차 엔트로피 오차(Cross-Entropy Error, CE)
  - 정보이론에서 확률분포사이의 거리를 재는 방법
  - 데이터가 신경망을 거쳐 나온 확률 벡터와 라벨로 구한 교차 엔트로피

$$
E = -\frac{1}{n} \sum_{i=1}^{n} t_{i} \log y_{i}
$$

### DNN의 학습 - 순전파와 역전파

- 순전파(Forward Propagation): : Input -> Output 방향으로 출력값을 계산하는 과정. 실측값과 차이인 오차(loss) 계산
- 역전파(Backward Propagation): : Output -> Input 방향으로 가중치를 갱신하는 과정. 딥러닝에서 학습이 이루어짐

![Image](https://github.com/user-attachments/assets/54023e3f-cdf6-4fb0-bbdd-1b2beaa40d84){: .align-center}

*이미지 출처: 자체 제작*

## 🔧 3. 수치 미분(Numerical Differentiation)

> 수치 미분은 미분을 수치적으로 계산하는 방법이다.

- 전진 차분(Forward Difference)

> 전진 차분은 오차가 크고 계산량이 적어 덜 정확한 결과를 얻을 수 있음.

$$
\frac{df(x)}{dx} \approx \frac{f(x+h) - f(x)}{h}
$$

- 중심 차분(Central Difference)

> 중심 차분은 오차가 적고 계산량이 많아 더 정확한 결과를 얻을 수 있음.

$$
\frac{df(x)}{dx} \approx \frac{f(x+h) - f(x-h)}{2h}
$$

- 후진 차분(Backward Difference)

> 후진 차분은 오차가 크고 계산량이 적어 덜 정확한 결과를 얻을 수 있음.
$$
\frac{df(x)}{dx} \approx \frac{f(x) - f(x-h)}{h}
$$


### [참고] 테일러 급수 전개를 사용한 오차 분석

> 왜 중심 차분을 사용하는가?

$$
f(x + h) = f(x) + f'(x)h + \frac{f''(x)}{2!}h^2 + \frac{f'''(x)}{3!}h^3 + O(h^4)
$$

- 전진 차분의 오차
  - 결과적으로 $O(h)$의 오차를 가짐

$$
\frac{df(x)}{dx} \approx \frac{f(x+h) - f(x)}{h} = f'(x) + \frac{f''(x)}{2}h + \frac{f'''(x)}{6}h^2 + O(h^3)
$$

- 중심 차분의 오차
  - 결과적으로 $O(h^2)$의 오차를 가짐
$$
\frac{df(x)}{dx} \approx \frac{f(x+h) - f(x-h)}{2h} = f'(x) + \frac{f'''(x)}{6}h^2 + O(h^4)
$$

- 후진 차분의 오차
  - 결과적으로 $O(h)$의 오차를 가짐

$$
\frac{df(x)}{dx} \approx \frac{f(x) - f(x-h)}{h} = f'(x) - \frac{f''(x)}{2}h + \frac{f'''(x)}{6}h^2 + O(h^3)
$$

## 📐 4. 기울기(Gradient)

### 일변수 미분 vs 다변수 미분

- 일변수 미분

$$
\frac{df(x)}{dx} \approx \frac{f(x+h) - f(x-h)}{2h}
$$

![Image](https://github.com/user-attachments/assets/7bd42f00-ce03-47d5-964a-9be85fc5ff27){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250204)*

- 다변수 미분

$$
\frac{df(X)}{dX} \approx \frac{f(X + h\vec{v}) - f(X-h\vec{v})}{2h}
$$

![Image](https://github.com/user-attachments/assets/33fbc825-95e7-4f50-bf51-99f4b8ccbf50){: .align-center}

*이미지 출처: [My Repository - MS AI School](https://github.com/GideokKim/ms-ai-school-study/tree/main/20250204)*

### 경사하강법(Gradient Descent)

- 역전파는 출력값과 실제값의 차이인 오차가 최소가 되도록 가중치를 갱신함.
  - 이때 가중치 갱신 방법으로 경사 하강법을 사용함
- 오차가 낮아지는 방향으로 이동할 목적으로 미분
- **가중치 업데이트**: 기울기의 반대 방향으로 $X_{n+1}$ 업데이트
  - $\eta$는 학습률(Learning Rate)로 학습 속도를 조절하는 매개변수
  - $\nabla f(X_{n})$는 기울기(Gradient)로 오차가 낮아지는 방향을 가리킴

$$
X_{n+1} = X_{n} - \eta \nabla f(X_{n})
$$

![Image](https://github.com/user-attachments/assets/4305f37a-7081-4f8d-879d-50e79327d26d){: .align-center}

*이미지 출처: [Gradient Descent](https://en.wikipedia.org/wiki/Gradient_descent)*

#### 왜 $X_n$의 최적값(최소값)을 찾아야 하는가?

> $X_n$의 최적값을 찾는 것은 손실 함수를 최소화하여 예측값과 실제값의 차이를 최소화하는 것을 의미한다.

- 가중치와 편향의 최적값을 찾아야 하는 이유는 예측값과 실제값의 차이(손실 함수)가 최소가 되도록 하기 위해서이다.
- 위의 경사하강법 식에서 $X$는 아래 손실 함수에 있는 가중치와 편향을 나타내는 매개변수이다.
- 위의 경사하강법 식에서 $f(X)$는 손실 함수 $E(w, b)$이고 $\nabla f(X)$는 손실 함수의 기울기이다.
  - **손실 함수 기울기와 반대 방향으로 가중치와 편향을 업데이트 하면 손실 함수가 최소가 되는 가중치와 편향을 찾을 수 있다.**

$$
E(w, b) = \frac{1}{2} \sum_{i=1}^{n} (y_{i} - t_{i})^2
$$

## 🧠 5. 학습 알고리즘 구현하기

### 학습 알고리즘의 4단계

1. 전제: 신경망에는 적용 가능한 가중치와 편향이 있고, 이 가중치와 편향을 훈련 데이터에 적응하도록 조정하는 과정을 **학습**이라고 한다.
2. Step1 - 미니배치: 훈련 데이터 중 일부를 무작위로 가져온다. 선별된 데이터를 **미니배치(Mini-batch)**라고 한다.
3. Step2 - 기울기 산출: 미니배치 데이터를 통해 손실 함수의 기울기를 산출한다.
4. Step3 - 가중치 및 편향 갱신: 기울기를 통해 가중치와 편향을 갱신한다.
5. 반복: 위의 과정(Step1~3)을 반복한다.

### 딥러닝의 학습 단위: Batch와 Epoch

- 배치(Batch)
  - 미니배치 학습을 위해 데이터를 무작위로 선별하는 과정을 반복하여 미니배치를 만드는 것을 배치라고 한다.
- 에폭(Epoch)
  - 전체 데이터셋을 모두 학습하는 과정(순전파 -> 역전파 -> 가중치 및 편향 갱신)을 한 번 진행한 것을 한 에폭이라고 한다.
  - 여러 번 수행해야 경사하강법의 효과를 볼 수 있음
  - 에폭이 크면 overfitting 문제가 발생할 수 있고 에폭이 작으면 underfitting 문제가 발생할 수 있음
- 반복(Iteration)
  - 에폭을 나누어 실행하는 횟수(미니배치의 개수)

![Image](https://github.com/user-attachments/assets/61edaf30-e566-448f-848e-54a7680fc267){: .align-center}

*이미지 출처: 자체 제작*

### 미니배치 학습 : Stochastic Gradient Descent

- 훈련 데이터 중 무작위로 선별한 데이터를 미니 배치라고 함.
- 효율적인 계산, 수렴 속도 개선, 학습속도 개선

![Image](https://github.com/user-attachments/assets/b2c5ff2e-b0de-4a99-8fcf-bead55e721bd){: .align-center}

*이미지 출처: [EfficientDL: Mini-batch Gradient Descent Explained](https://statusneo.com/efficientdl-mini-batch-gradient-descent-explained/)*

