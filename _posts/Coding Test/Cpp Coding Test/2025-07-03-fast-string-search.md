---
title: "[C++] 문자열 회전 검사를 위한 효율적인 문자열 검색 기법"
date: 2025-07-03 15:00:00 +0900
last_modified_at: 2025-07-03 15:00:00 +0900
categories:
  - Cpp Coding Test
tags:
  - cpp
  - string
  - rotation
  - find
  - algorithm

toc: true
toc_sticky: true
---

# 🎯 목표

> 문자열의 회전 여부를 검사할 때, 문자열 연결(concatenation)과 find 함수를 활용하여 효율적으로 해결하는 방법을 알아본다.

## 문제 상황

문자열 A가 문자열 B의 회전된 형태인지 검사하는 문제가 자주 출제된다.

예를 들어:
- A = "hello", B = "llohe" (회전된 형태)
- A = "apple", B = "pleap" (회전된 형태)
- A = "hello", B = "world" (회전된 형태가 아님)

## 💡 해결 아이디어

1. 문자열 B를 자기 자신과 연결(B + B)하면, 가능한 모든 회전 형태가 포함된다.
2. 연결된 문자열에서 A를 찾으면(find), 회전 여부를 한 번에 확인할 수 있다.

### 구현 코드

```cpp
#include <string>

int solution(std::string A, std::string B) {
    B += B;  // B를 자기 자신과 연결
    return B.find(A);  // A가 존재하면 시작 위치, 없으면 string::npos 반환
}
```

## 동작 원리

1. **문자열 연결**
   ```cpp
   원본: B = "llohe"
   연결 후: B = "llohellohe"
   ```
   - 모든 가능한 회전 형태가 부분 문자열로 포함됨

2. **find 함수 활용**
   - 반환값:
     - 찾은 경우: 시작 위치 (0 이상의 정수)
     - 못 찾은 경우: `string::npos` (-1로 해석됨)

## 시간 복잡도 분석

- 문자열 연결: O(N), N은 문자열 B의 길이
- find 함수: O(N*M), N은 B+B의 길이, M은 A의 길이
- 전체 시간 복잡도: O(N*M)

## 💡 코딩 테스트 팁

1. **string::npos 활용**
   ```cpp
   if (B.find(A) != string::npos) {
       // 회전된 형태가 존재
   }
   ```

2. **예외 처리**
   ```cpp
   if (A.length() != B.length()) return -1;  // 길이가 다르면 회전 불가능
   if (A.empty() && B.empty()) return 0;     // 둘 다 빈 문자열이면 회전 가능
   ```

3. **메모리 최적화**
   ```cpp
   // 참조를 사용하여 불필요한 복사 방지
   int solution(const string& A, const string& B)
   ```

## 📝 실전 응용

```cpp
#include <string>

int solution(const std::string& A, const std::string& B) {
    // 기본 예외 처리
    if (A.length() != B.length()) return -1;
    if (A.empty() && B.empty()) return 0;
    
    // 회전 검사
    string doubled = B + B;
    return doubled.find(A);
}
```

## 🎯 추가 최적화 팁

1. **문자열 길이 비교**
   - 회전된 문자열은 반드시 길이가 같아야 함
   - 첫 번째 검사로 활용하면 불필요한 연산 방지

2. **빈 문자열 처리**
   - 입력이 빈 문자열일 수 있음을 고려
   - 보통 이런 경우 0(회전 가능)을 반환

3. **const 참조 사용**
   - 문자열 복사를 방지하여 메모리 사용 최적화
   - 특히 긴 문자열에서 효과적
