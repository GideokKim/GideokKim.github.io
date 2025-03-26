---
title: "[C++ STL] string 모든 멤버 함수 코딩 테스트 대비 정리"
date: 2025-03-26 09:00:00 +0900
last_modified_at: 2025-03-26 09:00:00 +0900
categories:
  - STL
tags:
  - string
  - C++

toc: true
toc_sticky: true
---

## 🔍 string 모든 멤버 함수 코딩 테스트 대비 정리

> string 클래스의 모든 멤버 함수를 코딩 테스트 대비 정리한다.

*아직 정리되지 않은 멤버 함수들이 있습니다. 추후 업데이트 예정입니다.*

### string 클래스가 정의된 헤더

```cpp
#include <string>
```

## 멤버 함수

### find

> 문자열에서 특정 **문자 또는 문자열**을 찾는 멤버 함수이다.

```cpp
str.find(c); // str은 std::string 타입의 변수
```

- `c`: 찾을 문자(`char` 타입) 혹은 찾을 문자열(`std::string` 타입)
- 찾지 못한 경우 `std::string::npos`를 반환한다.

#### 예제

```cpp
std::string str = "Hello, World!";

// 문자열에서 특정 문자 찾기
if (str.find('o') != std::string::npos) {
    std::cout << "찾았습니다." << std::endl;
} else {
    std::cout << "찾지 못했습니다." << std::endl;
}

// 문자열에서 특정 문자열 찾기
if (str.find("World") != std::string::npos) {
    std::cout << "찾았습니다." << std::endl;
} else {
    std::cout << "찾지 못했습니다." << std::endl;
}
```