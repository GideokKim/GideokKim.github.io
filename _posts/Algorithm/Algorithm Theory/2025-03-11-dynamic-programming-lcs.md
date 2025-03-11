---
title: "[알고리즘] 동적 계획법(Dynamic Programming) - 최장 공통 부분 수열(LCS)"
date: 2025-03-11 14:00:00 +0900
last_modified_at: 2025-03-11 14:00:00 +0900
categories:
  - Algorithm Theory
tags:
  - dynamic programming
  - algorithm
  - coding test
  - LCS

toc: true
toc_sticky: true
---

## 1. 🔍 최장 공통 부분 수열(Longest Common Subsequence, LCS)

> 최장 공통 부분 수열(LCS)은 두 개의 문자열에서 공통으로 등장하는 가장 긴 부분 수열을 찾는 문제이다.

### 1.1. LCS의 정의

- **부분 수열 (Subsequence)**: 주어진 수열에서 일부 원소를 선택하여 만든 수열이다. 이때, 선택된 원소들은 원래 수열의 순서를 유지해야 한다. 즉, 원소의 전후 관계가 보존되어야 한다.
  - 예를 들어, 수열 `[A, B, C, D, E]`에서 `B`와 `D`를 선택하면 `[B, D]`는 부분 수열이지만, `[D, B]`는 원래 순서를 유지하지 않으므로 부분 수열이 아니다.
- **최장 공통 부분 수열 (Longest Common Subsequence, LCS)**: 두 개의 수열에서 공통으로 발견할 수 있는 부분 수열 중 가장 긴 수열을 의미 한다. LCS는 두 수열 간의 유사성을 측정하는 데 유용하며, 문자열 비교, 데이터 비교 및 버전 관리 시스템 등 다양한 분야에서 활용된다.
  - 예를 들어, 수열 `[A, B, C, D, A, B]`와 `[B, D, C, A, B, A]`의 LCS는 `[B, A]` 또는 `[A, B]`로, 길이는 2이다.

### LCS의 길이를 동적 계획법으로 구하기

> 최장 공통 부분 수열의 길이를 구하기 위해서는 다음과 같은 점화식을 세울 수 있다.

- 수열의 각 원소를 끝으로 하는 LCS의 길이를 구하는 것이 핵심이다.
- 예를 들어, 수열 `[A, B, C]`와 `[B, D, F, G, C]`의 경우, LCS의 길이는 다음과 같다.
  - 첫번째 수열의 `A`와 두번째 수열의 `B, D, F, G, C`는 공통 원소가 없으므로 0이다.
  - 첫번째 수열의 `B`와 두번째 수열의 `B, D, F, G, C`는 공통 원소가 `B`이므로 1이다.
  - 첫번째 수열의 `C`와 두번째 수열의 `B, D, F, G, C`는 공통 원소가 `C`이므로 1이다.
  - 여기서 두번째 수열의 `B`와 `C`는 순서가 역방향이 아니므로 최종 LCS는 2가 된다.

### 메모이제이션을 활용한 LCS 구현

> 메모이제이션을 활용하여 LCS를 구현할 수 있다.

- 메모이제이션을 위한 배열을 `dp`라고 하자.
- `dp[i][j]`는 첫번째 수열의 `i`번째 원소와 두번째 수열의 `j`번째 원소를 끝으로 하는 LCS의 길이를 저장한다.
- 초기값은 `dp[0][0] = 0`이다.
- 점화식은 다음과 같다.
  - `dp[i][j] = max(dp[i-1][j], dp[i][j-1])` (단, `i > 0`이고 `j > 0`이고 `str1[i] != str2[j]`)
  - `dp[i][j] = dp[i-1][j-1] + 1` (단, `i > 0`이고 `j > 0`이고 `str1[i] == str2[j]`)

```cpp
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

int main() {
    std::string str1, str2;
    std::cin >> str1 >> str2;

    size_t m = str1.length();
    size_t n = str2.length();

    std::vector<std::vector<int>> dp(m + 1, std::vector<int>(n + 1, 0));

    for (size_t i = 1; i <= m; i++) {
        for (size_t j = 1; j <= n; j++) {
            if (str1[i - 1] == str2[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
            } else {
                dp[i][j] = std::max(dp[i - 1][j], dp[i][j - 1]);
            }
        }
    }

    std::cout << "LCS Length: " << dp[m][n] << std::endl;

    return 0;
}
```
