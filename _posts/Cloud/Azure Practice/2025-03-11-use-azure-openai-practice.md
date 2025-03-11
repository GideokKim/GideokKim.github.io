---
title: "[Azure] Azure OpenAI Service 사용하기"
date: 2025-03-11 12:00:00 +0900
last_modified_at: 2025-03-11 12:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - openai
  - azure portal
  - azure openai service

toc: true
toc_sticky: true
---

# 🎯 Azure OpenAI Service 사용하기

> Azure에 있는 Azure OpenAI Service를 사용해서 코드 생성을 해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*
- Azure OpenAI Service를 사용하면 LLM(LargeLanguage Model)을 사용하여 프로그래밍 코드를 포함한 콘텐츠 생성이 가능하다.
- 개발자는 이 기능을 통해 다양한 프로그래밍 언어로 기존 프로그래밍 코드를 생성 및 개선하여 효율성을 높일 수 있다.


## 1. ✏️ 자연어로 코드 생성하기

> Azure OpenAI Service에 있는 AI 모델 기능 중 하나는 자연어 프롬프트에서 코드를 생성하는 것이다. 간단한 한 줄 명령어에서 전체 애플리케이션 코딩까지 다양하고 제공된 코드나 이전 응답을 편집하고 업데이트하여 요청된 작업을 완료한다.

- 사실 위 기능은 이미 여러 AI 플랫폼에서 제공하고 있는 기능이라 크게 놀라운 기능은 아니다.
- 현재는 모든 모델이 코드 생성을 잘하지만 예전엔 코드 생성을 위한 모델이 따로 있었다.
  - Codex모델: 이전 세대의 gpt 모델에서는 코드 사용을 위해 특별히 학습된 모델

### 1.1 함수 작성

> 내용 설명으로 함수 작성하기

- 플레이그라운드 하위에 채팅을 들어가서 아래 문장을 넣으면 파이썬으로 이진 탐색 함수를 작성해준다.

```
Write a function for binary search in python
```

![Image](https://github.com/user-attachments/assets/aad15c8b-070a-4427-a5df-e11ce2cfe083){: .align-center}

```python
def binary_search(arr, target):  
    left, right = 0, len(arr) - 1  
      
    while left <= right:  
        mid = left + (right - left) // 2  # To prevent overflow  
          
        # Check if target is present at mid  
        if arr[mid] == target:  
            return mid  # Return the index of the target  
        # If target is greater, ignore the left half  
        elif arr[mid] < target:  
            left = mid + 1  
        # If target is smaller, ignore the right half  
        else:  
            right = mid - 1  
              
    return -1  # Target is not present in the array  
  
# Example usage:  
sorted_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]  
target = 5  
result = binary_search(sorted_array, target)  
  
if result != -1:  
    print(f"Element found at index: {result}")  
else:  
    print("Element not found in the array.")  
```

### 1.2 코드 언어 변경

> 이미 구현한 함수 코드가 있다면 다른 언어(C++, Rust 등)로 변경해주는 것도 간단하게 가능하다.

```
Convert this code to Rust
```

```rust
fn binary_search(arr: &[i32], target: i32) -> Option<usize> {  
    let mut left = 0;  
    let mut right = arr.len() as isize - 1;  
  
    while left <= right {  
        let mid = left + (right - left) / 2;  
  
        if arr[mid as usize] == target {  
            return Some(mid as usize); // Return the index of the target  
        } else if arr[mid as usize] < target {  
            left = mid + 1; // Ignore the left half  
        } else {  
            right = mid - 1; // Ignore the right half  
        }  
    }  
  
    None // Target is not present in the array  
}  
  
fn main() {  
    let sorted_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];  
    let target = 5;  
  
    match binary_search(&sorted_array, target) {  
        Some(index) => println!("Element found at index: {}", index),  
        None => println!("Element not found in the array."),  
    }  
}  
```

### 1.3 알 수 없는 코드 이해

> 내가 이해하기 어려운 코드를 주고 설명해달라고 하면 정말 잘 설명해준다.

```
could you explain what this code is doing?
```

## 2. ⚡ 코드 완료 및 개발 프로세스 지원

> 단위 테스트 작성,부분 코드 완료, 코드 주석 처리 및 설명서 생성과 같은 개발자의 일반적인 소프트웨어 개발 작업을 지원할 수 있다.

- 개발자는 AI지원을 통해 복잡한 프로그래밍 및 문제 해결 작업에 더 많은 시간을 할애할 수 있다.
- 현재 나도 boilerplate 코드를 작성할 때 많이 사용하고 있다.

### 2.1 부분 코드 완료

> 부분 코드 완료를 요청하면 코드를 작성해준다. 모델에 제공하는 컨텍스트가 많을수록 응답의 정확도가 높아진다.

```
complete the following code
"""
def fib(n):
  if n == 0:
```

```python
def fib(n):  
    if n == 0:  
        return 0  
    elif n == 1:  
        return 1  
    else:  
        return fib(n - 1) + fib(n - 2)  
  
# Example usage:  
n = 10  
print(f"Fibonacci number at position {n} is {fib(n)}")  
```

### 2.2 단위 테스트 작성

> 단위 테스트 작성을 요청하면 테스트 코드를 작성해준다. 이건 진짜 편리하다.

```
write unit tests for the following code

def fib(n):  
    if n == 0:  
        return 0  
    elif n == 1:  
        return 1  
    else:  
        return fib(n - 1) + fib(n - 2)  
  
# Example usage:  
n = 10  
print(f"Fibonacci number at position {n} is {fib(n)}")  
```

```python
# Unit tests  
import unittest  
  
class TestFibonacci(unittest.TestCase):  
      
    def test_fib_0(self):  
        self.assertEqual(fib(0), 0)  
      
    def test_fib_1(self):  
        self.assertEqual(fib(1), 1)  
      
    def test_fib_2(self):  
        self.assertEqual(fib(2), 1)  
      
    def test_fib_3(self):  
        self.assertEqual(fib(3), 2)  
      
    def test_fib_4(self):  
        self.assertEqual(fib(4), 3)  
      
    def test_fib_5(self):  
        self.assertEqual(fib(5), 5)  
      
    def test_fib_6(self):  
        self.assertEqual(fib(6), 8)  
      
    def test_fib_7(self):  
        self.assertEqual(fib(7), 13)  
      
    def test_fib_8(self):  
        self.assertEqual(fib(8), 21)  
      
    def test_fib_9(self):  
        self.assertEqual(fib(9), 34)  
      
    def test_fib_10(self):  
        self.assertEqual(fib(10), 55)  
  
if __name__ == "__main__":  
    unittest.main()  
```

### 2.3 코드 주석 처리 및 설명서 생성

> 코드 주석 처리 및 설명서 생성을 요청하면 주석 처리 및 설명서를 작성해준다. 필요한 경우만 쓰는데, 나는 거의 쓰지 않았다.

```
write a comment for this function
```

## 3. 🔍 버그 수정 및 코드 개선

> 코드의 개선 방법을 식별하고 더 나은 코드를 작성하는 방법에 대한 제안을 제공해준다.

### 3.1 버그 수정

> 버그를 수정해주지만 아직 모델이 버그를 수정하는 것을 완벽하게 잘 하지는 못한다. 쉬운 버그는 금방 잡아준다.

### 3.2 성능 개선

> 코드의 성능을 개선하는 방법에 대한 제안을 제공해준다.

```
improve the performance of the following code
```

### 3.3 코드 리팩토링

> 코드를 리팩토링하는 방법에 대한 제안을 제공해준다.

```
refactor the following code
```
