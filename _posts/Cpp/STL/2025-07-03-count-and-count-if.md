---
title: "[C++ STL] 원소 개수 세기 (count, count_if)"
date: 2025-07-03 22:00:00 +0900
last_modified_at: 2025-07-03 22:00:00 +0900
categories:
  - STL
tags:
  - count
  - count_if
  - algorithm
  - C++
  - STL

toc: true
toc_sticky: true
---

## 🔍 std::count

> C++ STL에서 제공하는 원소 개수 세기 알고리즘으로, 주어진 값이 몇 번 등장하는지 세어준다.

### count가 정의된 헤더

```cpp
#include <algorithm>
```

### 기본 사용법

> 컨테이너에서 특정 값과 일치하는 원소의 개수를 반환한다.

```cpp
// 기본 count
std::count(first, last, value);

// count_if를 사용한 조건부 카운팅
std::count_if(first, last, pred);
```

- `first`, `last`: 탐색할 구간의 시작/끝 반복자
- `value`: 찾을 값
- `pred`: 조건자(predicate) 함수. 원소가 특정 조건을 만족하는지 검사
- 반환값: 일치하는 원소의 개수 (`difference_type` 타입)

### 동작 원리

- `count`: 단순히 순차 탐색하면서 `==` 연산자로 일치 여부 확인
- `count_if`: 순차 탐색하면서 조건자 함수를 호출하여 조건 만족 여부 확인
- 시간복잡도: $O(n)$ (모든 원소를 한 번씩 검사)
- 공간복잡도: $O(1)$ (추가 메모리 사용 없음)

### 예제

```cpp
#include <algorithm>
#include <iostream>
#include <vector>
#include <string>

// count_if를 위한 조건자 함수
bool isEven(int n) {
    return n % 2 == 0;
}

// 구조체에서의 count 사용
struct Person {
    std::string name;
    int age;
    
    // == 연산자 오버로딩
    bool operator==(const Person& other) const {
        return age == other.age;
    }
};

int main() {
    // 기본 타입에서의 count 사용
    std::vector<int> v1 = {1, 2, 3, 2, 4, 2, 5};
    int count_2 = std::count(v1.begin(), v1.end(), 2);
    std::cout << "2의 개수: " << count_2 << "\n";  // 출력: 3

    // count_if를 사용한 짝수 개수 세기
    int even_count = std::count_if(v1.begin(), v1.end(), isEven);
    std::cout << "짝수의 개수: " << even_count << "\n";

    // 람다 함수를 사용한 count_if
    int count_greater_3 = std::count_if(v1.begin(), v1.end(), 
        [](int n) { return n > 3; });
    std::cout << "3보다 큰 수의 개수: " << count_greater_3 << "\n";

    // 구조체에서의 count 사용
    std::vector<Person> people = {
        {"Alice", 20},
        {"Bob", 25},
        {"Charlie", 20},
        {"David", 30}
    };
    Person target = {"", 20};  // 나이가 20인 사람 찾기
    int count_age_20 = std::count(people.begin(), people.end(), target);
    std::cout << "20살인 사람의 수: " << count_age_20 << "\n";

    return 0;
}
```

### 활용 팁

1. **문자열 처리**
   ```cpp
   std::string str = "Hello, World!";
   int count_l = std::count(str.begin(), str.end(), 'l');
   ```

2. **복잡한 조건 검사**
   ```cpp
   auto count_in_range = std::count_if(v.begin(), v.end(),
       [](int n) { return n > 10 && n < 20; });
   ```

3. **사용자 정의 타입**
   - `count`를 사용하려면 `==` 연산자 정의 필요
   - `count_if`는 조건자 함수만 정의하면 됨

4. **컨테이너 전체 범위**
   ```cpp
   // C++17 이상
   std::count(std::begin(container), std::end(container), value);
   ```

5. **주의사항**
   - 부동소수점 비교는 오차로 인해 예상과 다른 결과가 나올 수 있음
   - 문자열 비교 시 대소문자 구분에 주의

### 성능 최적화 팁

1. **조건자 함수 최적화**
   - 간단한 조건은 람다 함수 사용
   - 복잡한 조건은 일반 함수로 분리

2. **불필요한 복사 방지**
   - 큰 객체는 const 참조로 전달
   - 조건자 함수에서 불필요한 복사 연산 제거

3. **병렬 처리 고려**
   - C++17의 실행 정책 사용 가능
   ```cpp
   std::count(std::execution::par, v.begin(), v.end(), value);
   ```
