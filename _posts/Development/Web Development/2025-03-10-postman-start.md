---
title: "[Postman] 시작하기"
date: 2025-03-10 10:00:00 +0900
last_modified_at: 2025-03-10 10:00:00 +0900
categories: 
  - Development
tags:
  - Postman
  - API

toc: true
toc_sticky: true
---

# 🎯 Postman 시작하기

> Postman은 이미 배포된 REST API를 테스트하기 위한 도구이다. Postman을 통해 API를 테스트해보자. 이미 로컬에 설치되어 있다고 가정하고 시작하지만 웹에서도 유사하게 작업이 가능하다.

## 1. ✨ Postman 시작하기

- Workspaces 내부에 collection을 만들어 관리한다.

![Image](https://github.com/user-attachments/assets/e073f181-90ab-4f8c-9391-cd68cdca0038){: .align-center}

- 나는 collection을 `Azure`라는 이름으로 만들었다.
  - 아래 캡처에 표시된 `+` 버튼을 클릭하여 새로운 method test를 만들 수 있다.

![Image](https://github.com/user-attachments/assets/ecd41ec3-9727-4386-b96a-d87f48613b60){: .align-center}

## 2. REST API 테스트

> Postman으로 API를 테스트해보자.

### 2.1. POST 요청

> 나는 Azure OpenAI를 사용할 것이다.

- 요청 방식: POST
- 요청 URL: Endpoint URL

![Image](https://github.com/user-attachments/assets/0b60ea17-abbf-484c-992b-7b134a1bf277){: .align-center}

- 위 캡처에 표시된 것들에 맞게 Endpoint URL을 작성하고 Header에 키를 작성한다.

![Image](https://github.com/user-attachments/assets/09a14a4b-3a3c-4bbf-8ad2-2973da727b4e){: .align-center}

- Body에는 json 형식으로 요청이 정상적으로 되도록 작성하였다.

![Image](https://github.com/user-attachments/assets/86981efa-96ee-402a-807d-e3791768a2d7){: .align-center}

- 아래는 간단한 요청 예시이다.

```json
// system: 시스템에 역할 부여
// assistant: 시스템에 대한 응답을 받는 역할
// user: 사용자의 질문
{
    "messages": [
        {
            "role": "system", // 시스템 메시지는 끝까지 유지된다.
            "content": [
                {
                    "type": "text",
                    "text": "너는 먹방 유튜버야"
                }
            ]
        },
        {
            "role": "user",
            "content": [
                {
                    "type": "text",
                    "text": "안녕하세요?"
                }
            ]
        }
    ],
    "temperature": 0.9,
    "top_p": 0.06,
    "max_tokens": 800
}
```

- 요청을 보내면 아래와 같이 응답이 온다.

![Image](https://github.com/user-attachments/assets/a2f5689d-0b98-464c-82b9-45c29db5e055){: .align-center}