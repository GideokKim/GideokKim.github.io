---
title: "[알고리즘] 동적 계획법(Dynamic programming) - 메모이제이션"
date: 2025-03-03 09:00:00 +0900
last_modified_at: 2025-03-03 09:00:00 +0900
categories: 
  - Algorithm Theory
tags:
  - dynamic programming
  - algorithm
  - coding test
  - memoization

toc: true
toc_sticky: true
---

## 1. 🔍 동적 계획법(Dynamic programming)

> 동적 계획법을 간단히 정의하면 전체 문제를 한 번에 해결하는 것이 아니라 작은 부분 문제들을 해결하고, 이것들을 활용하여 전체 문제를 해결하는 방법이다.

### ⚡ 동적 계획법을 효율적으로 활용하기 위한 조건

- 큰 문제를 작은 문제로 나누었을 때 **동일한 작은 문제가 반복해서 등장**해야 한다.
  - 큰 문제를 나누었을 때 작은 문제가 여러 개 반복되는 문제를 **중복 부분 문제(overlapping subproblems)**라고 한다.
- 큰 문제의 해결책은 작은 문제의 해결책의 합으로 구성할 수 있어야 한다.
  - 작은 문제의 해결책의 합으로 큰 문제를 해결할 수 있는 구조를 **최적 부분 구조(optimal substructure)**라고 한다.

## 2. 📝 점화식 세우기와 동적 계획법

> 동적 계획법을 적용하기 위해서는 문제를 점화식으로 표현하는 것이 매우 중요하다. 점화식이란 수열의 항 사이의 관계를 나타내는 식으로, 이전 항들과 현재 항 사이의 관계를 수식으로 표현한 것이다.

### 🎯 점화식 세우기 연습 방법

1. **단계별 접근**
    - 작은 입력값부터 시작하여 패턴 파악
    - 예: n=1, n=2, n=3일 때의 결과를 나열

2. **상태 다이어그램 그리기**
    - 현재 상태와 이전 상태의 관계를 시각화
    - 화살표로 의존 관계 표시

3. **경계 조건 고려**
    - 입력값이 최소일 때의 처리 방법
    - 예외 케이스 처리 방법

### 점화식 구현: 재귀 활용

> 동적 계획법은 아니지만 동적 계획법이 왜 필요한지에 대해 생각해보자.

- 먼저 단순 재귀를 사용하여 피보나치 수열을 구현해보면 다음과 같다.

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

```cpp
int fibonacci(int n) {
    if (n <= 1)
        return n;
    return fibonacci(n-1) + fibonacci(n-2);
}
```

- $n$이 작은 숫자의 경우 문제 없이 풀 수 있지만, **$n$이 커질 경우 함수 호출 정보가 스택 메모리에 쌓이면서 메모리 한계로 런타임 에러가 발생**할 수 있다.
- 스택 메모리 한계를 피하는 방법은 다음과 같다.
  - **반복문**: 재귀 호출 자체를 쓰지 않는다.
  - **메모이제이션(memoization)**: 재귀 호출 횟수를 줄인다.
- 이 구현의 또다른 문제점을 살펴보자.

```
   fibonacci(5)의 호출 트리:
   
                     fib(5)
                   /        \
              fib(4)        fib(3)
             /      \      /      \
        fib(3)     fib(2) fib(2)  fib(1)
       /     \     /    \
   fib(2)  fib(1) fib(1) fib(0)
   /    \
fib(1) fib(0)
```
1. **중복 계산 문제**
   - fib(3)이 2번 계산됨
   - fib(2)가 3번 계산됨
   - n이 커질수록 중복 계산이 기하급수적으로 증가
2. **시간 복잡도 분석**
   - 각 함수 호출마다 2개의 새로운 함수를 호출
   - 트리의 높이는 $n$
   - 총 함수 호출 횟수는 약 $O(2^n)$

- 이러한 비효율성 때문에 단순 재귀 및 반복문 대신 동적 계획법을 사용한다.
- 동적 계획법은 이미 계산한 값을 저장(memoization)하여 중복 계산을 방지한다.

## 3. 💡 메모이제이션(Memoization)

> 메모이제이션은 동적 계획법의 핵심 기술 중 하나로, 이미 계산한 결과를 메모리에 저장하여 동일한 계산의 반복 수행을 제거하는 기술이다.

- 피보나치 수열 계산으로 메모이제이션을 생각해보자.
- 만약 그림이 어렵다면 아래 구현된 코드를 보고 다시 생각해보자.

![Image](https://github.com/user-attachments/assets/28a1510e-ae30-49e1-9e35-7b0ff10b4349){: .align-center}

- $fib(5)$를 구하기 위해 $fib(4)$와 $fib(3)$을 호출하는데, $fib(4)$를 구하기 위해 $fib(3)$과 $fib(2)$를 호출한다.
- 이때 $fib(3)$을 구하기 위해 $fib(2)$와 $fib(1)$을 호출하는데, $fib(2)$를 구하기 위해 $fib(1)$과 $fib(0)$을 호출한다.
- 이렇게 호출된 함수들의 결과를 메모리에 저장하여 중복 계산을 방지한다.
- $fib(0)$과 $fib(1)$은 메모이제이션 없이 바로 1을 return하도록 구현할 예정이므로 가장 먼저 메모리에 저장되는 값은 $fib(2)$이다.

![Image](https://github.com/user-attachments/assets/6002000e-da7a-4730-9d71-6a51251faf3b){: .align-center}

- 이어서 $fib(3)$을 구하기 위해 $fib(2)$와 $fib(1)$을 호출하는데, $fib(2)$는 이미 메모리에 저장되어 있으므로 바로 값을 return한다.
- $fib(3)$은 최초로 계산되는 값이므로 메모리에 저장한다.

![Image](https://github.com/user-attachments/assets/c2c67789-015a-4706-b400-47c6b340166f){: .align-center}

- 다음으로 $fib(4)$를 구하기 위해 $fib(3)$과 $fib(2)$를 호출하는데, $fib(2)$은 이미 메모리에 저장되어 있으므로 바로 값을 return한다.

![Image](https://github.com/user-attachments/assets/e74daaea-b63b-4f27-88ff-9bd3e1e87f33){: .align-center}

- 마찬가지로 $fib(3)$은 이미 메모리에 저장되어 있으므로 더 이상 재귀 호출을 하지 않고 바로 값을 return한다.

![Image](https://github.com/user-attachments/assets/40079c77-ce3c-4ba9-8e54-1ce97d2f72bb){: .align-center}

- $fib(4)$는 최초로 계산되는 값이므로 메모리에 저장한다.

![Image](https://github.com/user-attachments/assets/7867d4f9-59ea-4fd6-90bb-565031c8f2f1){: .align-center}

- 마지막으로 $fib(5)$를 구하기 위해 $fib(4)$와 $fib(3)$을 호출하는데, $fib(4)$는 이미 메모리에 저장되어 있으므로 재귀 호출 없이 바로 값을 return한다.

![Image](https://github.com/user-attachments/assets/a72a28bf-de6a-4a0a-9c8a-7d6c73cbf9ba){: .align-center}

### 점화식 구현: 재귀 + 메모이제이션

> 재귀 호출의 장점을 살리면서 중복 계산을 방지하기 위해 메모이제이션을 활용할 수 있다.

```python
def fibonacci(n, memo=None):
    if memo is None:
        memo = [-1] * (n + 1)
    
    if n <= 1:
        return n
        
    if memo[n] != -1:  # 이미 계산된 값이 있다면 반환
        return memo[n]
        
    memo[n] = fibonacci(n-1, memo) + fibonacci(n-2, memo)
    return memo[n]
```

```cpp
int fibonacci(int n, vector<int>& memo) {
    if (n <= 1)
        return n;
        
    if (memo[n] != -1)  // 이미 계산된 값이 있다면 반환
        return memo[n];
        
    memo[n] = fibonacci(n-1, memo) + fibonacci(n-2, memo);
    return memo[n];
}

// 함수 호출
int n = 5;
vector<int> memo(n + 1, -1);  // 메모이제이션 배열 초기화
int result = fibonacci(n, memo);
```
