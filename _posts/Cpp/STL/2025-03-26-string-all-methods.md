---
title: "[C++ STL] string 모든 멤버 함수 코딩 테스트 대비 정리"
date: 2025-03-26 09:00:00 +0900
last_modified_at: 2025-04-05 13:00:00 +0900
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

### find - 문자열에서 특정 문자 또는 문자열 찾기

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

### to_string - 숫자를 문자열로 변환

> **숫자를 문자열로 변환**하는 멤버 함수이다.

- 가끔 코딩 테스트에서 숫자를 문자열로 변환해야 하는 경우가 있다.

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

### std::stoul - 문자열을 부호 없는 정수로 변환

> 문자열을 부호 없는 정수로 변환하는 함수이다.

```cpp
std::stoul(str, &pos, base);
```

- `str`: 변환할 문자열
- `pos`: 변환된 문자열의 길이를 저장할 변수의 주소
- `base`: 진수(`2`, `8`, `10`, `16`)

#### 예제

```cpp
#include <iostream>
#include <string>

int main() {
    // 10진수
    std::string decimalStr = "12345";
    unsigned long decimalNum = std::stoul(decimalStr, nullptr, 10);
    std::cout << "Decimal (10): " << decimalNum << std::endl;

    // 2진수
    std::string binaryStr = "11000000111001"; // 12345의 2진수 표현
    unsigned long binaryNum = std::stoul(binaryStr, nullptr, 2);
    std::cout << "Binary (2): " << binaryNum << std::endl;

    // 8진수
    std::string octalStr = "30071"; // 12345의 8진수 표현
    unsigned long octalNum = std::stoul(octalStr, nullptr, 8);
    std::cout << "Octal (8): " << octalNum << std::endl;

    // 16진수
    std::string hexStr = "3039"; // 12345의 16진수 표현
    unsigned long hexNum = std::stoul(hexStr, nullptr, 16);
    std::cout << "Hexadecimal (16): " << hexNum << std::endl;

    return 0;
}
```

```bash
Decimal (10): 12345
Binary (2): 12345
Octal (8): 12345
Hexadecimal (16): 12345
```

### substr - 문자열 추출

> 문자열에서 특정 범위의 문자열을 추출하는 멤버 함수이다.

```cpp
str.substr(pos, len);
```

- `pos`: 추출할 문자열의 시작 위치
- `len`: 추출할 문자열의 길이

#### 예제

```cpp
std::string str = "Hello, World!";
std::string subStr = str.substr(7, 5);
std::cout << subStr << std::endl;
```

```bash
World
```

### std::string - 동일한 문자를 n개로 표현

> 동일한 문자를 n개로 표현하는 멤버 함수이다.

```cpp
std::string(n, c);
```

- `n`: 표현할 문자의 개수
- `c`: 표현할 문자

#### 예제

```cpp
std::string str = std::string(5, 'a');
std::cout << str << std::endl;
```

```bash
aaaaa
```
