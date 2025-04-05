---
title: "[Github Blog] 포스팅을 위한 기본 세팅하기"
date: 2025-03-19 20:30:00 +0900
last_modified_at: 2025-03-19 20:30:00 +0900
categories:
  - Blog
tags:
  - Github Blog
  - minimal-mistakes
  - configuration
  - post

toc: true
toc_sticky: true
---

# 1. 📂 포스팅을 위한 기본 세팅하기

> 포스팅을 위한 기본 세팅을 해보자.

## `_posts` 폴더 생성

- 포스팅하는 글들을 모아둘 폴더를 생성하자.
  - 폴더 이름은 반드시 `_posts` 폴더여야 한다.

![Image]({{ site.url }}{{ site.baseurl }}/images/etc/blog/2025-03-19-add-post-directory/01.png){: .align-center}

# 2. 📝 포스팅해보기

## 포스팅 파일 생성

- `_posts` 폴더에 `2025-03-19-hello-world.md`처럼 파일을 생성해보자!
- 파일 이름은 반드시 `YYYY-MM-DD-title.md` 형식으로 생성해야 한다.
- 예시: `2025-03-19-hello-world.md`

## 머리말 작성

- 머리말은 반드시 `---` 로 시작하고 끝나야 한다.
- 머리말에는 포스팅의 제목, 날짜, 카테고리, 태그 등의 정보를 작성할 수 있다.
- 예시:

```md
---
title: "[Github Blog] 포스팅을 위한 기본 세팅하기"
date: 2025-03-19 20:30:00 +0900
last_modified_at: 2025-03-19 20:30:00 +0900
categories:
  - Blog
tags:
  - Github Blog
  - minimal-mistakes
  - configuration

toc: true
toc_sticky: true
---
```

| 항목                     | 설명                                                                                     |
|------------------------|----------------------------------------------------------------------------------------|
| **title**              | 블로그 포스트의 제목을 정의한다. 이 제목은 블로그에서 포스트를 식별하는 데 사용된다. |
| **date**               | 포스트가 작성된 날짜와 시간을 나타낸다. 이 정보는 포스트의 최신성을 알리는 데 중요하다. |
| **last_modified_at**   | 포스트가 마지막으로 수정된 날짜와 시간을 나타낸다. 이 정보는 업데이트 이력을 추적하는 데 유용하다. |
| **categories**         | 포스트가 속하는 카테고리를 정의한다. 카테고리는 블로그의 주제를 분류하는 데 사용된다. |
| **tags**               | 포스트와 관련된 키워드를 정의한다. 태그는 특정 주제나 내용을 강조하는 데 사용된다. |
| **toc**                | 목차(TOC)를 생성할지 여부를 설정한다. `true`로 설정하면 포스트에 목차가 자동으로 생성된다. |
| **toc_sticky**         | 목차가 스크롤 시에도 화면에 고정될지 여부를 설정한다. `true`로 설정하면 목차가 항상 보이게 된다. |

## 내용 작성

- 나는 테스트를 위해 아래처럼 간단하게 작성하였다.
- 내용은 markdown 문법을 사용하여 작성하면 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/etc/blog/2025-03-19-add-post-directory/02.png){: .align-center}

# 3. ✅ 포스팅된 글 확인해보기

- 로컬에서 들어가보면 바로 최근에 작성한 글을 아래처럼 볼 수 있다.
  - 로컬 서버를 실행하는 명령어는 `bundle exec jekyll serve` 이다.

![Image]({{ site.url }}{{ site.baseurl }}/images/etc/blog/2025-03-19-add-post-directory/03.png){: .align-center}

- 글을 직접 들어가서 확인해보자!
- 주소를 보면 `127.0.0.1:4000/blog/hello-world/`로 되어 있는 것을 볼 수 있다.
  - 우리가 작성한 카테고리와 문서의 이름에 따라 주소가 결정되는 것을 알 수 있다.
- 그리고 앞서 작성한 머리말에 들어가는 메타 데이터들이 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/etc/blog/2025-03-19-add-post-directory/04.png){: .align-center}

---

# 4. 📝 정리

> 위 단계들을 모두 수행했다면 이제 블로그 포스팅은 문제가 없다. 다음에는 상단 네비게이션을 정리해보자!

# 5. 🔗 Reference

- [Markdown - Wikipedia](https://en.wikipedia.org/wiki/Markdown)