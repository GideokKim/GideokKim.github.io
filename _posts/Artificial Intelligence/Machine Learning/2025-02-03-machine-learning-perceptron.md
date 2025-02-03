---
title: "[Machine Learning] 1. 퍼셉트론(Perceptron)과 논리 게이트(Logic Gate)"
date: 2025-02-03 13:00:00 +0900
last_modified_at: 2025-02-03 13:00:00 +0900
categories: 
  - Machine Learning
tags:
  - machine learning
  - AI
  - machine learning
  - neural network
  - tensorflow
  - pytorch
  - keras

toc: true
toc_sticky: true
---

# 🎯 퍼셉트론(Perceptron)

> 머신러닝의 기초적인 모델 중 하나이며 머신러닝의 발전 초기 단계에서  나온 알고리즘이다. 더 복잡한 모델인 신경망(Neural Networks)이나 딥러닝(Deep Learning)에 비해 한계가 많다.

## 1. 퍼셉트론이란?

### 인간의 뉴런

- 인간의 뉴런(신경세포)은 감각을 통해 얻은 신호를 처리함.
- 뉴런은 신호를 취합하여 **일정 값 이상**이면 다음 뉴런으로 신호를 전달함

### 퍼셉트론

> 선형 결합의 결괏값과 주어진 임계값($\theta$)에 따라 출력값의 활성화(신호 전달) 여부를 정하는 모델

![Image](https://github.com/user-attachments/assets/6f5a0f41-fce0-4c1d-b4d3-9867b803e79b){: .align-center}

- 인간의 뉴런을 모방함
- 입력값(input)과 가중치(weight)가 선형 결합 되어 있음
- 간단한 분류 문제를 해결함

#### 2차원 퍼셉트론

$$
f(x_1, x_2) = y = \begin{cases}
0 & \text{if } w_1x_1 + w_2x_2 \leq \theta \\
1 & \text{if } w_1x_1 + w_2x_2 > \theta
\end{cases}
$$

#### n차원 퍼셉트론

$$
f(x_1, x_2, \cdots, x_n) = y = \begin{cases}
0 & \text{if } \sum_{i=1}^{n} w_ix_i \leq \theta \\
1 & \text{if } \sum_{i=1}^{n} w_ix_i > \theta
\end{cases}
$$

## 2. AND, OR, NAND Gate

> Logic Gate를 퍼셉트론으로 구현하자는 아이디어가 등장

### AND Gate

> AND Gate의 진리표 : 두입력이 모두 1 일 때만 1 을 출력하고, 그 외에는 0 을 출력

- AND 연산에 대해 선형분류를 수행
- **그림에서 가로축은 $w_1$ 세로축은 $w_2$를 의미한다.**

![Image](https://github.com/user-attachments/assets/3d2566e2-d025-48e1-adce-02125b59e8ef){: .align-center}

> Perceptron으로 AND Gate를 표현해보자($w_1 = 0.5, w_2 = 0.5, \theta = 0.7$)

- 임계값은 예시에선 0.7로 했으나 논리만 맞으면 변경해도 됨

$0.5 \times 1 + 0.5 \times 1 = 1 > 0.7$

$0.5 \times 1 + 0.5 \times 0 = 0.5 \leq 0.7$

$0.5 \times 0 + 0.5 \times 0 = 0 \leq 0.7$

#### 파이썬 코드 예시

- $w_1x_1 + w_2x_2 + \theta$
- $w_1, w_2$는 가중치, $\theta$는 임계값이고 이를 편향 $b$로 표현하면 $b = -\theta$ 가 된다.

```python
import numpy as np

def AND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([0.5, 0.5])
    b = -0.7
    tmp = np.sum(w*x) + b # w1*x1 + w2*x2 + b
    if tmp <= 0:
        return 0
    else:
        return 1

if __name__ == '__main__':
    for xs in [(0, 0), (1, 0), (0, 1), (1, 1)]:
        y = AND(xs[0], xs[1])
        print(str(xs) + " -> " + str(y))
```

### OR Gate

> OR Gate의 진리표 : 두 입력 중 하나 이상이 1 일 때 1 을 출력하고, 그 외에는 0 을 출력

- OR 연산에 대해 선형분류를 수행

![Image](https://github.com/user-attachments/assets/efae088f-525b-4fec-ba84-64957131a4e1){: .align-center}

> Perceptron으로 OR Gate를 표현해보자($w_1 = 0.5, w_2 = 0.5, \theta = 0.2$)

- 임계값은 예시에선 0.2로 했으나 논리만 맞으면 변경해도 됨

$0.5 \times 1 + 0.5 \times 1 = 1 > 0.2$

$0.5 \times 1 + 0.5 \times 0 = 0.5 > 0.2$

$0.5 \times 0 + 0.5 \times 0 = 0 \leq 0.2$

#### 파이썬 코드 예시

```python
import numpy as np

def AND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([0.5, 0.5])
    b = -0.2
    tmp = np.sum(w*x) + b # w1*x1 + w2*x2 + b
    if tmp <= 0:
        return 0
    else:
        return 1

if __name__ == '__main__':
    for xs in [(0, 0), (1, 0), (0, 1), (1, 1)]:
        y = AND(xs[0], xs[1])
        print(str(xs) + " -> " + str(y))
```

### NAND Gate

> NAND Gate의 진리표 : 두 입력이 모두 1 일 때 0 을 출력하고, 그 외에는 1 을 출력

- NAND 연산에 대해 선형분류를 수행

![Image](https://github.com/user-attachments/assets/ba057ffe-ac14-4462-bd9b-792471489a0d){: .align-center}

> Perceptron으로 NAND Gate를 표현해보자($w_1 = -0.5, w_2 = -0.5, \theta = -0.7$)

- 임계값은 예시에선 0.2로 했으나 논리만 맞으면 변경해도 됨

$-0.5 \times 1 + -0.5 \times 1 = -1 \leq -0.7$

$-0.5 \times 1 + -0.5 \times 0 = -0.5 > -0.7$

$-0.5 \times 0 + -0.5 \times 0 = 0 > -0.7$

#### 파이썬 코드 예시

```python
import numpy as np

def AND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([-0.5, -0.5])
    b = 0.7
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1

if __name__ == '__main__':
    for xs in [(0, 0), (1, 0), (0, 1), (1, 1)]:
        y = AND(xs[0], xs[1])
        print(str(xs) + " -> " + str(y))
```

## 3. XOR Gate(문제의 시작)

> XOR Gate의 진리표 : 두 입력이 다를 때만 1 을 출력하고, 그 외에는 0 을 출력

- 퍼셉트론으로는 XOR Gate를 표현할 수 없었음
  - 직선 하나로는 분류가 안됨
- **그럼 두 직선을 조합하면 되지!**

![Image](https://github.com/user-attachments/assets/b9395d04-e273-45ea-b253-e76e767476da){: .align-center}

#### 파이썬 코드 예시

```python
import numpy as np

def NAND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([-0.5, -0.5])
    b = 0.7
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1

def AND(x1, x2):
    x = np.array([x1, x2])
    w = np.array([0.5, 0.5])
    b = -0.7
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1

def OR(x1, x2):
    x = np.array([x1, x2])
    w = np.array([0.5, 0.5])
    b = -0.2
    tmp = np.sum(w*x) + b
    if tmp <= 0:
        return 0
    else:
        return 1

def XOR(x1, x2):
    return AND(NAND(x1, x2), OR(x1, x2))

if __name__ == '__main__':
    for xs in [(0, 0), (1, 0), (0, 1), (1, 1)]:
        y = XOR(xs[0], xs[1])
        print(str(xs) + " -> " + str(y))
```

