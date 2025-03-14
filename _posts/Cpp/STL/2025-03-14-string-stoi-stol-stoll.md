---
title: "[C++ STL] stoi, stol, stoll 사용법"
date: 2025-03-14 13:00:00 +0900
last_modified_at: 2025-03-14 13:00:00 +0900
categories:
  - STL
tags:
  - string
  - stoi
  - stol
  - stoll
  - C++

toc: true
toc_sticky: true
---

## 🔍 stoi, stol, stoll

> 문자열을 수로 변환할 때 사용하는 함수이다.

### stoi, stol, stoll가 정의된 헤더

```cpp
#include <string>
```

### 사용법

> 수를 인자로 받아 제곱근을 반환한다.

```cpp
std::stoi(a, base);
std::stol(a, base);
std::stoll(a, base);
```

- `a`: 수로 이루어진 문자열
- `base`: 진법(자주 안쓰는 진법도 가능, 기본값은 10)

### 특징

#### 예외를 던지는 상황
- 문자열이 수로 변환되지 않는 경우 예외를 던진다.
- 숫자 앞에 문자가 있는 경우 예외를 던진다.

#### 숫자 이외의 문자가 있는 경우
- 공백이 있는 경우 공백을 제거하고 변환한다.
- 숫자 뒤에 문자가 있는 경우 문자를 무시한다.


### 예제

> 반환값은 나누어 떨어지지 않는 경우 소수점 자리까지 반환한다.

```cpp
#include <iomanip>
#include <iostream>
#include <stdexcept>
#include <string>
#include <utility>
 
int main()
{
    const auto data =
    {
        "45",
        "+45",
        " -45",
        "3.14159",
        "31337 with words",
        "words and 2",
        "12345678901",
    };
 
    for (const std::string s : data)
    {
        std::size_t pos{};
        try
        {
            std::cout << "std::stoi(" << std::quoted(s) << "): ";
            const int i{std::stoi(s, &pos)};
            std::cout << i << "; pos: " << pos << '\n';
        }
        catch (std::invalid_argument const& ex)
        {
            std::cout << "std::invalid_argument::what(): " << ex.what() << '\n';
        }
        catch (std::out_of_range const& ex)
        {
            std::cout << "std::out_of_range::what(): " << ex.what() << '\n';
            const long long ll{std::stoll(s, &pos)};
            std::cout << "std::stoll(" << std::quoted(s) << "): " << ll
                      << "; pos: " << pos << '\n';
        }
    }
 
    std::cout << "\nCalling with different radixes:\n";
    for (const auto& [s, base] : {std::pair<const char*, int>
        {"11",  2}, {"22",  3}, {"33",  4}, {"77",  8},
        {"99", 10}, {"FF", 16}, {"jJ", 20}, {"Zz", 36}})
    {
        const int i{std::stoi(s, nullptr, base)};
        std::cout << "std::stoi(" << std::quoted(s)
                  << ", nullptr, " << base << "): " << i << '\n';
    }
}
```

```
Output:
std::stoi("45"): 45; pos: 2
std::stoi("+45"): 45; pos: 3
std::stoi(" -45"): -45; pos: 4
std::stoi("3.14159"): 3; pos: 1
std::stoi("31337 with words"): 31337; pos: 5
std::stoi("words and 2"): std::invalid_argument::what(): stoi
std::stoi("12345678901"): std::out_of_range::what(): stoi
std::stoll("12345678901"): 12345678901; pos: 11
 
Calling with different radixes:
std::stoi("11", nullptr, 2): 3
std::stoi("22", nullptr, 3): 8
std::stoi("33", nullptr, 4): 15
std::stoi("77", nullptr, 8): 63
std::stoi("99", nullptr, 10): 99
std::stoi("FF", nullptr, 16): 255
std::stoi("jJ", nullptr, 20): 399
std::stoi("Zz", nullptr, 36): 1295
```
