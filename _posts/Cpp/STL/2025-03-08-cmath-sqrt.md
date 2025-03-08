---
title: "[C++ STL] sqrt(제곱근) 사용법"
date: 2025-03-08 13:00:00 +0900
last_modified_at: 2025-03-08 13:00:00 +0900
categories:
  - STL
tags:
  - sqrt
  - cmath
  - C++

toc: true
toc_sticky: true
---

## 🔍 sqrt

> 제곱근을 찾을 때 사용하는 함수이다.

### sqrt가 정의된 헤더

```cpp
#include <cmath>
```

### 사용법

> 수를 인자로 받아 제곱근을 반환한다.

```cpp
std::sqrt(a);
```

- `a`: 수(정수를 넣어도 실수로 반환)

### 성능

- **시간 복잡도**: $O(1)$
  - `std::sqrt` 함수는 상수 시간에 실행된다. 이 함수는 내부적으로 하드웨어의 제곱근 계산 기능을 활용하여 매우 빠르게 동작한다.

- **정밀도**: 
  - `std::sqrt`는 부동 소수점 수를 입력으로 받아 제곱근을 계산한다. 이때, 결과는 입력 값의 정밀도에 따라 달라질 수 있으며, 일반적으로 `double` 타입의 정밀도를 유지한다. 따라서 매우 큰 수나 작은 수에 대해서도 안정적인 결과를 제공한다.

### 예제

> 반환값은 나누어 떨어지지 않는 경우 소수점 자리까지 반환한다.

```cpp
#include <cmath>
#include <iostream>
#include <vector>

int main() {
    std::vector<double> numbers = {2.0, 4.0, 9.0, 16.0, 25.0, 36.0};
    
    for (double num : numbers) {
        double result = std::sqrt(num);
        std::cout << "The square root of " << num << " is " << result << std::endl;
    }

    double negative = -4.0;
    double negativeResult = std::sqrt(negative);
    std::cout << "The square root of " << negative << " is " << negativeResult << std::endl;
}
```

```
Output:
The square root of 2 is 1.41421
The square root of 4 is 2
The square root of 9 is 3
The square root of 16 is 4
The square root of 25 is 5
The square root of 36 is 6
The square root of -4 is -nan
```
