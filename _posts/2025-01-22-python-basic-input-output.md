---
title: "파이썬 코딩 테스트용 기본 입출력"
categories:
  - Python Coding Test
tags:
  - python
  - coding test
  - input
  - output
---

# 백준 문제 입출력 템플릿 모음 (Python)

## 1\. 기본 형식 (한 줄 입력, 한 줄 출력)

```
# 한 줄 입력받아 처리
input_line = input()
print(input_line)
```

---

## 2\. 여러 줄 입력받기 (입력 개수가 주어지지 않음)

```
import sys

# 여러 줄 입력받기
lines = sys.stdin.read().strip().split('\n')
for line in lines:
    print(line)
```

---

## 3\. 입력의 첫 번째 줄에 숫자 개수가 주어지고 이후 입력받기

```
# 첫 번째 줄에 입력 개수 주어짐
n = int(input())
data = [input().strip() for _ in range(n)]
print(data)
```

---

## 4\. 공백으로 구분된 숫자 입력받기

```
# 공백으로 구분된 숫자 입력받기
numbers = list(map(int, input().split()))
print(numbers)
```

---

## 5\. 여러 줄에 공백으로 구분된 숫자 입력받기

```
import sys

# 여러 줄 입력받기
lines = sys.stdin.read().strip().split('\n')
data = [list(map(int, line.split())) for line in lines]
print(data)
```

---

## 6\. 정해진 형식의 2차원 배열 입력받기

```
# 행과 열의 크기가 주어진 2차원 배열
n, m = map(int, input().split())
matrix = [list(map(int, input().split())) for _ in range(n)]
print(matrix)
```

---

## 7\. 문자열을 여러 줄에 걸쳐 입력받기

```
# 입력 종료 조건이 주어진 경우 (예: EOF)
import sys

data = sys.stdin.read().strip()
print(data)
```

---

## 8\. 테스트 케이스 개수와 입력이 주어지는 경우

```
# 첫 줄에 테스트 케이스 개수
t = int(input())
for _ in range(t):
    a, b = map(int, input().split())
    print(a + b)
```

---

## 9\. 여러 줄 입력, 각각 다른 형식 처리

```
# 첫 줄은 숫자, 두 번째 줄은 문자열
n = int(input())
text = input()
print(n, text)
```

---

## 10\. 빠른 입력/출력 사용 (sys.stdin, sys.stdout)

```
import sys

input = sys.stdin.read
print = sys.stdout.write

data = input().strip().split('\n')
for line in data:
    print(line + '\n')
```

---