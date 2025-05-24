---
title: "Git 브랜치 삭제하기"
categories:
  - Git
tags:
  - git
  - branch
  - delete

toc: true
toc_sticky: true
---

# ⚡ Git 브랜치 삭제하기

## local branch 삭제

```bash
git branch -d <branch-name>
git branch -D <branch-name> # 강제 삭제
```

## remote branch 삭제

```bash
git push origin --delete <branch-name>
```

## branch 삭제 확인

```bash
git branch -a
```

### 예시

> 로컬 브랜치 목록과 현재 브랜치(* 표시) 그리고 원격 브랜치 목록이 보인다.

```bash
  feature/add-readme
  fix/categories-visible
  fix/issue-2
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/feature/add-readme
  remotes/origin/fix/categories-visible
  remotes/origin/fix/issue-2
  remotes/origin/main
```

> 로컬 브랜치 삭제

```bash
git branch -D feature/add-readme
```

> 원격 브랜치 삭제

```bash
git push origin --delete feature/add-readme
```
