---
title: "[Github Blog] 상단 네비게이션 정리하기"
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

# 1. 📂 상단 네비게이션 정리하기

> 상단 네비게이션을 정리해보자. 실제 블로그에서는 아래 표시된 위치를 의미한다.

![Image]({{ site.url }}{{ site.baseurl }}/images/etc/blog/2025-03-19-modify-navigation-bar/01.png){: .align-center}

## `_data/navigation.yml` 파일 수정

- `_data/navigation.yml` 파일을 확인해보자.
- 파일을 보면 외부에 있는 monimal-mistakes의 quick start guide 링크가 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/etc/blog/2025-03-19-modify-navigation-bar/02.png){: .align-center}

- 일단 블로그 구성 자체에 내 연락처나 GitHub 주소 등 많은 정보들이 이미 있어서 심플하게 홈, 카테고리 정도만 있으면 될 것 같다.
- 따라서 아래처럼 수정하였다.

```yaml
# main links
main:
  - title: "Home"
    url: /index.html
  - title: "Category"
    url: /categories/
  # - title: "About"
  #   url: https://mmistakes.github.io/minimal-mistakes/about/
  # - title: "Sample Posts"
  #   url: /year-archive/
  # - title: "Sample Collections"
  #   url: /collection-archive/
  # - title: "Sitemap"
  #   url: /sitemap/
```

## 실제 블로그에서 확인해보기

- 로컬에서 실행하여 확인해보자.
  - 로컬 서버를 실행하는 명령어는 `bundle exec jekyll serve` 이다.
- `Home`을 클릭하면 블로그의 홈으로 이동한다.
- `Category`를 클릭하면 아직 카테고리를 만들지 않아서 `404 Not Found` 페이지로 이동한다.
  - 이건 카테고리를 만들면서 해결할 수 있으니 우선은 넘어가도록 한다.

![Image]({{ site.url }}{{ site.baseurl }}/images/etc/blog/2025-03-19-modify-navigation-bar/03.png){: .align-center}

---

# 2. 📝 정리

> 위 단계들을 모두 수행했다면 이제 아래 참고 문서를 보면서 상단 네비게이션 바를 수정할 수 있을 것이다. 다음에는 404 페이지로 안가도록 카테고리를 만들어보자!

# 3. 🔗 Reference

- [Navigation](https://mmistakes.github.io/minimal-mistakes/docs/navigation/)