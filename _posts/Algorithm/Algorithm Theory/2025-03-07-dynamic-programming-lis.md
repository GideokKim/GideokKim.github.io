---
title: "[알고리즘] 동적 계획법(Dynamic programming) - 최장 증가 부분 수열(LIS)"
date: 2025-03-07 09:00:00 +0900
last_modified_at: 2025-05-25 19:00:00 +0900
categories:
  - Algorithm Theory
tags:
  - dynamic programming
  - algorithm
  - coding test
  - LIS

toc: true
toc_sticky: true
---

## 1. 🔍 최장 증가 부분 수열(Longest Increasing Subsequence, LIS)

> 최장 증가 부분 수열(LIS)은 주어진 수열에서 증가하는 부분 수열 중 가장 긴 수열을 찾는 문제이다.

### 1.1. LIS의 정의

- 부분 수열이란 주어진 수열에서 일부 원소를 선택하여 만든 수열이다. 여기서 **원소의 전후 관계는 유지**되어야 한다.
- 예를 들어, 수열 `[1, 4, 2, 3, 1, 5, 7, 3]`의 부분 수열은 `[1, 2, 3]`, `[2, 3, 5]`, `[1, 2, 3, 5, 7]` 등이 있다.
- 최장 증가 부분 수열은 주어진 수열에서 **원소가 오름차순을 유지**하는 부분 수열 중 가장 긴 수열을 찾는 문제이다.
  - 반드시 이전 원소가 다음 원소보다 작아야 하므로 `[1, 1, 5]`는 증가 부분 수열이 아니다.

### 1.2. LIS의 길이를 동적 계획법으로 구하기

> 최장 증가 부분 수열의 길이를 구하기 위해서는 다음과 같은 점화식을 세울 수 있다.

- 수열의 각 원소를 끝으로 하는 LIS의 길이를 구하는 것이 핵심이다.
- 예를 들어, 수열 `[1, 4, 2, 3, 1, 5, 7, 3]`의 경우, 각 원소를 끝으로 하는 LIS의 길이는 다음과 같다.
  - `1`을 끝으로 하는 LIS의 길이는 1
  - `4`를 끝으로 하는 LIS의 길이는 2
  - `2`를 끝으로 하는 LIS의 길이는 2
  - `3`을 끝으로 하는 LIS의 길이는 3
  - `1`을 끝으로 하는 LIS의 길이는 1
  - `5`를 끝으로 하는 LIS의 길이는 4
  - `7`을 끝으로 하는 LIS의 길이는 5
  - `3`을 끝으로 하는 LIS의 길이는 3
- 순차적으로 LIS를 구하는 것을 보면 이전 LIS의 길이를 활용하여 현재 LIS의 길이를 구할 수 있다.
  - 예를 들어, `[1, 4, 2, 3, 1, 5, 7, 3]`의 경우, `1`을 끝으로 하는 LIS의 길이는 1이다.
  - `4`를 끝으로 하는 LIS의 길이는 `1`을 끝으로 하는 LIS의 길이 + 1이다.
  - `2`를 끝으로 하는 LIS의 길이는 `1`을 끝으로 하는 LIS의 길이 + 1이다.(`4`로 끝나는 LIS도 체크를 하지만 증가 수열 조건에 위배되므로 무시한다.)
  - `3`을 끝으로 하는 LIS의 길이는 `2`를 끝으로 하는 LIS의 길이 + 1이다.
  - `1`을 끝으로 하는 LIS의 길이는 1이다.
  - `5`를 끝으로 하는 LIS의 길이는 `3`을 끝으로 하는 LIS의 길이 + 1이다.
  - `7`을 끝으로 하는 LIS의 길이는 `5`를 끝으로 하는 LIS의 길이 + 1이다.
  - `3`을 끝으로 하는 LIS의 길이는 `2`를 끝으로 하는 LIS의 길이 + 1이다.

## 2. 📝 LIS 구현

### 2.1. 메모이제이션을 활용한 LIS 구현

> 메모이제이션을 활용하여 LIS를 구현할 수 있다.

- 메모이제이션을 위한 배열을 `dp`라고 하자.
- `dp[i]`는 수열의 `i`번째 원소를 끝으로 하는 LIS의 길이를 저장한다.
- 초기값은 `dp[i] = 1`이다.(`i`번째 원소 자체가 부분 수열이므로 최소 길이는 1이다.)
- 점화식은 다음과 같다.
  - `dp[i] = max(dp[i], dp[j] + 1)` (단, `j < i`이고 `arr[j] < arr[i]`)

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    size_t n;
    std::cin >> n;
    std::vector<int> arr(n);
    for (size_t i = 0; i < n; i++) {
        std::cin >> arr[i];
    }

    std::vector<int> dp(n, 1);
    for (size_t i = 1; i < n; i++) {
        for (size_t j = 0; j < i; j++) {
            if (arr[j] < arr[i]) {
              dp[i] = std::max(dp[i], dp[j] + 1);
            }
        }
    }

    std::cout << *std::max_element(dp.begin(), dp.end());
}
```

### 2.2. 최적화 LIS 알고리즘의 원리와 특징

> 앞서 소개한 동적 계획법(DP) 방식은 이중 반복문을 사용하여 $O(N^2)$의 시간복잡도를 가진다. 하지만, 이보다 더 빠른 $O(N \log N)$의 시간복잡도로 LIS의 길이만을 구할 수 있는 방법이 있다.

#### 핵심 아이디어

- 이 방법은 실제 LIS를 구하는 것이 아니라, LIS의 `길이`만을 빠르게 구하는 데 초점을 둔다.
- **이분 탐색**(binary search)과 **임시 수열(lis 배열)**을 활용한다.
- 임시 수열(lis)은 실제 LIS가 아닐 수 있지만, 그 길이는 항상 정답과 같다.

#### 동작 방식

1. 임시 수열 `lis`를 빈 배열로 시작한다.
2. 수열의 각 원소를 순서대로 확인한다.
   - 만약 현재 원소가 `lis`의 마지막 값보다 크면, `lis`에 추가한다.
   - 그렇지 않으면, `lis`에서 현재 원소 이상이 처음 등장하는 위치(이분 탐색)를 찾아 그 값을 현재 원소로 교체한다.
3. 이렇게 하면 `lis`의 길이가 곧 LIS의 길이가 된다.

#### 예시 코드

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    size_t n;
    std::cin >> n;
    std::vector<int> numbers(n);
    for (size_t i = 0; i < n; ++i) {
        std::cin >> numbers[i];
    }

    std::vector<int> lis;
    lis.push_back(numbers[0]);

    for (size_t i = 1; i < n; ++i) {
        if (numbers[i] > lis.back()) {
            lis.push_back(numbers[i]);
        } else {
            auto it = std::lower_bound(lis.begin(), lis.end(), numbers[i]);
            *it = numbers[i];
        }
    }
    std::cout << lis.size();
}
```

#### 예시 동작

수열 `[1, 4, 2, 3, 1, 5, 7, 3]`에 대해 위 알고리즘이 동작하는 과정을 살펴보면:
- 1 → [1]
- 4 → [1, 4]
- 2 → [1, 2]
- 3 → [1, 2, 3]
- 1 → [1, 2, 3]
- 5 → [1, 2, 3, 5]
- 7 → [1, 2, 3, 5, 7]
- 3 → [1, 2, 3, 5, 7]

최종적으로 `lis`의 길이 5가 정답이 된다.

#### 시간복잡도

- 각 원소마다 이분 탐색($O(\log N)$)을 하므로 전체 시간복잡도는 $O(N \log N)$이다.

#### 주의점

- 이 방법으로 구한 `lis` 배열은 실제 LIS와 다를 수 있다. (길이만 같음)
- 실제 LIS의 원소를 모두 구하려면 추가적인 추적이 필요하다.

### 2.3. 실제 LIS 원소 구하기

> 앞서 설명한 O(N log N) 방식은 LIS의 길이만을 빠르게 구할 수 있지만, 실제 LIS 원소 전체를 구하려면 추가적인 추적이 필요하다.

#### pos 배열을 활용한 역추적 원리

- pos[i]는 numbers[i]가 lis의 몇 번째 위치에 들어갔는지 기록한다.
- 마지막 인덱스부터 pos[i]가 현재 찾고 있는 LIS의 위치(j)와 같을 때만 lis에 넣어주면 실제 LIS가 복원된다.

#### 예시 코드

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    size_t n;
    std::cin >> n;
    std::vector<long long> numbers(n);
    for (size_t i = 0; i < n; ++i) {
        std::cin >> numbers[i];
    }

    std::vector<long long> lis;
    std::vector<long long> pos(n);
    
    for (size_t i = 0; i < n; ++i) {
        auto it = std::lower_bound(lis.begin(), lis.end(), numbers[i]);
        if (it == lis.end()) {
            lis.emplace_back(numbers[i]);
        } else {
            *it = numbers[i];
        }
        pos[i] = static_cast<long long>(it - lis.begin());
    }

    // 실제 LIS 복원
    long long curr = static_cast<long long>(n - 1);
    long long lis_idx = static_cast<long long>(lis.size() - 1);
    while (curr >= 0 && lis_idx >= 0) {
        if (pos[curr] == lis_idx) {
            lis[lis_idx] = numbers[curr];
            --lis_idx;
        }
        --curr;
    }

    std::cout << "LIS 길이: " << lis.size() << '\n';
    std::cout << "LIS: ";
    for (long long v : lis) std::cout << v << ' ';
}
```

