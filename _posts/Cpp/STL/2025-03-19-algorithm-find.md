---
title: "[C++ STL] find(원소 찾기) 사용법"
date: 2025-03-19 09:00:00 +0900
last_modified_at: 2025-03-19 09:00:00 +0900
categories:
  - STL
tags:
  - find
  - algorithm
  - C++

toc: true
toc_sticky: true
---

## 🔍 find

> 원소를 찾을 때 사용하는 함수이다.

### find가 정의된 헤더

```cpp
#include <algorithm>
```

### 사용법

> iterator 범위를 지정하여 원소를 찾는다. 반환값은 원소의 iterator이다.

```cpp
std::find(first, last, value);
```

- `first`: 찾을 범위의 시작 iterator
- `last`: 찾을 범위의 끝 iterator
- `value`: 찾을 값

### 성능

> 원소를 찾는 것은 시간복잡도가 O(n)이다.

### 예제

> 반환값은 iterator이며, 찾지 못한 경우 `last`를 반환한다. 가장 앞에 있는 원소의 iterator를 반환한다.

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> v = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5};
    auto it = std::find(v.begin(), v.end(), 5);
    if (it != v.end()) {
        std::cout << "Found: " << *it << std::endl;
    } else {
        std::cout << "Not found" << std::endl;
    }
}
```

```
Output:
Found: 5
```
