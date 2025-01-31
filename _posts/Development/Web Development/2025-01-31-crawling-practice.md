---
title: "[Web Crawling] 파이썬 웹 크롤링에 사용하는 selenium 라이브러리 관련 코드 정리"
date: 2025-01-31 11:00:00 +0900
last_modified_at: 2025-01-31 11:00:00 +0900
categories:
  - Web Development
tags:
  - Web Crawling
  - Web Scraping
  - Python
  - Selenium
  - Web Driver

toc: true
toc_sticky: true
---

# 🎯 목표

- selenium 라이브러리 사용해서 웹 페이지 요소 찾기 연습

## 라이브러리 설치하기

```bash
pip install typing_extensions
pip install selenium
# pip install selenium==4.17.0 # 버전 지정도 가능

# 버전 확인
pip show selenium
```

## 웹드라이버 객체 생성

> 크롬 브라우저를 조작하기 위한 웹드라이버 객체를 생성. 열리는 브라우저는 닫으면 안된다.

- 웹드라이버: 브라우저 조작을 위한 도구
- selenium의 webdriver 모듈에서 Chrome 브라우저를 제어하기 위한 클래스 제공

```python
# 크롬 웹드라이버 클래스 import
from selenium.webdriver import Chrome
# from selenium import webdriver # 크롬이 아닌 경우 사용

# 크롬 웹드라이버 객체 생성
driver = Chrome()
```

![Image](https://github.com/user-attachments/assets/f4d29ea5-6807-4c77-bc05-f78b756e162d){: .align-center}

## 브라우저 제어하기

- `get(URL)`: 페이지로 이동하기
- `back()`: 뒤로가기
- `forward()`: 앞으로 가기
- `refresh()`: 새로고침
- `maximize_window()`: 브라우저 크기 최대화
- `minimize_window()`: 브라우저 크기 최소화
- `close()`: 웹드라이버로 생성한 현재 창 종료
- `quit()`: 웹드라이버로 생성한 모든 창 종료

### 브라우저 크기 제어하기

```python
# 브라우저 크기 최소화
driver.minimize_window()

# 브라우저 크기 최대화
driver.maximize_window()
```

### 원하는 페이지로 이동하기

```python
# 원하는 페이지로 이동
driver.get('https://www.naver.com')

driver.get("https://www.google.com")

driver.get("https://www.daum.net")
```

### 이전 페이지로 이동, 다음 페이지로 이동, 새로고침

```python
# 이전 페이지로 이동
driver.back()

# 다음 페이지로 이동
driver.forward()

# 새로고침
driver.refresh()
```

### 웹드라이버 종료하기

```python
# 웹드라이버로 생성한 현재 창 종료
driver.close()

# 웹드라이버로 생성한 모든 창 종료
driver.quit()
```

## 웹 페이지 요소 가져오기

- `find_element(요소선택방법, 선택자)`: 첫번째 요소 한개만 가져오기
- `find_elements(요소선택방법, 선택자)`: 요소 모두 가져오기 (리스트)

### 브라우저 띄우기

```python
# 웹페이지 열고 이동하기 (http://www.naver.com)
from selenium import webdriver
driver = webdriver.Chrome()
driver.get('http://www.naver.com')
driver.maximize_window()
```

### 웹 요소 찾기

> 웹 요소의 CSS Selector 복사

- 마우스 우클릭 후 검사 클릭

![Image](https://github.com/user-attachments/assets/a02c2c71-3cf0-439e-b8ce-204722711a21){: .align-center}

- 좌측 상단의 아이콘을 클릭하면 이후에 웹페이지에서 클릭한 부분의 요소를 확인할 수 있음

![Image](https://github.com/user-attachments/assets/6adb8416-9d9c-48f4-a1ea-c1edca66018b){: .align-center}

- 네이버 검색창의 경우 ID가 `query`이고 이를 활용해서 검색창을 찾을 수 있음(ID는 페이지 내에서 유일하기 때문).
- 여기서는 클래스 선택자를 사용해도 찾을 수 있음(원래는 안되는데 네이버의 경우 유일한 클래스 선택자를 사용함)

![Image](https://github.com/user-attachments/assets/1d2a8f33-8920-4f9f-9ac7-3adeca0e9080){: .align-center}

### 파이썬 코드로 웹 요소 찾기

```python
# 검색창 선택하기
from selenium.webdriver.common.by import By
search = driver.find_element(By.CSS_SELECTOR, "#query")
# search = driver.find_element(By.ID, "query") # 아이디 선택자로도 가능
search
```

### 웹 페이지 요소 제어하기

- `click()` : 요소 클릭
- `send_keys()` : 키 입력

```python
# 검색창 클릭
search.click()

# 검색어 입력
search.send_keys("인공지능")
```

> 결과

![Image](https://github.com/user-attachments/assets/a5be0f46-c92f-433c-9569-0a8e8abe5e3b){: .align-center}

```python
# 엔터키 입력
from selenium.webdriver.common.keys import Keys
search.send_keys(Keys.ENTER)
# search.send_keys('\n') # 이거도 가능
```

> 결과

![Image](https://github.com/user-attachments/assets/a8d2b4e7-b554-42a3-9aea-07cdb58405c7){: .align-center}

```python
# 브라우저 닫기
driver.quit()
```

#### 번외 - 순차적으로 키 입력하기

```python
# 순차적으로 키 입력하기
search.send_keys("인공지능", Keys.ENTER)
# search.send_keys("인공지능\n") # 사실상 이게 더 편함
```