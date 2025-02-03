---
title: "[Deep Learning] 1. 신경망(Neural network) 기초"
date: 2025-02-03 15:00:00 +0900
last_modified_at: 2025-02-03 15:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - deep learning
  - neural network
  - activation function
  - sigmoid
  - relu
  - softmax

toc: true
toc_sticky: true
---

# 🎯 신경망(Neural network)

> 신경망은 인간의 뇌 구조를 모방한 모델이다. 인간의 뇌는 뉴런이라는 세포체로 이루어져 있고, 이 뉴런이 연결되어 있어 복잡한 신경망을 형성한다.

## 🚀 1. 활성화 함수(Activation function)

> 입력값을 **일정 기준에 따라 변화시켜 출력하는 비선형 함수**

- 입력값과 가중치(weight)를 곱하고 편향(bias)을 더한 후 활성화 함수를 적용함
- 활성화 함수는 주어진 값이 특정 조건을 만족하게 되면 해당 값 출력.
  - 퍼셉트론의 활성화 함수는 계단함수(Step function)의 형태를 갖음
  - **다양한 활성화 함수가 적용되면서 인공신경망으로 발전 : Sigmoid, ReLU, Softmax 등**

### 활성화 함수 사용 이유

1. 비선형성(Non-linearity) 추가: 복잡한 데이터 패턴 학습 및 다양한 함수 근사
2. 출력 범위 제한: 다음 층 입력 값 크기 관리. 수렴 속도 향상
  - 예: Singmoid[0, 1], tanh[-1, 1]
3. Gradient 계산의 용이성: 역전파로 가중치 조정시 활성화 함수의 도함수 필요
4. 계산 효율성: 계산이 단순하고 빠르게 수행돼 전체 학습 및 추론 속도 향상

### 활성화 함수의 종류

#### step function

- 0을 경계로 출력이 갑자기 변화

![Image](https://github.com/user-attachments/assets/b3587d8e-c65c-4373-b245-6f393594f2fc){: .align-center}

#### sigmoid function

- 부드러운 곡선으로 입력에 따라 출력이 연속적으로 변화(**미분 가능**)
- **신경망에서 중요한 역할**

![Image](https://github.com/user-attachments/assets/aadbc819-778a-4a6e-aa7c-86bb1a6127c8){: .align-center}

#### ReLU function

![Image](https://github.com/user-attachments/assets/bf4eb674-45d3-4a54-a79b-0a41e989c1a4){: .align-center}

## 🔧 2. 다차원 배열 계산

### 신경망에서의 행렬 곱

- 신경망 그림

![Image](https://github.com/user-attachments/assets/681c80cd-1304-405d-ade8-d3913199d60c){: .align-center}


- 행렬 곱 수식

$$
\begin{bmatrix}
1 & 2 \\
3 & 4 \\
5 & 6
\end{bmatrix}
\begin{bmatrix}
x_{1} \\
x_{2}
\end{bmatrix}
= \begin{bmatrix}
x_{1} + 2x_{2} \\
3x_{1} + 4x_{2} \\
5x_{1} + 6x_{2}
\end{bmatrix}
$$

## 🧠 3. 다층 퍼셉트론(Multi-layer Perceptron, MLP)

> MLP는 인공신경망의 초기 모델이며, 선형 모델인 퍼셉트론을 보완한 모델이다.

- 입력층(Input layer) : input 데이터
- 은닉층(Hidden layer) : 여러 퍼셉트론의 조합 (비선형 활성화 함수 사용)
- 출력층(Output layer) : 모델의 최종 결과값
- 히든 레이어를 추가할 수록 더 복잡한 문제를 풀 수 있다.
  - 퍼셉트론이 2층으로 XOR을 풀 수 있었던 것처럼!
- 당연히 히든레이어가 늘어나면 용량이 늘어난다.
- 층을 지나갈 때마다 활성화 함수를 적용해 비선형성을 추가한다.

![Image](https://github.com/user-attachments/assets/15f75305-bff1-46bd-a735-54f7d8b03e31){: .align-center}

### Softmax 함수

> 출력층 설계에 사용되는 활성화 함수 중 하나

$$
\text{Softmax}(x_{i}) = \frac{e^{x_{i}}}{\sum_{j=1}^{n} e^{x_{j}}}
$$

#### 정의

- 출력층에서 사용되는 활성화 함수
- 출력값을 0과 1 사이의 확률로 변환
- 모든 출력값의 합은 1이 된다.

#### 성질

- 확률분포: Softmax 함수의 출력값들은 항상 0과 1사이의 값이며, 모든 출력의 합은 1. 따라서
출력벡터를 확률분포로 해석할 수 있음.
- 미분 가능성: Softmax 함수는 미분 가능하므로 역전파 학습과정에서 사용 가능
- 입력값의 상대적 크기 반영: 입력값의 상대적 크기에 따라 출력을 조정하며, 큰 입력값일수록 더 큰
확률을 가짐
- 순서보존: 입력값의 순서는 출력 값의 순서에 영향을 미침.

#### 구현 주의사항

- 너무 높은 출력값을 사용하여 Softmax를 적용하면 NaN이 나오는 현상 발생함.
- 입력 신호 중 최대값(eg. c)를 빼준 후 Softmax를 적용하여 에러 방지

```python
def softmax(x):
    return np.exp(x) / np.sum(np.exp(x))

x = np.array([1010, 1000, 990])
print(softmax(x)) # [nan nan nan]

x = x - np.max(x)
print(softmax(x))
```
