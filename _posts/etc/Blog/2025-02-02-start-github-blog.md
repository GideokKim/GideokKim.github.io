---
title: "[Github Blog] minimal-mistakes 기반 Github Blog 시작하기"
date: 2025-02-02 22:30:00 +0900
last_modified_at: 2025-02-02 22:30:00 +0900
categories:
  - Blog
tags:
  - Github Blog
  - minimal-mistakes
  - detaching a fork
  - mirror-push 

toc: true
toc_sticky: true
---

# 1. 📝 Github Blog 시작하기

> minimal-mistakes 기반 Github Blog 시작하기

- Github Blog를 시작하기 위해 여러 시행 착오를 겪으면서 깔끔하게 시작할 수 있는 방법을 정리하였다.
- 앞으로 포스팅하는 글을 따라하면 2025년 2월 기준 그럴싸한 Github Blog를 만들 수 있다!

# 2. 📦 저정소 생성

## 🔄 `minimal-mistakes` 저장소 fork

> 나는 웹 개발자가 아니기 때문에 기반이 없으면 너무 어렵다고 생각했다. 그래서 이미 많은 사람들이 사용하는 `minimal-mistakes` 저장소를 포크하기로 했다.

- 먼저 원본 `minimal-mistakes` 저장소를 포크하기 위해 [minimal-mistakes](https://github.com/mmistakes/minimal-mistakes)로 이동한다.
- 오른쪽 상단의 `Fork` 버튼을 눌러 포크를 생성한다.
- **이름은 바꾸지 않고 그대로 진행한다.**

![Image](https://github.com/user-attachments/assets/68601079-b7d9-4f2b-9198-d81ecd6c26a9)
![Image](https://github.com/user-attachments/assets/7b4de93f-4aed-4273-8bb6-ef7b9519ca15)
![Image](https://github.com/user-attachments/assets/86814587-d161-4ec4-9d6d-a3f4a781c354)

# 3. ✂️ 포크 분리하기(detaching a fork)

> 포크를 분리하는 이유는 원본 저장소에 영향을 주지 않기 위해서이다.

- 사실 원본 저장소로 PR을 보내지 않는 이상 원본 저장소에 영향을 주지 않는다.
- ~~사실 내 저장소에 `forked from mmistakes/minimal-mistakes` 라는 문구가 있는데 이를 제거하기 위해 포크를 분리하는게 사실상 더 큰 목적이다.~~

![Image](https://github.com/user-attachments/assets/86814587-d161-4ec4-9d6d-a3f4a781c354)

*위 사진에 표시된 부분 중 아래 `forked from mmistakes/minimal-mistakes`를 제거한다.*

## 💾 포크한 저장소 클론하기

> 원격에 있는 포크한 저장소를 삭제하기 위해 일단 로컬로 클론한다.

1. 일단 터미널을 열고 포크한 저장소를 클론한다.
  - **저장소를 클론할 때는 SSH로 클론해야 편해진다.**

```bash
# git clone --bare https://github.com/EXAMPLE-USER/FORK.git
git clone --bare git@github.com:GideokKim/minimal-mistakes.git
```

![Image](https://github.com/user-attachments/assets/ae0bf732-2477-423d-966f-3ee6a350a889)
![Image](https://github.com/user-attachments/assets/d87b131f-93fa-46a5-b1c7-4dff174127c8)

*현재 WSL2 환경에서 진행하고 있지만 일반 Windows 환경에서도 문제 없이 진행할 수 있다.*

2. **클론한 원격 저장소를 삭제한다.**

![Image](https://github.com/user-attachments/assets/e0d27be5-4b55-4acb-923b-1c6370c540a0)

3. 동일한 이름으로 새로운 저장소를 생성한다.

![Image](https://github.com/user-attachments/assets/710aacc0-fe81-4740-b7b3-89dc5b354d7c)

4. 새로운 저장소에 mirror-push 한다.
  - 삭제한 저장소랑 동일한 이름이기 때문에 SSH 링크 자체는 동일하다.

```bash
# git --git-dir FORK.git push --mirror git@github.com:EXAMPLE-USER/FORK.git
git --git-dir minimal-mistakes.git push --mirror git@github.com:GideokKim/minimal-mistakes.git
```

![Image](https://github.com/user-attachments/assets/dd577821-9448-4ec9-855a-90b87aea5e66)
![Image](https://github.com/user-attachments/assets/03c52d07-5ff2-44b7-8f4b-9d2e7819c6ef)

*`forked from mmistakes/minimal-mistakes` 문구가 사라졌지만, 이 theme의 원작자 및 기여자 분들의 기록은 남길 수 있다!*

---

# 4. 📝 정리

> 위 단계들을 모두 수행했다면 뼈대만 있는 블로그 저장소를 만들 수 있다. 이제 블로그를 만들기 위한 준비가 끝났다. 다음에는 불필요한 파일 삭제 및 저장소 정리 작업을 할 예정이다.

# 5. 🔗 Reference

- [minimal-mistakes](https://github.com/mmistakes/minimal-mistakes)
- [detaching a fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/detaching-a-fork)
