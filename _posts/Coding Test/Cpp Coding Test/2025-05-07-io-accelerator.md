---
title: "[C++] 시간 제한 초과 방지를 위한 입출력(IO) 가속기 사용법"
date: 2025-05-07 15:00:00 +0900
last_modified_at: 2025-05-07 15:00:00 +0900
categories:
  - Cpp Coding Test
tags:
  - cpp
  - io accelerator
  - tie
  - sync_with_stdio

toc: true
toc_sticky: true
---

# 🎯 목표

> 코딩 테스트에서 시간 제한 초과(TLE)를 방지하기 위해 C++의 입출력 가속기(빠른 입출력 설정)를 사용하는 방법을 정리한다.

## 주요 IO 가속기 함수

코딩 테스트에서 자주 사용하는 IO 가속기 코드는 아래와 같다.

```cpp
std::ios::sync_with_stdio(false); // C와 C++의 입출력 버퍼 동기화 해제(false 대신 0 사용 가능)
std::cin.tie(nullptr); // cin과 cout의 묶음을 해제(불필요한 flush 방지)
std::cout.tie(nullptr); // cout과 다른 스트림과 묶을 때 사용(거의 사용 X)
```

각 함수의 역할과 효과를 아래에서 설명한다.

---

### 1. `std::ios::sync_with_stdio(false);`

- **C와 C++의 입출력 버퍼를 동기화할지 여부를 설정**하는 함수이다.
- 기본값은 `true`(동기화 O)로, C의 `stdio`(예: `scanf`, `printf`)와 C++의 `iostream`(`cin`, `cout`)이 버퍼를 공유한다.
- **`false`로 설정하면 C++의 `cin`, `cout`이 독립적으로 동작**하여 입출력 속도가 빨라진다.
- 코딩 테스트에서는 보통 C 스타일 입출력을 혼용하지 않으므로, `false`로 설정하는 것이 유리하다.
- **반드시 코드의 가장 처음(입출력 전에) 호출해야 한다.**

#### 예시

```cpp
std::ios::sync_with_stdio(false);
```

---

### 2. `std::cin.tie(nullptr);`

- **`cin`과 `cout`의 묶음을 해제**하는 함수이다.
- 기본적으로 `cin`은 `cout`과 묶여 있어서, 입력 전에 출력 버퍼를 자동으로 비운다(flush).
- **묶음을 해제하면 불필요한 flush가 사라져 입출력 속도가 더 빨라진다.**
- `nullptr`로 설정하면 tie를 끊는다는 의미이다.

#### 예시

```cpp
std::cin.tie(nullptr);
```

---

### 3. `std::cout.tie(nullptr);` (거의 사용 X)

- `cout`을 다른 스트림과 묶을 때 사용하지만, 실전 코딩 테스트에서는 거의 사용하지 않는다.
- 혹시나 `cout`이 다른 스트림과 tie되어 있다면 해제하는 용도로 쓸 수 있다.
- 대부분의 경우 `std::cin.tie(nullptr);`까지만 해도 충분하다.

#### 예시

```cpp
std::cout.tie(nullptr);
```

---

## 💡 코딩 테스트에서의 활용

- 세 줄을 모두 사용하는 것이 관례처럼 굳어져 있다.
- **입출력 속도가 최대 10배 이상 빨라질 수 있으므로, 입력 데이터가 많을 때는 반드시 사용하자.**
- C 스타일 입출력(`scanf`, `printf`)과 혼용하면 안 됨(동기화 해제 시 버퍼 꼬임 발생 가능).

#### 실전 예시

```cpp
#include <iostream>

int main() {
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);
    std::cout.tie(nullptr); // 생략해도 무방

    int n;
    std::cin >> n;
    std::cout << n << '\n';
    return 0;
}
```

---

## 📝 정리

- `std::ios::sync_with_stdio(false);` : C/C++ 입출력 버퍼 동기화 해제(입출력 가속)
- `std::cin.tie(nullptr);` : cin/cout 묶음 해제(불필요한 flush 방지)
- `std::cout.tie(nullptr);` : 거의 사용하지 않지만 혹시 모를 tie 해제
- **코딩 테스트에서는 세 줄 모두 맨 앞에 써두는 것이 안전하다!**
