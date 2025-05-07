---
title: "[C++ STL] lower_bound, upper_bound 사용법"
date: 2025-05-07 15:00:00 +0900
last_modified_at: 2025-05-07 15:00:00 +0900
categories:
  - STL
tags:
  - lower_bound
  - upper_bound
  - algorithm
  - C++

toc: true
toc_sticky: true
---

## 🔍 lower_bound, upper_bound

> 정렬된 구간에서 `이진 탐색(binary search)`을 통해 원하는 값의 위치(혹은 범위)를 빠르게 찾는 함수이다.

### lower_bound, upper_bound가 정의된 헤더

```cpp
#include <algorithm>
```

### 사용법

> 정렬된 구간에서 특정 값 이상/초과가 처음 등장하는 위치(반복자)를 반환한다.

```cpp
std::lower_bound(first, last, value);
std::upper_bound(first, last, value);
```

- `first`, `last`: 탐색할 구간의 시작/끝 반복자(보통 `begin()`, `end()`)
- `value`: 찾고자 하는 값
- 반환값: `value` 이상(혹은 초과)이 처음 등장하는 위치의 반복자(iterator)
  - **lower_bound**: "value 이상"이 처음 등장하는 위치
  - **upper_bound**: "value 초과"가 처음 등장하는 위치

> **반드시 정렬된 구간에서만 사용해야 한다!**

### 동작 원리

- 내부적으로 `이진 탐색(binary search)` 알고리즘을 사용한다.
- 시간복잡도: $O(\log n)$
- 반환값은 반복자(iterator)이므로, 인덱스가 필요하면 `it - v.begin()`처럼 변환

### 예제

```cpp
#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> v = {1, 2, 4, 4, 4, 5, 7, 9};
    int target = 4;

    // lower_bound: value 이상이 처음 등장하는 위치
    auto lower = std::lower_bound(v.begin(), v.end(), target);
    // upper_bound: value 초과가 처음 등장하는 위치
    auto upper = std::upper_bound(v.begin(), v.end(), target);

    std::cout << "lower_bound index: " << (lower - v.begin()) << '\n';
    std::cout << "upper_bound index: " << (upper - v.begin()) << '\n';

    // 구간 내 value의 개수
    std::cout << "count of target: " << (upper - lower) << '\n';

    return 0;
}
```

```
Output:
lower_bound index: 2
upper_bound index: 5
count of target: 3
```

### 활용 팁

- 값의 존재 여부: `lower != v.end() && *lower == target`이면 존재
- 값의 개수: `upper - lower`
- 정렬된 배열에서 구간/조건에 맞는 원소 개수, 위치 찾기에 매우 유용
- LIS(Longest Increasing Subsequence) 문제에서 수열이 길 때 활용하면 좋다.
