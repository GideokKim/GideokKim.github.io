# AI Context: GideokKim.github.io

이 문서는 AI 도구가 이 블로그 저장소를 일관되게 이해하기 위한 공개용 맥락 문서입니다.

## Project identity

- Repository: `GideokKim.github.io`
- Site: `https://gideokkim.github.io`
- Platform: Jekyll/GitHub Pages
- Theme: Minimal Mistakes (`remote_theme: mmistakes/minimal-mistakes`)
- Locale: Korean (`ko-KR`)
- Primary purpose: 사람이 기술 글을 읽으며 학습 흐름을 쉽게 따라가도록 돕는 로드맵형 기술 블로그
- Secondary purpose: AI가 블로그 목적, 학습 경로, 작성 규칙, 주요 파일을 정확히 참조할 수 있게 문서화

## Brand direction

Core concept: **수학적 사고로 개발을 학습하는 기술 로드맵 블로그**

Design should be calm, readable, and information-forward. Avoid visual decoration that makes information transfer harder.

Reference: `docs/brand-direction.md`

## Learning paths

Canonical learning-path data lives in `_data/learning_paths.yml`.

Current path groups:

1. `foundations` — 기초 개발 역량
2. `theory` — 수학·CS 기반
3. `systems` — C++·성능 지향 개발
4. `ai-vision` — AI·컴퓨터 비전
5. `tools-practice` — 실무 도구와 확장

When adding or reorganizing categories, update `_data/learning_paths.yml` first, then check sidebar, homepage, and category archive output.

## Important files

- `_config.yml`: site metadata, theme, plugins, search, defaults
- `_data/navigation.yml`: masthead navigation
- `_data/learning_paths.yml`: learning-path IA source of truth
- `index.html`: homepage content sections
- `_includes/nav_list_main`: sidebar learning-path navigation
- `_includes/learning-path-context.html`: post-level learning-path context box
- `_layouts/categories.html`: `/categories/` learning-path and category archive page
- `_layouts/single.html`: post page layout
- `assets/css/main.scss`: custom styles after Minimal Mistakes imports
- `README.md`: human-facing project overview
- `docs/brand-direction.md`: design/brand rationale

## Writing conventions

For new posts:

- Use Korean-first technical explanations unless a term is conventionally English.
- Prefer learning sequence over isolated notes.
- Include why the topic matters, prerequisites, examples, mistakes, summary, and next-reading hints when possible.
- Keep the first category aligned with `_data/learning_paths.yml` so the post can show a learning-path context box.

Recommended post outline:

1. 이 글에서 배우는 것
2. 필요한 배경 지식
3. 핵심 개념
4. 예제 또는 문제 상황
5. 자주 하는 실수
6. 요약과 다음에 읽을 글

## Change guidelines for AI agents

- Do not add dependencies unless explicitly requested.
- Prefer editing data files, Liquid includes, layouts, and Sass over introducing new systems.
- Preserve `/categories/` and existing post permalinks unless explicitly asked to migrate URLs.
- Keep public documentation safe: do not include private transcript excerpts, local state paths beyond repo-relevant artifacts, or personal secrets.
- After layout/style changes, run a Jekyll build when dependencies are available.
