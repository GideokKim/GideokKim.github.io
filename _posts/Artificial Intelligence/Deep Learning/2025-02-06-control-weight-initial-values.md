---
title: "[Deep Learning] 6. 가중치의 초기값을 설정하는 방법"
date: 2025-02-06 09:00:00 +0900
last_modified_at: 2025-02-06 09:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - neural network
  - weight initialization
  - weight initialization methods

toc: true
toc_sticky: true
---

# 🎯 가중치의 초기값을 설정하는 방법

> 가중치의 초기값을 설정할 때 어떤 부분을 고려해야 하는지 살펴보자.

- 용어 정리

```
입력: x = [0.1, 0.2, 0.3]
가중치: w = [0.4, 0.5, 0.6]
선형변환: a = 0.1*0.4 + 0.2*0.5 + 0.3*0.6 = 0.32
활성화값: z = tanh(0.32) = 0.31
```

## 1. ❌ 초기값을 0이나 균일한 값으로 설정하면 안되는 이유

- 오차역전파법에서 모든 가중치의 값이 똑같이 갱신되어 학습이 올바로 이뤄지지 않는다.
- **가중치의 대칭적인 구조를 무너뜨리기 위해 초기값을 랜덤으로 설정한다.**

## 2. 🔍 여러가지 가중치 초기화 방법 시도해보기

### ⚠️ 가중치를 표준편차 1인 정규분포로 초기화

> sigmoid 함수의 활성화 값은 0에 가까운 값이 많다.

- **vanishing gradient 현상이 발생한다.**
- sigmoid 함수의 활성화 값이 0과 1에 치우치기 때문에 기울기가 0에 가까워 학습이 진행되지 않는다.

![Image](https://github.com/user-attachments/assets/20fee0d3-41d5-4555-a32a-a3efd479ad58){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - sigmoid 함수의 활성화 값*

### ⚠️ 가중치를 평균이 0이고 표준편차가 0.01인 정규분포로 초기화

- **표현력 제한 문제 발생**: 다수의 뉴런이 거의 같은 값을 출력해서 한개의 뉴런을 쓰는 것과 차이가 없다.
  - sigmoid, ReLU, tanh 모두 표현력 제한 문제가 발생한다.

![Image](https://github.com/user-attachments/assets/7c0cb09c-3c43-43d9-93a5-33a4b9b10248){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - 표현력 제한 문제*

### ✅ Xavier 초기값

> 각 층의 활성화 값들을 광범위하게 분포시키는 것이 목표

- 표준편차가 $\frac{1}{\sqrt{n}}$인 정규분포를 사용한다.
- 층이 깊어지면서 넓게 분포된다.
- 각 층에 흐르는 데이터는 적당히 퍼져있다.
- **시그모이드 함수 표현력에 제한받지않고 학습이 효율적으로 이루어질 수 있다.**
- ReLU 함수에는 적합하지 않다.

![Image](https://github.com/user-attachments/assets/cef8ed09-59e8-455a-871d-1ff1c621206c){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - sigmoid 함수에 적합한 Xavier 초기값*

### ✅ He 초기값

> sigmoid가 아닌 ReLU 함수를 사용하는 경우에 사용하는 초기값

- 표준편차가 $\sqrt{\frac{2}{n}}$인 정규분포를 사용한다.
- ReLU 함수는 음의 영역이 0이라서 $\sqrt{\frac{2}{n}}$를 사용한다.

![Image](https://github.com/user-attachments/assets/7917c946-93c7-410d-84bd-30be53c84c18){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - ReLU 함수에 적합한 He 초기값*

### 📊 MNIST 데이터셋으로 본 가중치 초기값 비교

- std 0.01 일때: 학습이 전혀 이뤄지지 않는다.
  - 활성화 값의 분포처럼 순전파때 너무 작은 값으로 흐르고 역전파때 기울기가 작아져 가중치가 거의 갱신되지 않음.
- He/Xavier: 학습이 순조롭게 이루어짐
  - He는 Xavier보다 학습 진도가 더 빠름.

![Image](https://github.com/user-attachments/assets/d3f20bcf-3ee5-4591-871a-663e145f3595){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - MNIST 데이터셋으로 본 가중치 초기값 비교*
