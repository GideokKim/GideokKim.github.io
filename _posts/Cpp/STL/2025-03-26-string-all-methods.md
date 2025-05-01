---
title: "[C++ STL] string 모든 멤버 함수 코딩 테스트 대비 정리"
date: 2025-03-26 09:00:00 +0900
last_modified_at: 2025-05-01 18:00:00 +0900
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

### 생성자

> 문자열을 생성하는 멤버 함수이다.

```cpp
std::string(); // 빈 문자열 생성
std::string(const std::string& str); // 복사 생성자
std::string(const std::string& str, size_t pos, size_t len); // 부분 문자열 생성
```

#### 예제

```cpp
std::string str1; // 빈 문자열 생성
std::string str2("Hello, World!"); // 문자열 생성
std::string str3(str2, 7, 5); // 부분 문자열 생성
```

```bash
str1: ""
str2: "Hello, World!"
str3: "World"
```

### find - 문자열에서 특정 문자 또는 문자열 찾기

> 문자열에서 특정 **문자 또는 문자열**을 찾는 멤버 함수이다.

```cpp
// str은 std::string 타입의 변수
str.find(c); // c는 char 타입
str.find(str2); // str2는 std::string 타입
str.find(c, pos); // c는 char 타입, pos는 size_t 타입
str.find(str2, pos); // str2는 std::string 타입, pos는 size_t 타입
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

### resize - 문자열 크기 변경

> 문자열의 실제 크기(size)를 변경하는 멤버 함수이다.

```cpp
void resize(size_t n);               // 크기를 n으로 변경
void resize(size_t n, char c);       // 크기를 n으로 변경하고 확장된 부분을 문자 c로 채움
```

- 크기가 커지면 새로운 문자들이 추가됨
- 크기가 작아지면 초과분이 잘림
- 확장 시 채울 문자를 지정하지 않으면 '\0'로 채워짐

#### 예제

```cpp
std::string str = "hello";
std::cout << str.size() << std::endl;     // 출력: 5
std::cout << str << std::endl;            // 출력: hello

str.resize(7, '!');                       // 크기를 7로 늘리고 '!'로 채움
std::cout << str.size() << std::endl;     // 출력: 7
std::cout << str << std::endl;            // 출력: hello!!

str.resize(3);                            // 크기를 3으로 줄임
std::cout << str.size() << std::endl;     // 출력: 3
std::cout << str << std::endl;            // 출력: hel
```

### reserve - 문자열 용량 예약

> 문자열을 위한 메모리 용량(capacity)을 예약하는 멤버 함수이다.

```cpp
void reserve(size_t n = 0);          // 용량을 n으로 예약
```

- 문자열의 용량(capacity)만 변경하고 실제 크기(size)는 변경하지 않음
- 문자열의 내용도 변경되지 않음
- **메모리 재할당 횟수를 줄여 성능을 최적화할 때 사용**

#### 예제

```cpp
std::string str = "hello";
std::cout << str.size() << std::endl;        // 출력: 5
std::cout << str.capacity() << std::endl;    // 출력: 구현에 따라 다름
std::cout << str << std::endl;               // 출력: hello

str.reserve(20);                             // 용량을 20으로 예약
std::cout << str.size() << std::endl;        // 출력: 5 (변화 없음)
std::cout << str.capacity() << std::endl;    // 출력: 20
std::cout << str << std::endl;               // 출력: hello (변화 없음)
```

### length/size - 문자열 길이 반환

> 문자열의 길이를 반환하는 멤버 함수이다.

```cpp
size_t length() const;
size_t size() const;    // length()와 동일
```

- `length()`와 `size()`는 완전히 동일한 함수
- 널 문자('\0')는 길이에 포함되지 않음

#### 예제

```cpp
std::string str = "Hello";
std::cout << str.length() << std::endl;  // 출력: 5
std::cout << str.size() << std::endl;    // 출력: 5
```

### empty - 문자열이 비어있는지 확인

> 문자열이 비어있는지 확인하는 멤버 함수이다.

```cpp
bool empty() const;
```

- 문자열의 길이가 0이면 true 반환
- 시간 복잡도 O(1)로, `length() == 0`보다 효율적

#### 예제

```cpp
std::string str1 = "";
std::string str2 = "Hello";
std::cout << std::boolalpha;
std::cout << str1.empty() << std::endl;  // 출력: true
std::cout << str2.empty() << std::endl;  // 출력: false
```

### clear - 문자열 비우기

> 문자열의 모든 문자를 제거하는 멤버 함수이다.

```cpp
void clear();
```

- 문자열의 길이를 0으로 만듦
- capacity는 변경되지 않음

#### 예제

```cpp
std::string str = "Hello";
std::cout << str.length() << std::endl;  // 출력: 5
str.clear();
std::cout << str.length() << std::endl;  // 출력: 0
```

### append/push_back - 문자열 뒤에 추가

> 문자열 또는 문자를 뒤에 추가하는 멤버 함수이다.

```cpp
// 문자열 추가
string& append(const string& str);
string& append(const char* str);

// 단일 문자 추가
void push_back(char c);
```

- `append()`는 문자열을 추가
- `push_back()`은 단일 문자를 추가
- `+=` 연산자로도 동일한 작업 가능

#### 예제

```cpp
std::string str = "Hello";
str.append(" World");              // 문자열 추가
std::cout << str << std::endl;     // 출력: Hello World

str.push_back('!');                // 문자 추가
std::cout << str << std::endl;     // 출력: Hello World!

str += " Again";                   // += 연산자 사용
std::cout << str << std::endl;     // 출력: Hello World! Again
```

### erase - 문자열의 일부 삭제

> 문자열의 특정 위치나 범위의 문자들을 삭제하는 멤버 함수이다.

```cpp
string& erase(size_t pos = 0, size_t len = npos);  // pos부터 len개 문자 삭제
iterator erase(iterator p);                        // p가 가리키는 문자 삭제
iterator erase(iterator first, iterator last);     // [first, last) 범위 삭제
```

- 위치(pos)와 길이(len)를 지정하여 삭제
- 반복자를 사용하여 특정 위치나 범위 삭제
- 범위를 지정하지 않으면 pos부터 끝까지 삭제

#### 예제

```cpp
std::string str = "Hello World!";

str.erase(5, 1);                   // 5번 위치의 공백 삭제
std::cout << str << std::endl;     // 출력: HelloWorld!

str.erase(5);                      // 5번 위치부터 끝까지 삭제
std::cout << str << std::endl;     // 출력: Hello

str = "Hello World!";
str.erase(str.begin() + 5);        // 반복자로 공백 삭제
std::cout << str << std::endl;     // 출력: HelloWorld!
```

### insert - 문자열 삽입

> 문자열의 특정 위치에 문자나 문자열을 삽입하는 멤버 함수이다.

```cpp
string& insert(size_t pos, const string& str);    // pos 위치에 str 삽입
string& insert(size_t pos, const char* str);      // pos 위치에 str 삽입
string& insert(size_t pos, size_t n, char c);     // pos 위치에 문자 c를 n개 삽입
```

- 위치(pos)를 지정하여 문자열 삽입
- 여러 개의 동일한 문자 삽입 가능
- 잘못된 위치 지정 시 out_of_range 예외 발생

#### 예제

```cpp
std::string str = "Hello World!";

str.insert(5, " Beautiful");           // 5번 위치에 문자열 삽입
std::cout << str << std::endl;         // 출력: Hello Beautiful World!

str.insert(str.size(), "!!");        // 끝에 문자열 삽입
std::cout << str << std::endl;         // 출력: Hello Beautiful World!!!

str.insert(0, 3, '*');                 // 시작 위치에 * 3개 삽입
std::cout << str << std::endl;         // 출력: ***Hello Beautiful World!!!
```

### replace - 문자열의 일부 교체

> 문자열의 일부를 다른 문자열로 교체하는 멤버 함수이다.

```cpp
string& replace(size_t pos, size_t len, const string& str);  // pos부터 len개를 str로 교체
string& replace(size_t pos, size_t len, const char* str);    // pos부터 len개를 str로 교체
```

- 위치(pos)와 길이(len)를 지정하여 교체
- 교체할 문자열의 길이와 원본의 길이가 달라도 됨
- 잘못된 위치 지정 시 out_of_range 예외 발생

#### 예제

```cpp
std::string str = "Hello World!";

str.replace(6, 5, "C++");              // "World"를 "C++"로 교체
std::cout << str << std::endl;         // 출력: Hello C++!

str.replace(0, 5, "Goodbye");          // "Hello"를 "Goodbye"로 교체
std::cout << str << std::endl;         // 출력: Goodbye C++!
```
