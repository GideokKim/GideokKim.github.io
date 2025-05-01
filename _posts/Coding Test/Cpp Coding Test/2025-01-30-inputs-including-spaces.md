---
title: "[C++] 공백을 포함한 문자열 입력 받고 처리하기(std::getline(), std::ignore(), std::stringstream)"
date: 2025-01-30 15:00:00 +0900
last_modified_at: 2025-05-01 18:00:00 +0900
categories:
  - Cpp Coding Test
tags:
  - cpp
  - coding test
  - std::getline
  - std::ignore
  - std::stringstream

toc: true
toc_sticky: true
---

# 🎯 목표

> 코딩 테스트 문제에 가끔 나오는 공백을 포함한 문자열 입력 받고 공백을 기준으로 자르는 방법에 대해 알아본다.

# 🔑 `getline()` 함수를 활용한 공백을 포함한 문자열 입력 받기

- 기본적인 구분자는 개행 문자(newline, `\n`)이다.
- 만약 `getline()`을 사용하기 이전에 입력 값들이 있었고 버퍼에 개행 문자가 남아 있었다면 그 문자부터 읽어오므로 주의해야 한다.

```cpp
#include <iostream>
#include <string>

int main() {
    std::string input;
    
    // 기본 사용법 (구분자: 개행 문자 '\n')
    std::getline(std::cin, input);
    
    // 사용자 지정 구분자 사용 (구분자: ';')
    std::getline(std::cin, input, ';');
    
    return 0;
}
```

## ❗ 주의할 점

### 1. `std::cin`과 혼용 시 문제 발생

- `std::cin`과 혼용할 경우 버퍼에 개행 문자가 남아 있을 수 있다.
- `std::cin.ignore()` 함수를 사용하여 버퍼에 남은 개행 문자를 제거할 수 있다.

```cpp
// 문제의 코드
#include <iostream>
#include <string>

int main() {
    int num;
    std::string str;

    std::cin >> num;         // 123 입력
    std::getline(std::cin, str); // 개행 문자를 읽고 종료
}
```

```cpp
// 해결 방법
#include <iostream>
#include <string>

int main() {
    int num;
    std::string str;

    std::cin >> num;
    std::cin.ignore(); // 버퍼에 남은 개행 문자 제거
    std::getline(std::cin, str);
}
```

### 2. 구분자 처리

- 지정한 구분자를 만나면 **구분자는 버리고** 그 전까지의 문자열을 저장한다.
- 구분자를 만나지 않으면 최대 string::max_size()까지 읽는다.

```cpp
// 사용자 지정 구분자 예제
#include <iostream>
#include <string>

int main() {
    std::string data;
    
    // 세미콜론(;)을 구분자로 사용
    std::cout << "세미콜론으로 구분된 데이터 입력: ";
    std::getline(std::cin, data, ';');
    std::cout << "입력된 데이터: " << data << std::endl;
    
    // 콤마(,)를 구분자로 사용
    std::cout << "콤마로 구분된 데이터 입력: ";
    std::getline(std::cin, data, ',');
    std::cout << "입력된 데이터: " << data << std::endl;
    
    return 0;
}
```

```cpp
// 파일에서 특정 구분자로 읽기 예제
#include <fstream>
#include <string>

int main() {
    std::ifstream file("data.csv");
    std::string field;
    
    // CSV 파일에서 콤마로 구분된 필드 읽기
    while(std::getline(file, field, ',')) {
        std::cout << "필드 값: " << field << std::endl;
    }
    return 0;
}
```

# 🔑 `std::stringstream`을 활용한 공백으로 문자열 자르기

- `sstream` 헤더 파일을 포함해야 한다.
- `std::stringstream`을 사용하여 공백을 구분자로 자른 문자열들을 다룰 수 있다.

```cpp
#include <iostream>
#include <sstream>
#include <string>

int main() {
    std::string input;
    std::getline(std::cin, input); // this is a test 입력

    std::stringstream ss(input);
    std::string word;
    while(ss >> word) {
        std::cout << word << std::endl;
    }

    return 0;
}
```

- 출력 결과

```
this
is
a
test
```