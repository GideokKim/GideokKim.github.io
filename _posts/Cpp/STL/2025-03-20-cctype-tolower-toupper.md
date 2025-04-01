---
title: "[C++ STL] tolower, toupper(대소문자 변환) 사용법"
date: 2025-03-20 09:00:00 +0900
last_modified_at: 2025-04-01 09:00:00 +0900
categories:
  - STL
tags:
  - tolower
  - toupper
  - cctype
  - locale
  - C++

toc: true
toc_sticky: true
---

## 🔍 tolower, toupper(cctype)

> 대소문자 변환을 할 때 사용하는 함수이다.

### tolower, toupper가 정의된 헤더

> `cctype` 헤더에 정의되어 있지만 전역 네임스페이스(`::`)를 붙여서 사용하면 바로 사용할 수 있다. 그래도 헤더를 불러오는 것이 좋다.

```cpp
#include <cctype>
```

### 사용법

> 문자를 대소문자로 변환한다. **ASCII 문자만 처리가 가능하다.**

```cpp
::tolower(c);
::toupper(c);
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

    char lower = ::tolower(c); // 소문자로 변환
    char upper = ::toupper(c); // 대문자로 변환

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

> 문자열의 경우 algorithm 헤더의 `std::transform` 함수를 사용하면 더 쉽게 문자열을 대소문자로 변환할 수 있다.

```cpp
#include <algorithm>
#include <string>
#include <iostream>

int main() {
    std::string line;
    std::getline(std::cin, line);

    std::transform(line.begin(), line.end(), line.begin(), ::tolower);
    std::cout << line << std::endl;
    
}
```

```
Output:
문자열을 입력하세요: Hello World!
hello world!
```

## 🔍 tolower, toupper(locale)

> `locale` 헤더에 정의되어 있는 함수를 사용하면 문자를 대소문자로 변환할 수 있다.

### 정의된 헤더

> `locale` 헤더에 정의되어 있다.

```cpp
#include <locale>
```

### 함수 원형

> 문자를 대소문자로 변환한다. **유니코드와 같은 다국어 문자도 처리할 수 있다.**

```cpp
template<class charT>
charT tolower(charT c, const std::locale& loc);
```

- `c`: 변환할 문자
- `loc`: 로케일(`locale` 타입)
  - 특정 언어 및 지역에 따라 문자의 대소문자 변환 규칙을 정의한다.

### 예제

```cpp
   #include <iostream>
   #include <locale>
   #include <string>

   int main() {
       std::locale loc; // 기본 로케일
       char c = 'A';
       char lower_c = std::tolower(c, loc);
       std::cout << lower_c << std::endl;
       return 0;
   }
```

```
Output:
a
```
