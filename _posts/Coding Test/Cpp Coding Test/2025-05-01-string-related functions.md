---
title: "[C++] 문자열(std::string) 관련 함수 총정리"
date: 2025-05-01 15:00:00 +0900
last_modified_at: 2025-05-01 15:00:00 +0900
categories:
  - Cpp Coding Test
tags:
  - cpp
  - std::to_string

toc: true
toc_sticky: true
---

# 🎯 목표

> 코딩 테스트 문제에 가끔 나오는 문자열 관련 함수에 대해 알아본다.

## `std::to_string()` 함수

- 숫자를 문자열로 변환하는 함수이다.
- 주로 코딩 테스트 문제에서 숫자를 문자열로 변환해야 하는 경우 사용한다.

```cpp
std::to_string(n);
```

- `n`: 숫자(`int`, `long`, `float`, `double`, `long long`, `unsigned`, `unsigned long`, `unsigned long long`, `long double`)
- 반환 값: 숫자를 문자열로 변환한 결과

#### 예제

```cpp
int n = 123;
std::string str = std::to_string(n);
std::cout << str << std::endl;
```

```bash
str: "123"
```
