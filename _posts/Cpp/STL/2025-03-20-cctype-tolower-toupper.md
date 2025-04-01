---
title: "[C++ STL] tolower, toupper(대소문자 변환) 사용법"
date: 2025-03-20 09:00:00 +0900
last_modified_at: 2025-03-20 09:00:00 +0900
categories:
  - STL
tags:
  - tolower
  - toupper
  - cctype
  - C++

toc: true
toc_sticky: true
---

## 🔍 tolower, toupper

> 대소문자 변환을 할 때 사용하는 함수이다.

### tolower, toupper가 정의된 헤더

```cpp
#include <cctype>
```

### 사용법

> 문자를 대소문자로 변환한다.

```cpp
std::tolower(c);
std::toupper(c);
```

- `c`: 변환할 문자(`char` 타입)

### 성능

> 문자를 대소문자로 변환하는 것은 시간복잡도가 O(1)이다.

### 예제

> 문자를 대소문자로 변환한다. 문자열을 넣는 경우 문자열을 한 글자씩 쪼개서 변환해야 한다.

```cpp
#include <cctype>
#include <iostream>

int main() {
    char c;

    std::cout << "문자를 입력하세요: ";
    std::cin >> c;

    char lower = std::tolower(c); // 소문자로 변환
    char upper = std::toupper(c); // 대문자로 변환

    std::cout << "소문자: " << lower << '\n';
    std::cout << "대문자: " << upper << '\n';

    return 0;
}
```

```
Output:
문자를 입력하세요: a
소문자: a
대문자: A
```

```cpp
#include <cctype>
#include <iostream>
#include <string>

int main() {
    std::string input;

    std::cout << "문자열을 입력하세요: ";
    std::getline(std::cin, input); // 전체 문자열 입력

    std::string lower, upper;

    // 각 문자를 소문자와 대문자로 변환
    for (char c : input) {
        lower += std::tolower(c); // 소문자로 변환하여 추가
        upper += std::toupper(c); // 대문자로 변환하여 추가
    }

    std::cout << "소문자: " << lower << '\n';
    std::cout << "대문자: " << upper << '\n';

    return 0;
}
```

```
Output:
문자열을 입력하세요: Hello World!
소문자: hello world!
대문자: HELLO WORLD!
```
