---
title: "[C++ STL] min_element, max_element(최소값, 최대값 찾기) 사용법"
date: 2025-03-04 09:00:00 +0900
last_modified_at: 2025-05-03 16:00:00 +0900
categories:
  - STL
tags:
  - min_element
  - max_element
  - algorithm
  - C++

toc: true
toc_sticky: true
---

## 🔍 min_element, max_element

> 각각 최소값과 최대값을 찾을 때 사용하는 함수이다.

### min_element, max_element가 정의된 헤더

```cpp
#include <algorithm>
```

### 사용법

> iterator 범위를 지정하여 최소값과 최대값을 찾는다. 반환값은 최소값과 최대값의 iterator이다.

```cpp
std::min_element(first, last);
std::max_element(first, last);
```

- `first`: 시작 iterator
- `last`: 끝 iterator

### 성능

> iterator 범위가 n개의 원소를 가지고 있으면 $O(n)$의 시간 복잡도를 가진다.

### 예제

> 반환값은 iterator이므로 역참조하여 값을 출력한다.

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> v = {3, 1, 4, 7, 5, 9, 2, 6, 5, 3, 5};
    std::cout << *std::min_element(v.begin(), v.end()) << std::endl;
    std::cout << *std::max_element(v.begin(), v.end()) << std::endl;

    // 최소값과 최대값을 배열에서 삭제
    v.erase(std::min_element(v.begin(), v.end()));
    v.erase(std::max_element(v.begin(), v.end()));

    std::cout << *std::min_element(v.begin(), v.end()) << std::endl;
    std::cout << *std::max_element(v.begin(), v.end()) << std::endl;
}
```

```
Output:
1
9
2
7
```
