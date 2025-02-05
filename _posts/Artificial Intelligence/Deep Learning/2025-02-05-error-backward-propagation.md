---
title: "[Deep Learning] 4. 오차 역전파(Error Backpropagation)에 대해 알아보자"
date: 2025-02-05 15:00:00 +0900
last_modified_at: 2025-02-05 15:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - neural network
  - neural network training
  - loss function
  - gradient descent
  - backpropagation
  - error backward propagation

toc: true
toc_sticky: true
---

# 🎯 오차 역전파(Error Backpropagation)

> 신경망 학습에 필요한 지식인 손실 함수, 수치미분, 기울기, 학습 알고리즘 구현 등을 공부한다.

## 1. 📊 계산 그래프(Computation Graph)

### 순전파(Forward Propagation)

> 사과의 개당 가격(x), 사과의 개수(m), 소비세(t)일 때 총금액을 계산하는 과정을 예시로 보자. 여기서 내가 예측한 개당 가격은 100원, 개수는 2개, 소비세는 10%로 생각하자.

- 소비세 붙기 전 금액 함수: $z(x, \ m) = x \cdot m$
- 총금액 함수: $f(x, \ m, \ t) = x \cdot m \cdot t$
- 총금액 함수의 각 변수별 편미분 값은 아래와 같다.

$$
\frac{\partial f(x, m, t)}{\partial x} = m \cdot t \\[1em]
\frac{\partial f(x, m, t)}{\partial m} = x \cdot t \\[1em]
\frac{\partial f(x, m, t)}{\partial t} = x \cdot m
$$

- 계산 그래프는 아래와 같다.

![Image](https://github.com/user-attachments/assets/b307a9bf-3b97-4295-98e4-0ac8a562e8d6){: .align-center}

*이미지 출처: 자체 제작*

### 역전파(Backward Propagation)

> 실제 총금액이 219원일 때, 예측값(220원 = 100원 × 2개 × 1.1)과의 차이를 통해 각 변수들이 변하면 얼마나 영향을 미치는지 역으로 계산해보자.

1. **손실 함수 정의**
   - $L = \frac{1}{2}(y_{pred} - y_{true})^2$
   - $L = \frac{1}{2}(220 - 219)^2 = 0.5$

2. **역전파 계산**
   - $\frac{\partial L}{\partial f} = (y_{pred} - y_{true}) = 1$ (오차)
   
   각 변수별 기울기:
   - $\frac{\partial L}{\partial x} = \frac{\partial L}{\partial f} \cdot \frac{\partial f}{\partial z} \cdot \frac{\partial z}{\partial x} = 1 \cdot (2 \cdot 1.1) = 2.2$ 
   - $\frac{\partial L}{\partial m} = \frac{\partial L}{\partial f} \cdot \frac{\partial f}{\partial z} \cdot \frac{\partial z}{\partial m} = 1 \cdot (100 \cdot 1.1) = 110$
   - $\frac{\partial L}{\partial t} = \frac{\partial L}{\partial f} \cdot \frac{\partial f}{\partial z} \cdot \frac{\partial z}{\partial t} = 1 \cdot (100 \cdot 2) = 200$

3. **해석**
   - 가격(x)이 1원 증가할 때:
     * 현재: $f(100, 2, 1.1) = 220$
     * 변경: $f(101, 2, 1.1) = 222.2$ (**예측값 2.2 증가**)
     * 새로운 손실: $\frac{1}{2}(222.2 - 219)^2 = 5.12$
     * 손실 증가량: $5.12 - 0.5 = 4.62$

   - 개수(m)가 1개 증가할 때:
     * 현재: $f(100, 2, 1.1) = 220$
     * 변경: $f(100, 3, 1.1) = 330$ (**예측값 110 증가**)
     * 새로운 손실: $\frac{1}{2}(330 - 219)^2 = 6,160.5$
     * 손실 증가량: $6,160.5 - 0.5 = 6,160$

   - 소비세(t)가 1% 증가할 때:
     * 현재: $f(100, 2, 1.1) = 220$
     * 변경: $f(100, 2, 1.11) = 222$ (**예측값 2 증가**)
     * 새로운 손실: $\frac{1}{2}(222 - 219)^2 = 4.5$
     * 손실 증가량: $4.5 - 0.5 = 4$

   - 결론: 
     * 예측값(220원)이 실제값(219원)과 매우 가까워 초기 손실이 작음
     * 가격(x)과 소비세(t)의 작은 변화는 손실에 상대적으로 작은 영향을 미침
     * 개수(m)의 변화는 손실을 크게 증가시킴
     * 현재 상태가 이미 최적에 가깝기 때문에 큰 변화는 오히려 손실을 증가시킴

![Image](https://github.com/user-attachments/assets/d8c5b5a1-d84a-4059-b851-d47293912c05){: .align-center}

*이미지 출처: 자체 제작*

#### 역전파 상세 과정

1. **계산 그래프 구조**
   ```
   x(100원) → [×] → [×] → f(220원)
              ↑      ↑
           m(2개)  t(1.1)
   ```

2. **각 곱셈 게이트별 역전파 과정**

   a) 마지막 곱셈 게이트 (z × t = f)
   ```python
   # 입력: z = 200, t = 1.1
   # 상위에서 전달된 기울기: 1 (예측값 220원과 실제값 219원의 차이)
   
   ∂t = 1 × z = 1 × 200 = 200    # t로 향하는 기울기
   ∂z = 1 × t = 1 × 1.1 = 1.1    # z로 향하는 기울기
   ```

   b) 첫 번째 곱셈 게이트 (x × m = z)
   ```python
   # 입력: x = 100, m = 2
   # 상위에서 전달된 기울기: 1.1
   
   ∂x = 1.1 × m = 1.1 × 2 = 2.2      # x로 향하는 기울기
   ∂m = 1.1 × x = 1.1 × 100 = 110    # m으로 향하는 기울기
   ```

3. **최종 편미분 값 검증**
   ```python
   # x에 대한 편미분
   ∂f/∂x = m × t = 2 × 1.1 = 2.2
   # 역전파 결과: dx = 2.2
   
   # m에 대한 편미분
   ∂f/∂m = x × t = 100 × 1.1 = 110
   # 역전파 결과: dm = 110
   
   # t에 대한 편미분
   ∂f/∂t = x × m = 100 × 2 = 200
   # 역전파 결과: dt = 200
   ```

4. **역전파의 의미**
   - 각 변수가 최종 출력에 미치는 영향을 계산
   - 양수 기울기: 해당 변수를 증가시키면 손실이 증가
   - 기울기의 절댓값: 변수 변화가 미치는 영향의 크기
     - 예: m의 기울기의 절댓값(110)이 x의 기울기의 절댓값(2.2)보다 크므로, m을 조정하는 것이 더 효과적

### 덧셈 게이트와 곱셈 게이트의 역전파 과정

- 덧셈 게이트의 역전파: 덧셈 게이트는 입력값을 그대로 전달한다.

- 곱셈 게이트의 역전파: 곱셈 게이트는 순전파 때 입력값을 서로 바꾼 값을 곱하여 전달한다.(chain rule)

### 각 게이트별 순전파 및 역전파 파이썬 코드

#### 덧셈 게이트

```python
class AddLayer:
    def __init__(self):
        pass

    def forward(self, x, y):
        out = x + y

        return out

    def backward(self, dout):
        dx = dout * 1
        dy = dout * 1

        return dx, dy
```

#### 곱셈 게이트

```python
class MulLayer:
    def __init__(self):
        self.x = None
        self.y = None

    def forward(self, x, y):
        self.x = x
        self.y = y                
        out = x * y

        return out

    def backward(self, dout):
        dx = dout * self.y  # x와 y를 바꾼다.
        dy = dout * self.x

        return dx, dy
```

## 2. 🔧 Affine 계층

> Affine 계층은 입력 데이터에 가중치를 곱(선형 변환)하고 편향을 더하는 연산을 수행하는 계층이다. 이렇게 선형 변환(Linear Transformation) 후 평행 이동(Translation)하는 것을 Affine transformation이라고 한다. 수학적 수식은 아래와 같다.

$$
Y = X \cdot W + B
$$

- 여기서 $X$는 입력 데이터, $W$는 가중치, $B$는 편향, $Y$는 출력 데이터이다.
- 단순히 생각하면 앞에서 열심히 설명한 것들의 **행렬 버전**이다.
  - 배치 처리가 없으면 $W$만 행렬이고 나머진 벡터이다.
  - 배치 처리까지 더해지면 모든 변수가 행렬이 되어 완전히 행렬 곱셈으로 이루어진다.
- 수학적으로 역전파도 행렬 버전으로 이루어진다.

## 3. 🔧 활성화 함수(Activation Function)의 역전파


$$
\frac{dL}{dw} = \frac{dL}{dy} \cdot \frac{dy}{dz} \cdot \frac{dz}{dw} \\
$$
$$
\frac{dL}{dy}: gradient \ of \ loss \ function\\
$$
$$
\frac{dy}{dz}: gradient \ of \ activation \ function\\
$$
$$
\frac{dz}{dw}: gradient \ of \ weight
$$


### Sigmoid 함수의 역전파

> sigmoid 함수는 미분 가능하기 때문에 역전파 과정에서 미분 값을 계산할 수 있다.

$$
\frac{d}{dx}sigmoid(x) = sigmoid(x)\{1-sigmoid(x)\}
$$

- 여기서 $x$는 입력 데이터, $sigmoid(x)$는 sigmoid 함수의 출력 데이터이다.
- 역전파 과정에서 활성화 함수 게이트를 넘어갈 때 기울기가 곱해진다.

#### Sigmoid 함수의 문제점

- sigmoid 함수의 모양을 보면 양의 무한대와 음의 무한대로 갈수록 기울기가 0에 가까워진다.
- 이로 인해 신경망 학습 과정인 가중치 업데이트가 더 이상 진행되지 않을 수 있다.
- 이를 해결하기 위해 ReLU 함수를 사용한다.

### ReLU 함수의 역전파

> ReLU 함수는 미분 가능하기 때문에 역전파 과정에서 미분 값을 계산할 수 있다.

$$
\frac{d}{dx}ReLU(x) = \begin{cases} 
1 & \text{if } x > 0 \\
0 & \text{if } x \leq 0
\end{cases}
$$


### Softmax를 이용한 신경망 추론 과정

> Softmax with Loss 계층은 출력층에서 사용되는 활성화 함수이다. Softmax 함수에 손실 함수인 Cross Entropy Error를 포함하여 구현한다.

<center>
<img width="1024" alt="Image" src="https://github.com/user-attachments/assets/cd7d96bf-c006-47dc-9f2f-517e93f0ce61" />
</center>

*이미지 출처: [『밑바닥부터 시작하는 딥러닝 1(리마스터판)』](https://github.com/WegraLee/deep-learning-from-scratch)*

- Softmax-with-Loss 미분
  - 여기서 $y_1, y_2, y_3$는 출력층의 출력 데이터, $t_1, t_2, t_3$는 실제 데이터이다.

$$
\frac{\partial L}{\partial a} = (y_1 - t_1, \ y_2 - t_2, \ y_3 - t_3)
$$

- Softmax-with-Loss 계층의 역전파 과정

<center>
<img width="1024" alt="Image" src="https://github.com/user-attachments/assets/fc8181d7-4d07-4504-aadc-c734084814b9" />
</center>

*이미지 출처: [『밑바닥부터 시작하는 딥러닝 1(리마스터판)』](https://github.com/WegraLee/deep-learning-from-scratch)*

## 4. 🧠 오차 역전파 학습 알고리즘 구현하기

### 학습 알고리즘의 4단계

1. 전제: 신경망에는 적용 가능한 가중치와 편향이 있고, 이 가중치와 편향을 훈련 데이터에 적응하도록 조정하는 과정을 **학습**이라고 한다.
2. Step1 - 미니배치: 훈련 데이터 중 일부를 무작위로 가져온다. 선별된 데이터를 **미니배치(Mini-batch)**라고 한다.
3. Step2 - 기울기 산출: 미니배치의 손실 함수 값을 줄이기 위해 각 가중치와 편향의 기울기를 산출한다. 기울기는 손실 함수의 값을 가장 작게 하는 방향을 가리키는 벡터이다.
4. Step3 - 가중치 및 편향 갱신: 가중치와 편향을 기울기 방향으로 아주 조금 갱신한다.
5. 반복: 위의 과정(Step1~3)을 반복한다.

### 구현 코드

> [코드 출처: 『밑바닥부터 시작하는 딥러닝 1(리마스터판)』](https://github.com/WegraLee/deep-learning-from-scratch/blob/master/ch05/two_layer_net.py)

```python
# coding: utf-8
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
import numpy as np
from common.layers import *
from common.gradient import numerical_gradient
from collections import OrderedDict


class TwoLayerNet:

    def __init__(self, input_size, hidden_size, output_size, weight_init_std = 0.01):
        # 가중치 초기화
        self.params = {}
        self.params['W1'] = weight_init_std * np.random.randn(input_size, hidden_size)
        self.params['b1'] = np.zeros(hidden_size)
        self.params['W2'] = weight_init_std * np.random.randn(hidden_size, output_size) 
        self.params['b2'] = np.zeros(output_size)

        # 계층 생성
        self.layers = OrderedDict()
        self.layers['Affine1'] = Affine(self.params['W1'], self.params['b1'])
        self.layers['Relu1'] = Relu()
        self.layers['Affine2'] = Affine(self.params['W2'], self.params['b2'])

        self.lastLayer = SoftmaxWithLoss()
        
    def predict(self, x):
        for layer in self.layers.values():
            x = layer.forward(x)
        
        return x
        
    # x : 입력 데이터, t : 정답 레이블
    def loss(self, x, t):
        y = self.predict(x)
        return self.lastLayer.forward(y, t)
    
    def accuracy(self, x, t):
        y = self.predict(x)
        y = np.argmax(y, axis=1)
        if t.ndim != 1 : t = np.argmax(t, axis=1)
        
        accuracy = np.sum(y == t) / float(x.shape[0])
        return accuracy
        
    # x : 입력 데이터, t : 정답 레이블
    def numerical_gradient(self, x, t):
        loss_W = lambda W: self.loss(x, t)
        
        grads = {}
        grads['W1'] = numerical_gradient(loss_W, self.params['W1'])
        grads['b1'] = numerical_gradient(loss_W, self.params['b1'])
        grads['W2'] = numerical_gradient(loss_W, self.params['W2'])
        grads['b2'] = numerical_gradient(loss_W, self.params['b2'])
        
        return grads
        
    def gradient(self, x, t):
        # forward
        self.loss(x, t)

        # backward
        dout = 1
        dout = self.lastLayer.backward(dout)
        
        layers = list(self.layers.values())
        layers.reverse()
        for layer in layers:
            dout = layer.backward(dout)

        # 결과 저장
        grads = {}
        grads['W1'], grads['b1'] = self.layers['Affine1'].dW, self.layers['Affine1'].db
        grads['W2'], grads['b2'] = self.layers['Affine2'].dW, self.layers['Affine2'].db

        return grads
```
