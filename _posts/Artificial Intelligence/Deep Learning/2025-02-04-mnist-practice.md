---
title: "[Deep Learning] 2. MNIST 데이터셋을 활용한 신경망 구현"
date: 2025-02-04 15:00:00 +0900
last_modified_at: 2025-02-04 15:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - deep learning
  - neural network
  - MNIST

toc: true
toc_sticky: true
---

# 🎯 MNIST 데이터셋을 활용한 신경망 구현

> MNIST 데이터셋을 활용한 신경망 구현 실습을 한다.

**[『밑바닥부터 시작하는 딥러닝 1(리마스터판)』(2025) 저장소](https://github.com/WegraLee/deep-learning-from-scratch)의 코드를 활용하여 실습을 진행한다.**

## 1. 📦 숫자인식을 위한 MNIST 데이터셋

> MNIST 데이터셋은 28x28 픽셀(28x28=784)의 흑백 이미지로 구성되어 있으며, 0부터 9까지의 숫자 손글씨 이미지로 구성되어 있다.

- 훈련 데이터가 6만장, 테스트 데이터가 1만장
- 각 데이터는 이미지와 라벨로 이루어짐
- 각 픽셀은 0에서 255로 밝기 표현

![Image](https://github.com/user-attachments/assets/1fa3ca4a-1238-433d-ac96-201057983b6f)

### image matrix

1. 이미지를 수치화
2. 수치 데이터의 행렬화
3. 평탄화 작업 진행(Flatten, 1차원 벡터로 변환)

$$
\begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{bmatrix}
\rightarrow
\begin{bmatrix}
a_{11} &
a_{12} &
a_{13} &
a_{21} &
a_{22} &
a_{23} &
a_{31} &
a_{32} &
a_{33}
\end{bmatrix}
$$

### 용어 정리

- Scalar : 0차원 텐서

$$
\begin{bmatrix}
1
\end{bmatrix}
$$

- Vector : 1차원 텐서

$$
\begin{bmatrix}
1 & 2 & 3
\end{bmatrix}
$$

- Matrix : 2차원 텐서 

$$
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6
\end{bmatrix}
$$

- Tensor : 다차원 텐서

$$
\begin{bmatrix}
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6
\end{bmatrix}
\end{bmatrix}
$$

### image와 tensor

- 흑백 이미지
  - 흑백 이미지는 픽셀 값으로 이루어진 2차원 텐서
  - 흑백 이미지들이 모인 데이터는 3차원 텐서

- 컬러 이미지
  - 컬러 이미지는 빨강, 초록, 파랑의 세 가지 색상 값으로 이루어진 3차원 텐서
  - 컬러 이미지들이 모인 데이터는 4차원 텐서

## 2. 🧠 기본적인 Neural Network 구현

> [GitHub - WegraLee/deep-learning-from-scratch: 밑바닥부터 시작하는 딥러닝 1 코드 참고](https://github.com/WegraLee/deep-learning-from-scratch/blob/master/ch03/neuralnet_mnist.py)

### 필요한 라이브러리 설정

> 위 저장소 코드를 fork해서 사용한다면 이미 데이터셋이 준비되어 있어서 아래처럼 데이터셋을 들고 오기 위한 처리를 해야 한다.

```python
# coding: utf-8
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))  # 부모 디렉터리의 파일을 가져올 수 있도록 설정
import numpy as np
import pickle
from dataset.mnist import load_mnist
from common.functions import sigmoid, softmax
```

### dataset 설정

> 데이터셋을 불러와서 테스트 데이터와 라벨을 가져오고, 네트워크를 초기화한다.

```python
def get_data():
    (x_train, t_train), (x_test, t_test) = load_mnist(normalize=True, flatten=True, one_hot_label=False)
    return x_test, t_test
```

### network 설정

> 미리 학습된 신경망의 가중치와 편향이 저장된 피클(pickle) 파일을 로드한다.

```python
def init_network():
    with open(os.path.dirname(__file__) + "/sample_weight.pkl", 'rb') as f:
        network = pickle.load(f)
    return network
```

### 신경망 구현

> 신경망을 구현하는 함수를 정의한다. 활성화 함수를 사용하여 레이어를 구현하고 마지막 출력에서는 softmax 함수를 사용한다.

```python
def predict(network, x):
    W1, W2, W3 = network['W1'], network['W2'], network['W3']
    b1, b2, b3 = network['b1'], network['b2'], network['b3']

    a1 = np.dot(x, W1) + b1
    z1 = sigmoid(a1)
    a2 = np.dot(z1, W2) + b2
    z2 = sigmoid(a2)
    a3 = np.dot(z2, W3) + b3
    y = softmax(a3)

    return y
```

### 신경망 추론 처리

> 앞에서 정의한 함수를 활용하여 신경망 추론 처리를 진행한다. 정확도를 계산하여 출력한다.

```python
x, t = get_data()
network = init_network()
accuracy_cnt = 0
for i in range(len(x)):
    y = predict(network, x[i])
    p= np.argmax(y) # 확률이 가장 높은 원소의 인덱스를 얻는다.
    if p == t[i]:
        accuracy_cnt += 1

print("Accuracy:" + str(float(accuracy_cnt) / len(x)))
```

## 3. 🧠 신경망 구현 개선

> 배치 처리(묶음 처리)를 통해 신경망 구현을 개선하여 더 빠르게 신경망을 구현한다.

- 숫자 데이터를 개별로 처리하면 I/O에서 병목현상이 발생함.
- 입력 데이터 묶음 처리를 통해 I/O에 주는 부하를 줄임.

### 신경망 추론 처리 with 배치 처리

```python
x, t = get_data()
network = init_network()

batch_size = 100 # 배치 크기
accuracy_cnt = 0

for i in range(0, len(x), batch_size):
    x_batch = x[i:i+batch_size]
    y_batch = predict(network, x_batch)
    p = np.argmax(y_batch, axis=1)
    accuracy_cnt += np.sum(p == t[i:i+batch_size])

print("Accuracy:" + str(float(accuracy_cnt) / len(x)))
```
