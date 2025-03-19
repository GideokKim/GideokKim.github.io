---
title: "[Github Blog] 포스팅 카테고리 추가하기"
date: 2025-03-19 21:30:00 +0900
last_modified_at: 2025-03-19 21:30:00 +0900
categories:
  - Blog
tags:
  - Github Blog
  - minimal-mistakes
  - configuration
  - navigation

toc: true
toc_sticky: true
---

# 1. 📂 포스팅 카테고리 추가하기

> 포스팅 카테고리를 추가해서 좀 더 포스팅 글들을 종류별로 구분해보자.

![Image](https://github.com/user-attachments/assets/57d39a7b-51be-45a9-b1bf-2f4608388623){: .align-center}

## `_pages` 폴더 생성

- 폴더를 생성해서 이 안에 앞으로 생성할 포스팅 글의 카테고리를 정리할 예정이다.
- 폴더 이름은 `_pages`로만 생성하면 된다.
  - 추가로 안에 `categories` 폴더를 포스팅 카테고리별로 정리하는 파일들을 넣어줄 것이다. 아직 설정하지는 않았다.

## `category-archive.md` 파일 생성

- `_pages` 폴더에 `category-archive.md` 파일을 생성한다.
- 파일 내용은 아래와 같다.

```yaml
---
title: "Category"
layout: categories
permalink: /categories/
author_profile: true
sidebar_main: true
---
```

| 항목                | 설명                                                                                     |
|-------------------|----------------------------------------------------------------------------------------|
| **title**         | 페이지의 제목을 정의한다. 이 제목은 카테고리 페이지에서 표시된다.                     |
| **layout**        | 사용될 레이아웃을 정의한다. 여기서는 `categories` 레이아웃이 사용되어 카테고리 페이지가 생성된다. |
| **permalink**     | 페이지의 고유 URL 경로를 설정한다. 이 경로는 `/categories/`로 설정되어 카테고리 페이지에 접근할 수 있다. |
| **author_profile** | 작성자 프로필을 표시할지 여부를 설정한다. `true`로 설정하면 작성자의 정보가 페이지에 나타난다. |
| **sidebar_main**   | 사이드바를 표시할지 여부를 설정한다. `true`로 설정하면 페이지에 사이드바가 포함된다. |

## 실제 블로그에서 확인해보기

- 로컬에서 실행하여 확인해보자.
  - 로컬 서버를 실행하는 명령어는 `bundle exec jekyll serve` 이다.
- `Category`를 클릭하면 `404 Not Found` 페이지가 아닌 카테고리 페이지로 넘어간다.

![Image](https://github.com/user-attachments/assets/e680f94d-da41-4104-a0d2-e3b97d5073d8){: .align-center}

---

# 2. 📝 정리

> 이제 404 페이지로 가는 곳이 없도록 수정을 완료하였다. 아래 링크를 확인하면 다른 설정들도 있으니 필요하다면 확인해보자!

# 3. 🔗 Reference

- [mm-github-pages-starter](https://github.com/mmistakes/mm-github-pages-starter)
