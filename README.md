# 수학적 사고로 개발을 학습하는 기술 로드맵

> 수학 전공자의 관점으로 개발 지식을 단계별 학습 경로로 정리하는 기술 블로그

이 저장소는 [GideokKim.github.io](https://gideokkim.github.io) 블로그의 Jekyll/GitHub Pages 소스입니다.  
블로그의 1차 목표는 방문자가 글을 읽으며 **어디서 시작하고 다음에 무엇을 읽을지** 쉽게 파악하도록 돕는 것입니다.

## 블로그 방향

- **사람에게 읽기 좋은 블로그**: 긴 기술 글도 제목, 목차, 카테고리, 다음 글 흐름을 통해 따라가기 쉽게 정리합니다.
- **학습 경로 중심 구조**: 단순 카테고리 나열보다 학습 순서와 주제 간 관계를 먼저 보여줍니다.
- **AI가 참조하기 좋은 맥락**: 블로그 목적, 분류 체계, 작성 규칙, 주요 파일 위치를 문서화해 AI 도구가 일관되게 이해하도록 합니다.

## 학습 경로

현재 블로그는 다음 5개 경로를 중심으로 구성됩니다.

1. **기초 개발 역량**
   - Python/C++ 코딩 테스트, Git, 개발 환경, WSL2
2. **수학·CS 기반**
   - 수학 이론, 알고리즘 이론, 컴퓨터/클라우드 기초 개념
3. **C++·성능 지향 개발**
   - C++, STL, 성능 최적화와 병렬 프로그래밍으로 이어지는 기반
4. **AI·컴퓨터 비전**
   - Machine Learning, Deep Learning, Computer Vision, OpenCV, AI 자격증
5. **실무 도구와 확장**
   - Dev Tools, Codex, Claude, Azure, Web Development, 블로그 운영

학습 경로 데이터는 `_data/learning_paths.yml`에서 관리합니다.

## 주요 파일 구조

```text
_config.yml                 # Jekyll/Minimal Mistakes 설정
_data/navigation.yml         # 상단 네비게이션
_data/learning_paths.yml     # 학습 경로와 카테고리 매핑
_includes/nav_list_main      # 사이드바 학습 경로 네비게이션
_includes/learning-path-context.html # 글 상세의 학습 경로 안내
_layouts/home.html           # 홈 레이아웃
_layouts/categories.html     # 전체 카테고리/학습 경로 아카이브
_layouts/single.html         # 글 상세 레이아웃
_pages/category-archive.md   # /categories/ 페이지
_posts/                      # 블로그 글
assets/css/main.scss         # 테마 import 및 커스텀 스타일
docs/brand-direction.md      # 브랜드/디자인 방향
CONTEXT.md                   # AI 참조용 공개 맥락 문서
```

## 글 작성 기준

새 글은 가능하면 다음 구조를 따릅니다.

1. 이 글에서 배우는 것
2. 필요한 배경 지식
3. 핵심 개념
4. 예제 또는 문제 상황
5. 자주 하는 실수
6. 요약과 다음에 읽을 글

Front matter에는 최소한 `title`, `categories`, `tags`를 명시합니다. 첫 번째 category는 가능하면 `_data/learning_paths.yml`의 category name과 맞춰 글 상세에서 학습 경로가 연결되도록 합니다.

## 개발/빌드

이 프로젝트는 Jekyll과 Minimal Mistakes 기반입니다.

```sh
bundle install
bundle exec jekyll serve
```

로컬 환경에 Jekyll 실행 파일이 없으면 `bundle install` 후 다시 실행합니다.

## 운영 원칙

- 새 의존성보다 Jekyll data/layout/include/Sass 구조를 우선 사용합니다.
- 디자인은 정보 전달과 가독성을 해치지 않아야 합니다.
- 카테고리나 네비게이션 변경 시 `_data/learning_paths.yml`과 실제 category page/permalink를 함께 확인합니다.
- 공개 문서에는 개인적인 인터뷰 원문이나 비공개 작업 로그를 포함하지 않습니다.
