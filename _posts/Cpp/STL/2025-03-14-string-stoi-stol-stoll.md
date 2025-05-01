---
title: "[C++] stoi, stol, stoll, stoul 사용법"
date: 2025-03-14 13:00:00 +0900
last_modified_at: 2025-05-01 16:00:00 +0900
categories:
  - Cpp Coding Test
tags:
  - string
  - stoi
  - stol
  - stoll
  - stoul
  - C++

toc: true
toc_sticky: true
---

## 🔍 문자열을 숫자로 변환하는 함수들

> C++에서 제공하는 문자열을 숫자로 변환하는 함수들을 알아봅니다.

### 헤더 파일

```cpp
#include <string>
```

### 함수 종류와 반환 타입

- `std::stoi`: 문자열을 `int` 타입으로 변환
- `std::stol`: 문자열을 `long` 타입으로 변환
- `std::stoll`: 문자열을 `long long` 타입으로 변환
- `std::stoul`: 문자열을 `unsigned long` 타입으로 변환

### 기본 사용법

```cpp
int stoi(const string& str, size_t* pos = nullptr, int base = 10);
long stol(const string& str, size_t* pos = nullptr, int base = 10);
long long stoll(const string& str, size_t* pos = nullptr, int base = 10);
unsigned long stoul(const string& str, size_t* pos = nullptr, int base = 10);
```

매개변수:
- `str`: 변환할 문자열
- `pos`: 변환된 숫자 다음 위치를 저장할 포인터 (선택적)
- `base`: 진법 (기본값 10, 2~36 사이의 값 사용 가능)

### 특징

#### 1. 문자열 처리
- 문자열 앞뒤의 공백은 무시됨
- 부호(`+`, `-`)는 인식됨
- 숫자 뒤의 문자는 무시됨
- 소수점이 있는 경우 정수 부분만 변환

#### 2. 예외 처리
- `std::invalid_argument`: 변환할 수 없는 문자열인 경우
- `std::out_of_range`: 결과가 반환 타입의 범위를 벗어나는 경우

### 예제 1: 기본 사용

```cpp
#include <iostream>
#include <string>

int main() {
    // 기본적인 변환
    std::string num1 = "123";
    std::string num2 = "  -456  ";
    std::string num3 = "789abc";

    std::cout << std::stoi(num1) << std::endl;      // 출력: 123
    std::cout << std::stoi(num2) << std::endl;      // 출력: -456
    std::cout << std::stoi(num3) << std::endl;      // 출력: 789
}
```

### 예제 2: 진법 변환

```cpp
#include <iostream>
#include <string>

int main() {
    // 다양한 진법 사용
    std::cout << std::stoi("1010", nullptr, 2) << std::endl;   // 2진수: 10
    std::cout << std::stoi("12", nullptr, 8) << std::endl;     // 8진수: 10
    std::cout << std::stoi("A", nullptr, 16) << std::endl;     // 16진수: 10
    
    // 변환 위치 확인
    std::size_t pos;
    std::string str = "123abc";
    int value = std::stoi(str, &pos);
    std::cout << "값: " << value << ", 위치: " << pos << std::endl;  // 값: 123, 위치: 3
}
```

### 예제 3: 예외 처리

```cpp
#include <iostream>
#include <string>

int main() {
    try {
        // 잘못된 입력
        std::cout << std::stoi("abc") << std::endl;
    } catch (const std::invalid_argument& e) {
        std::cout << "변환 불가능한 문자열" << std::endl;
    }

    try {
        // 범위 초과
        std::cout << std::stoi("999999999999999999") << std::endl;
    } catch (const std::out_of_range& e) {
        std::cout << "숫자가 범위를 초과함" << std::endl;
    }
}
```
