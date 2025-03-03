---
title: "[Web] HTML의 기본 개념 정리"
date: 2025-02-27 16:00:00 +0900
last_modified_at: 2025-02-27 16:00:00 +0900
categories:
  - Web Development
tags:
  - Web
  - HTML
  - Frontend
  - markup
  - viewport
  - meta

toc: true
toc_sticky: true
---

# 1. 🌐 웹페이지의 구성 요소

## 🎨 웹페이지의 구성

> HTML, CSS, JavaScript는 웹페이지의 구성 요소이다.

- **HTML**: 웹페이지의 구조를 정의하는 언어(Content)
- **CSS**: 웹페이지의 스타일을 정의하는 언어(Style)
- **JavaScript**: 웹페이지의 동작을 정의하는 언어(Behavior)

## 💻 Client vs Server

- **Client**: 웹페이지를 보는 사람(Request)
- **Server**: 웹페이지를 제공하는 서버(Response)

![Image](https://github.com/user-attachments/assets/4eb48d48-926b-4efc-b333-45c40d4b0a61){: .align-center}

# 2. 📄 HTML(Hyper Text Markup Language)

> 웹페이지의 구조를 정의하는 언어

- **Hyper Text**: 참조를 통해 여러 문서가 연결되어 있는 텍스트
- **Markup**: 태그를 이용해 문서의 구조나 속성을 정의

## 🏗️ HTML 문서의 기본 구조

- **DOCTYPE**: HTML 문서의 타입을 선언
- **<html>~</html>**: HTML 문서의 루트 요소
- **<head>~</head>**: 문서의 메타데이터(웹브라우저가 웹문서를 해석하는데 필요한 정보)를 정의
- **<body>~</body>**: 문서의 본문 내용(웹브라우저에 보여지는 내용)을 정의

```html
<!DOCTYPE html>
<html>
  <head> </head>
  <body></body>
</html>
```

### ⚙️ 많이 사용되는 속성(attribute)

- **lang**: 문서의 언어를 지정
  - 예시: `<html lang="en">` 영어로 설정
  - 예시: `<html lang="ko">` 한글로 설정
- **charset**: 문서의 문자 인코딩을 지정
  - 예시: `<meta charset="UTF-8">` UTF-8 인코딩으로 설정
- **viewport**: 뷰포트(viewport)의 너비와 초기 줌 수준을 지정
  - 예시: `<meta name="viewport" content="width=device-width, initial-scale=1.0">` 뷰포트의 너비를 디바이스의 너비로 설정
  - viewport: 브라우저 화면에 스크롤바를 제외한 콘텐츠가 보이는 영역. 모바일 기기에서는 화면 전체가 뷰포트이다.

```html
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  <body></body>
</html>
```

### 🏷️ 많이 사용되는 태그(Tag)

- **<title>~</title>**: 문서의 제목을 정의
  - 예시: `<title>문서 제목</title>` 문서의 제목을 "문서 제목"로 설정
- **<h1>~</h1>**: 문서의 제목을 정의
  - 예시: `<h1>웹 개발 기초</h1>` 문서의 제목을 "웹 개발 기초"로 설정
- **<p>~</p>**: 문서의 문장을 정의
  - 예시: `<p>html</p>` 문서의 문장을 "html"로 설정
- **<button>~</button>**: 문서의 버튼을 정의
  - 예시: `<button>시작하기</button>` 문서의 버튼을 "시작하기"로 설정
- **<link>~</link>**: 외부 리소스를 연결
  - 예시: `<link rel="stylesheet" href="00_test.css" />` 외부 스타일시트를 연결
- **<script>~</script>**: 자바스크립트 코드를 정의
  - 예시: `<script src="00_test.js"></script>` 외부 자바스크립트 파일을 연결

![Image](https://github.com/user-attachments/assets/cca1f3fb-f0e8-4baf-b309-f8b8da306b89){: .align-center}

```html
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>문서 제목</title>
    <link rel="stylesheet" href="00_test.css" />
  </head>
  <body>
    <h1>웹 개발 기초</h1>
    <p>html</p>
    <p>css</p>
    <p>javascript</p>
    <button>시작하기</button>
    <script src="00_test.js"></script>
  </body>
</html>
```
