---
title: "[C++ STL] isalpha(알파벳 여부 확인) 사용법"
date: 2025-04-01 09:00:00 +0900
last_modified_at: 2025-04-01 09:00:00 +0900
categories:
  - STL
tags:
  - isalpha
  - cctype
  - C++

toc: true
toc_sticky: true
---

## 🔍 isalpha

> 알파벳 여부를 확인하는 함수이다.

### isalpha가 정의된 헤더

```cpp
#include <cctype>
```

### 사용법

> 문자가 알파벳인지 확인한다.

```cpp
std::isalpha(c);
```

- `c`: 변환할 문자(`char` 타입)
  - 함수 원형은 매개변수가 `int` 타입이다.
  - 따라서 `char` 타입을 넣어도 알아서 `int` 타입으로 변환된다.
- 반환값은 다음과 같다.
  - 알파벳이 아니라면 0을 반환
  - 알파벳 대문자라면 1을 반환
  - 알파벳 소문자라면 2을 반환

### 예제

> 문자가 알파벳인지 확인한다. 문자열을 체크해야 하는 경우 문자열을 한 글자씩 쪼개서 확인해야 한다.

```cpp
#include <cctype>
#include <iostream>

int main() {
    char c;

    std::cout << "문자를 입력하세요: ";
    std::cin >> c;

    if (std::isalpha(c)) {
        std::cout << "알파벳입니다." << '\n';
    } else {
        std::cout << "알파벳이 아닙니다." << '\n';
    }
    return 0;
}
```

```
Output:
문자를 입력하세요: a
알파벳입니다.
```
