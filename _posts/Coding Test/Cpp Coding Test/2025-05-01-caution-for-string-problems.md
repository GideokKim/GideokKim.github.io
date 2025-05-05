---
title: "[C++] 문자열(std::string) 관련 문제 주의사항"
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

> 코딩 테스트 문제 중 string 관련 문제를 풀 때 주의해야 할 사항을 정리한다.

## 1. 문자열 edge case 생각

> 문자열이 비어있는 경우, 문자열의 양 끝에 공백이 있는 경우와 같은 문자열 관련 문제를 풀 때 주의해야 할 사항을 정리한다.

- 언제나 테스트 케이스를 추가하여 내 로직을 검증하자.

### 문자열 비어있는 경우

> 테스트 케이스에 빈 문자열이 들어오는 경우를 추가하여 내 로직을 검증하자.

```cpp
std::string str;
std::cout << "str: " << str << std::endl;
```

```bash
str: ""
```

### 문자열 양 끝에 공백이 있는 경우

> 문자열 양 끝에 공백이 있는 경우 문제에서 언급한 로직상 어떻게 처리해야 하는지 생각해보자.

```cpp
std::string str = " abc ";
std::cout << "str: " << str << std::endl;
```

```bash
str: "abc"
```

### 문자열 일부에 공백이 여러 번 나오는 경우

> 문자열 일부에 공백이 여러 번 나오는 경우 문제에서 언급한 로직상 어떻게 처리해야 하는지 생각해보자.

```cpp
std::string str = "a  bc";
std::cout << "str: " << str << std::endl;
```

```bash
str: "a  bc"
```

### edge case reference

1. 백준 1152번: 단어의 개수

## 2. 알파벳 카운팅 문제

1. 알파벳은 총 26개이다.
2. 대소문자 구분을 하지 않는 경우가 있을 수 있다.
3. 대소문자 구분을 하지 않는 경우 모든 알파벳을 소문자로 변환하여 카운팅 한다.
4. 알파벳을 카운팅할 때 인덱스는 아래 예시처럼 짜면 편하다.

```cpp
std::string str = "abc";
std::vector<int> alphabet(26, 0);

for (char c : str) {
    alphabet[c - 'a']++;
}
```

```bash
alphabet: [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
```
