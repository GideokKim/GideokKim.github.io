---
title: "[Web Crawling] 네이버증권 뉴스 크롤링해보기"
date: 2025-01-31 13:00:00 +0900
last_modified_at: 2025-01-31 13:00:00 +0900
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

- [네이버증권 뉴스](https://finance.naver.com/news/mainnews.naver) 크롤링해보기
  - 최신 뉴스의 제목, 상세페이지 링크, 내용, 언론사, 날짜 크롤링

---

## 👀 웹페이지 접근

### selenium 라이브러리로 웹페이지 띄우기

```python
from selenium.webdriver import Chrome
import time

url = 'https://finance.naver.com/news/mainnews.naver'

driver = Chrome()
driver.get(url)
time.sleep(2) # 페이지가 로딩되는 시간 감안하여 delay
```

---

### 주요 뉴스에서 세부 요소 추출하기

- 추출하고자 하는 요소에서 마우스 우클릭, 검사 클릭
- CSS Selector 후보 찾기
  - 여기서는 `.articleSubject`를 사용(검색해보면 딱 article 개수인 20개가 나온다.)

![Image](https://github.com/user-attachments/assets/c7180e0a-1f88-40a0-8a4e-d2f2638b6d57){: .align-center}

```python
# 아티클 영역 요소 선택
from selenium.webdriver.common.by import By

articles = driver.find_elements(By.CSS_SELECTOR, ".block1")

# 각 아티클 영역 요소에서 세부 요소 추출
article_list = []
for article in articles:
    subject = article.find_element(By.CSS_SELECTOR, ".articleSubject").text
    summary = article.find_element(By.CSS_SELECTOR, ".articleSummary").text
    press = article.find_element(By.CSS_SELECTOR, ".press").text
    wdate = article.find_element(By.CSS_SELECTOR, ".wdate").text
    link = article.find_element(By.CSS_SELECTOR, ".articleSubject>a").get_attribute("href")
    article_list.append([subject, summary, press, wdate, link])

article_list
```

> 결과

![Image](https://github.com/user-attachments/assets/9a52db26-f9de-4a51-99e6-e5244a4cda06){: .align-center}

---

## 📊 파일로 다운로드

### 데이터 프레임 생성

```python
import pandas as pd

df = pd.DataFrame(article_list, columns = ['subject','summary','press','wdate','link'])
df.head(3)
```

> 결과

![Image](https://github.com/user-attachments/assets/955cb0a5-4a6d-4c4a-beb5-fe0e4aa638bb){: .align-center}

---

### csv & excel 파일로 저장

```python
df.to_csv('네이버증권뉴스.csv', encoding='utf-8', index=False)

df.to_excel('네이버증권뉴스.xlsx', index=False)
```

> 결과

![Image](https://github.com/user-attachments/assets/fb855559-8c16-4063-8ebd-f1d3475a9803){: .align-center}

---

## 🚀 응용

### 특정 날짜의 기사 수집

> https://finance.naver.com/news/mainnews.naver?date=2025-01-23

- 뒤에 날짜 정보를 입력(`?date=2025-01-23`)해주면 해당 날짜의 주요뉴스 페이지를 갈 수 있다는 것을 알 수 있다.
- 날짜 입력 없이 오늘 날짜로부터 과거 1개월의 주요뉴스를 가져오는 식으로 구현할 수도 있다.

```python
import datetime
date = input("검색할 날짜(yyyymmdd) : ")
if date=="": date = datetime.datetime.now().strftime('%Y-%m-%d')
else: date = f'{date[:4]}-{date[4:6]}-{date[6:]}'
url = "https://finance.naver.com/news/mainnews.naver?date="+date
```

- 파일 다운로드의 경우 아래처럼 날짜로 정렬하면 좋겠다.

```python
filename = date.replace('-','')
df.to_csv(f'네이버증권뉴스_{filename}.csv', encoding='utf-8', index=False)

df.to_excel(f'네이버증권뉴스_{filename}.xlsx', index=False)
```

---

### 여러 페이지 크롤링

> https://finance.naver.com/news/mainnews.naver?date=2025-01-27&page=2

- 뒤에 페이지 정보를 입력(`&page=2`)해주면 해당 날짜의 여러 페이지를 갈 수 있다.
- 날마다 주요뉴스의 페이지 수가 다르므로 각 날짜마다 모든 주요뉴스를 가져오려면 페이지 수를 알아야 한다.

#### 판단 기준 찾기

![Image](https://github.com/user-attachments/assets/5f55c0c7-7d11-4252-ba33-1cfc27afebe6){: .align-center}

- 네이버의 경우 마지막 페이지가 아니라면 `맨뒤` 버튼이 있으므로 이를 기준으로 마지막 페이지를 판단할 수 있다.
  - 이러한 판단 기준은 웹페이지마다 다르므로 판단 기준을 찾아야 한다.

![Image](https://github.com/user-attachments/assets/0d533c05-985d-40a5-bc77-fc2bb4f78e75){: .align-center}

- `맨뒤` 버튼의 경우 `pgRR` 클래스를 유일하게 가지고 있다.

---

### 📋 최종 코드 - 날짜 입력을 받고 해당 날짜의 모든 주요뉴스 페이지 크롤링

```python
import datetime
import time
 
# 날짜 입력 받아오기
date = input("검색할 날짜(yyyymmdd) : ")
if date=="": date = datetime.datetime.now().strftime('%Y-%m-%d')
else: date = f'{date[:4]}-{date[4:6]}-{date[6:]}'
 
# 웹드라이버 생성
from selenium.webdriver import Chrome
driver = Chrome()
 
# 리스트, 페이지 초기화
article_list = []
page = 1
 
# '맨뒤' 요소가 있는 동안 반복
while True:
    # 웹페이지 열고 이동하기
    url = "https://finance.naver.com/news/mainnews.naver?date="+date+"&page="+str(page)
    driver.get(url)
 
    time.sleep(2) # 페이지 로딩
 
    # 요소 선택하기
    from selenium.webdriver.common.by import By
    articles = driver.find_elements(By.CSS_SELECTOR, ".block1")
 
    for article in articles:
        subject = article.find_element(By.CSS_SELECTOR, ".articleSubject").text
        summary = article.find_element(By.CSS_SELECTOR, ".articleSummary").text
        press = article.find_element(By.CSS_SELECTOR, ".press").text
        wdate = article.find_element(By.CSS_SELECTOR, ".wdate").text
        link = article.find_element(By.CSS_SELECTOR, ".articleSubject>a").get_attribute("href")
        article_list.append([subject, summary, press, wdate, link])
   
    # 반복을 빠져나올 조건
    try:
        driver.find_element(By.CSS_SELECTOR, ".pgRR")
        page += 1
    except:
        break
 
import pandas as pd
df = pd.DataFrame(article_list, columns=['subject', 'summary', 'press', 'wdate', 'link'])
df.to_csv(f"네이버증권뉴스_{date}.csv", index=False)
df.to_excel(f"네이버증권뉴스_{date}.xlsx", index=False)
```

# ❗ 코드 마지막엔...

> 브라우저를 닫아줘야 한다.

```python
# 브라우저 닫기
driver.quit()
```
