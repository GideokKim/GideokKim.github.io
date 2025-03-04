---
title: "[C++ STL] gcd, lcm(최대공약수, 최소공배수) 사용법"
date: 2025-03-04 13:00:00 +0900
last_modified_at: 2025-03-04 13:00:00 +0900
categories:
  - STL
tags:
  - gcd
  - lcm
  - numeric
  - C++

toc: true
toc_sticky: true
---

## 🔍 gcd, lcm

> 최대공약수와 최소공배수를 찾을 때 사용하는 함수이다.

### gcd, lcm가 정의된 헤더

```cpp
#include <numeric>
```

### 사용법

> 두 수를 인자로 받아 최대공약수와 최소공배수를 반환한다.

```cpp
std::gcd(a, b);
std::lcm(a, b);
```

- `a`: 첫 번째 수(정수 계열)
- `b`: 두 번째 수(정수 계열)

### 성능

> 두 수의 크기가 작아질수록 빠르게 수렴하므로, 로그 시간 복잡도($O(log(min(a, b)))$)를 가진다.

#### std::gcd (최대공약수)
- **설명**: 유클리드 알고리즘을 사용하여 두 수의 최대공약수를 계산한다. 이 알고리즘은 두 수의 크기가 작아질수록 빠르게 수렴하므로, 로그 시간 복잡도를 가진다.

#### std::lcm (최소공배수)
- **설명**: 최대공약수를 이용하여 최소공배수를 계산한다. 최소공배수는 다음과 같은 수식으로 정의된다.
$$
lcm(a, b) = \frac{|a \times b|}{gcd(a, b)}
$$

여기서 `gcd(a, b)`를 계산하는 데 $O(log(min(a, b)))$의 시간이 소요되므로, 전체적으로 `std::lcm`의 성능도 $O(log(min(a, b)))$이다.

### 예제

> 반환값은 정수 계열이므로 값을 출력한다.

```cpp
#include <iostream>
#include <numeric>

int main() {
    std::cout << std::gcd(12, 18) << std::endl;
    std::cout << std::lcm(12, 18) << std::endl;
}
```

```
Output:
6
36
```
