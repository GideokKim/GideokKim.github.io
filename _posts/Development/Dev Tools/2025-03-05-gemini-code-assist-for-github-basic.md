---
title: "[Gemini] 내 저장소에 AI 기반 코드 리뷰 도구 적용하기"
date: 2025-03-05 13:00:00 +0900
last_modified_at: 2025-03-05 13:00:00 +0900
categories:
  - Dev Tools
tags:
  - Gemini
  - Code Assist
  - GitHub
  - AI
  - Code Review

toc: true
toc_sticky: true
---

# 1. 🌟 Gemini Code Assist for GitHub이란?

> Gemini Code Assist for GitHub은 GitHub에서 PR이 생성되었을 때 코드 리뷰를 해주는 도구이다.

- AI 기반의 코드 분석 기능을 제공하여 코드 품질을 향상시키고 코드 리뷰에 들어가는 시간을 줄여준다.
- 실제 내가 운영하고 있는 오픈 소스 프로젝트에 적용해보았는데, 생각보다 잘 해주고 Gemini가 해준 리뷰를 반영하면 그걸 확인한 뒤에 추가적인 수정이 필요 없으면 merge 해도 된다고 알려준다.

## 2. 🚀 GitHub에 Gemini Code Assist for GitHub 적용하기

### 2.1. GitHub 저장소 설정

1. **저장소 생성**: GitHub에서 새로운 저장소를 생성하거나 기존 저장소를 선택한다. Gemini Code Assist를 연결할 저장소 하나를 마음속으로 고른다.

### 2.2. Gemini Code Assist 설치

1. **Gemini Code Assist 설치**: [GitHub Apps - Gemini Code Assist](https://github.com/apps/gemini-code-assist)에 들어가 설치한다. 설치 과정은 간단해서 몇 번 클릭하면 완료된다.(아래 이미지는 이미 설치된 모습)

![Image](https://github.com/user-attachments/assets/dda9d1d2-e023-4d1b-aa2f-c91012f64ba6){: .align-center}

2. **적용할 위치 선택(개인, 팀)**: 설치 후 필요한 설정을 구성을 위해 위 이미지에 보이는 `Configure` 버튼 클릭한다. 나는 우선 오픈 소스 프로젝트에 적용하기 위해 내 계정을 대상으로 install 했다.

![Image](https://github.com/user-attachments/assets/7352d1d8-54bb-4121-a63a-cfb8744c0f88){: .align-center}

3. **설정 구성**: 나는 오픈 소스 프로젝트 저장소만 우선 적용해보기로 했다. 현재 운영중인 오픈 소스 프로젝트는 [Google Python Style Guide - 한글 번역](https://github.com/GideokKim/google-python-style-guide-kr)이다. 이제 적용이 완료되었다!

![Image](https://github.com/user-attachments/assets/14fb9d0a-24b4-46fa-aa1c-0a5d507cf439){: .align-center}

## 3. ✅ Gemini Code Assist for GitHub의 PR 리뷰 받아보기

### 3.1. PR 생성

- 코드 수정을 하고 PR 생성을 하면 그 즉시 Gemini Code Assist가 자동으로 이 PR이 담고 있는 변경사항에 대한 정리를 해준다. 전체 답변은 [실제 리뷰 받은 PR](https://github.com/GideokKim/google-python-style-guide-kr/pull/116)을 확인하자.

![Image](https://github.com/user-attachments/assets/90c3a53b-dad5-4d19-8085-80dec58c60b2){: .align-center}

### 3.2. PR 리뷰

- 최초 PR 생성되면 앞에 언급한 요약을 먼저 던져주면서 곧 피드백을 한다고 알려준다.(` I'm currently reviewing this pull request and will post my feedback shortly.`)
- 아래는 내가 실제 리뷰 받은 PR에 대한 최초 피드백이다.

![Image](https://github.com/user-attachments/assets/ae32def1-ece4-477b-93c6-d2fb7db5932c){: .align-center}

- 정말 사람이 리뷰하는 것처럼 코드 리뷰를 해준다....!!! 그리고 priority도 표시가 된다.

![Image](https://github.com/user-attachments/assets/de58f498-303a-487c-b9f1-d80a2a8bc57c){: .align-center}

### 3.3. 피드백 반영

- Gemini Code Assist가 해준 피드백을 반영하고 수동으로 명령어를 사용(`/gemini review`)해 다시 리뷰를 받을 수 있다.

![Image](https://github.com/user-attachments/assets/706ed50b-4e48-4a61-b505-f55d8db4d9f5){: .align-center}

- 앞에서 Gemini Code Assist가 해준 피드백을 반영했으나 Gemini가 보기엔 내가 제대로 반영을 못한 것처럼 이야기해서 다시 수정을 진행했다.

![Image](https://github.com/user-attachments/assets/ecf17cda-75bc-4013-aa2d-f178bf5e0c27){: .align-center}

- 이번에는 내가 피드백 반영하여 수정한 코드에 대해 Gemini가 더 이상 리뷰할 것 없이 완료되었다고 알려준다!

### 3.4. 팀원 피드백 요청

- 이번에는 같이 오픈 소스 프로젝트를 운영하는 팀원인 [@Yoonsoyoung02](https://github.com/Yoonsoyoung02)에게 피드백을 요청해보았다.
- 1차적으로 Gemini Code Assist가 해준 피드백을 반영하여 수정한 코드에 팀원의 피드백을 받는다면 팀원의 코드 리뷰 시간을 줄일 수 있을 것 같다.
- 한국어로 코멘트 달았더니 갑자기 한국어로 답변해주기 시작한 Gemini Code Assist!

![Image](https://github.com/user-attachments/assets/cb0046eb-93ed-4a01-99a0-8a76120c3f65){: .align-center}

- 심지어 팀원의 피드백에 대해서도 답변을 달아준다...!(심지어 한국어로!)

![Image](https://github.com/user-attachments/assets/bc020a28-20b0-4272-82a5-1f9bdf365363){: .align-center}

## 4. 📌 Gemini Code Assist 수동 명령어 모음

> PR 리뷰 코멘트에 명령어를 입력하면 그에 따라 답변을 해준다.

| Command              | Description                                         |
|----------------------|-----------------------------------------------------|
| `/gemini summary`    | 현재 PR에 대한 요약 답변을 해준다. |
| `/gemini review`     | 현재 PR에 대한 코드 리뷰 답변을 해준다. |
| `/gemini`            | 수동으로 Gemini Code Assist를 호출한다. |
| `/gemini help`       | 사용 가능한 명령어 목록을 보여준다. |

## 5. 🔗 참고 자료

- [Gemini Code Assist 공식 문서 - Review GitHub code using Gemini Code Assist](https://developers.google.com/gemini-code-assist/docs/review-github-code)
- [Get coding help from Gemini Code Assist — now for free](https://blog.google/technology/developers/gemini-code-assist-free/)