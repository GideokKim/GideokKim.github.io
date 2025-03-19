---
title: "[Github Blog] `_config.yml` 수정으로 블로그 기본 설정 변경하기"
date: 2025-02-09 20:30:00 +0900
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

# 1. 🎨 테마 변경하기

> `_config.yml` 파일을 수정하여 테마를 변경할 수 있다.

## default 테마 확인

- 아마 `_config.yml` 파일을 수정을 하지 않았다면 기본 테마가 적용되어 있을 것이다.
- `minimal-mistakes`의 장점은 `minimal_mistakes_skin` 변수를 통해 다양한 테마를 선택할 수 있다는 점이다.

![Image](https://github.com/user-attachments/assets/0f0f42e7-f665-4d39-a3c6-69e4c22b53c6){: .align-center}

## 원하는 테마 선택

- [minimal-mistakes - Configuration](https://mmistakes.github.io/minimal-mistakes/docs/configuration/) 에서 테마를 구경하고 원하는 테마를 선택한다.
- 나는 `dark` 또는 `neon` 테마를 쓸 것 같고 우선 `dark` 테마를 선택했다.
- 그리고 `Github Pages`를 활용해서 블로그를 운영할 것이기 때문에 `minimal_mistakes_skin` 변수 위에 있는 `remote_theme` 변수의 주석을 풀어야 한다.

```yaml
remote_theme           : "mmistakes/minimal-mistakes"
minimal_mistakes_skin  : "dark" # "air", "aqua", "contrast", "dark", "dirt", "neon", "mint", "plum", "sunrise"
```

![Image](https://github.com/user-attachments/assets/a48fca3a-ec72-486d-945d-efd38fbf5144){: .align-center}

# 2. 📝 기본 설정 변경하기

> 블로그 기본 설정(이름, url 등)을 변경해보자. 우선 내가 설정한 전체 설정을 확인하고 이후 변경한 설정에 대해 설명한다.

```yaml
# Site Settings
locale: "ko-KR"
title: "수학 전공자의 개발 이야기"
title_separator: "-"
subtitle: "Development Story of Mathematician"
name: "김기덕(Noah Kim)"
description: "병렬 프로그래밍 개발자의 기술 블로그"
url: "https://gideokkim.github.io"
baseurl: ""
repository: "GideokKim/GideokKim.github.io"
enable_copy_code_button  : true # true, false (default)
```

## `locale` 변수

- `locale` 변수는 블로그 언어를 선택한다. 나는 한국어를 선택했다.

## `title` 변수

- `title` 변수는 블로그 이름을 변경하는 변수이다. 변경하면 다음과 같은 항목이 수정된다.

![Image](https://github.com/user-attachments/assets/f75d0fef-d00a-418c-b623-b895d1768470){: .align-center}

## `title_separator` 변수

- `title_separator` 변수는 블로그 이름과 포스트 제목을 구분하는 문자를 변경하는 변수이다. 변경하면 다음과 같은 항목이 수정된다.
- 포스트 제목이 길어지면 어차피 안보이는 부분이니 변경하지 않기로 했다.

![Image](https://github.com/user-attachments/assets/2cf2063d-2b2e-4cd3-8e71-16d97a4f8d03){: .align-center}

## `subtitle` 변수

- `subtitle` 변수는 블로그 부제목을 변경하는 변수이다.

![Image](https://github.com/user-attachments/assets/8d1f5a03-0e3a-452e-bb54-a3d2499d4f42){: .align-center}

## `name` 변수

- `name` 변수는 블로그 저자 이름을 변경하는 변수이다.
- 기본 사이트에서는 딱히 저자 이름이 보이는 곳이 없다.

## `description` 변수

- `description` 변수는 블로그 설명을 변경하는 변수이다.
- 기본 사이트에서는 딱히 설명이 보이는 곳이 없다.

## `url` 변수

```yaml
url: "https://username.github.io"  # GitHub Pages 사용시
baseurl: ""                        # 대부분의 경우 비워둠
repository: "username/repo-name"   # GitHub 저장소 정보
```

## `enable_copy_code_button` 변수

- `enable_copy_code_button` 변수는 코드 복사 버튼을 활성화할지 여부를 결정하는 변수이다.
- `v4.26.0`의 새로운 기능이므로 이전 버전을 사용한다면 복사 버튼이 보이지 않는다.

# 3. 🔍 검색 기능 활성화

> 외부 검색 기능의 경우 좀더 복잡한 설정이 필요하므로 다른 포스트에서 다룬다. 여기서는 내부 검색 기능만 활성화한다.

- `search`: 사이트 내 검색 기능 활성화 여부
- `search_full_content`: 전체 콘텐츠 검색 여부 (제목만 vs 전체 내용)
- 나는 블로그 방문자에게 내 블로그의 모든 정보를 빠르게 검색할 수 있도록 하고 싶으므로 `true`로 설정한다.

```yaml
# search
search                   : true # true, false (default)
search_full_content      : true # true, false (default)
```

![Image](https://github.com/user-attachments/assets/08082473-7617-44ed-b389-c0fd1ce9f40c){: .align-center}

# 4. 👤 `social` 및 `author` 정보 수정

## `social` 정보 수정

> 사이트 자체의 소셜 프로필(SEO 및 구조화된 데이터용)을 수정하는 것이다.

- 나는 내 깃허브 프로필만 추가했다.
- 검색엔진과 소셜미디어를 위한 메타데이터를 추가하는 것이다.

```yaml
og_image                 : https://avatars.githubusercontent.com/u/79832255?v=4 # Open Graph/Twitter default site image
# For specifying social profiles
# - https://developers.google.com/structured-data/customize/social-profiles
social:
  type                   : Person # Person or Organization (defaults to Person)
  name                   : "김기덕(Noah Kim)" # If the user or organization name differs from the site's name
  links: # An array of links to social media profiles
    - "https://github.com/gideokkim"
```

## `author` 정보 수정

> 블로그 저자 정보를 수정하는 것이다.

- 여러가지 정보를 나에게 맞게 넣었다.
- `links`에 있는 항목들은 사용하는 플랫폼의 경우 주석을 풀고 정보를 입력하면 된다.
- 사용하지 않는 플랫폼의 경우 주석처리하면 된다.
- 이전 캡처와 비교하면 좌측에 내 프로필 정보가 많이 추가된 것을 확인할 수 있다.

```yaml
# Site Author
author:
  name             : "김기덕(Noah Kim)"
  avatar           : https://github.com/user-attachments/assets/ee788ff0-5dc1-4406-9cd2-a860c33d9582 # path of avatar image, e.g. "/assets/images/bio-photo.jpg"
  bio              : "CUDA Engineer(parallel programming developer)"
  location         : "South Korea"
  email            :
  links:
    - label: "Email"
      icon: "fas fa-fw fa-envelope-square"
      url: "mailto:noah.dev4127@gmail.com"
    - label: "Website"
      icon: "fas fa-fw fa-link"
      url: "https://gideokkim.github.io"
    # - label: "Twitter"
    #   icon: "fab fa-fw fa-twitter-square"
      # url: "https://twitter.com/"
    # - label: "Facebook"
    #   icon: "fab fa-fw fa-facebook-square"
      # url: "https://facebook.com/"
    - label: "GitHub"
      icon: "fab fa-fw fa-github"
      url: "https://github.com/gideokkim"
    # - label: "Instagram"
    #   icon: "fab fa-fw fa-instagram"
      # url: "https://instagram.com/"
```

![Image](https://github.com/user-attachments/assets/5634cf3d-8f22-4614-ad58-a53a75a5982d){: .align-center}

# 5. 👤 `footer` 수정

> footer에 나오는 정보를 수정하는 것이다. 앞과 유사하게 사용하는 플랫폼만 남기면 된다.

```yaml
# Site Footer
footer:
  links:
    - label: "Email"
      icon: "fas fa-fw fa-envelope-square"
      url: "mailto:noah.dev4127@gmail.com"
    # - label: "Twitter"
    #   icon: "fab fa-fw fa-twitter-square"
    #   # url:
    # - label: "Facebook"
    #   icon: "fab fa-fw fa-facebook-square"
    #   # url:
    - label: "GitHub"
      icon: "fab fa-fw fa-github"
      url: "https://github.com/gideokkim"
    # - label: "GitLab"
    #   icon: "fab fa-fw fa-gitlab"
    #   # url:
    # - label: "Bitbucket"
    #   icon: "fab fa-fw fa-bitbucket"
    #   # url:
    # - label: "Instagram"
    #   icon: "fab fa-fw fa-instagram"
    #   # url:
```

![Image](https://github.com/user-attachments/assets/d7518eea-b63c-494d-9244-df575f94357b){: .align-center}

# 6. 🔄 기타 설정 수정

## `timezone` 설정

> 블로그 시간대를 설정하는 것으로 나는 한국 시간대를 선택했다.

```yaml
timezone: "Asia/Seoul"
```

---

# 7. 📝 정리

> 위 단계들을 모두 수행했다면 테마를 바꾸고 기본적인 사이트 설정이 끝났다. 다음 포스팅에서는 포스팅하는 법을 알아보자!

# 8. 🔗 Reference

- [minimal-mistakes - Configuration](https://mmistakes.github.io/minimal-mistakes/docs/configuration/)

