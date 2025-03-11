---
title: "[Azure] Azure OpenAI Service 내부 모델 배포하기"
date: 2025-03-11 11:00:00 +0900
last_modified_at: 2025-03-11 11:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - openai
  - azure portal
  - azure openai service
  - azure openai model deployment

toc: true
toc_sticky: true
---

# 🎯 Azure OpenAI Service 내부 모델 배포하기

> Azure에 있는 Azure OpenAI Service의 내부 모델을 배포하고 사용해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*

## 1. 🚀 Azure OpenAI 모델 배포하기

- Azure OpenAI Service 리소스에 들어가서 `Go to Azure AI Foundry portal` 클릭

![Image](https://github.com/user-attachments/assets/e034e50f-24c0-48f2-a638-a7f5e02eee58){: .align-center}

- 내가 만든 Azure OpenAI Service 리소스가 생성되고 채팅 플레이그라운드가 나온다.
- 아래 `배포` 클릭

![Image](https://github.com/user-attachments/assets/5bba5112-3a75-4047-a2e5-f0510df3bc57){: .align-center}

- `모델 배포` 클릭

![Image](https://github.com/user-attachments/assets/056968e9-ecd2-4244-9469-f802afa3d741){: .align-center}

- 원하는 모델을 선택하고 `확인` 클릭

![Image](https://github.com/user-attachments/assets/b1310866-25ee-4e3f-b2a7-c11f9c9c6613){: .align-center}

- 배포 이름을 입력하고 `사용자 지정` 클릭

![Image](https://github.com/user-attachments/assets/9b61faea-d2bd-4a57-bbb6-987e594f9ebf){: .align-center}

- 세부 정보를 수정하자.
  - 나는 분당 토큰 속도 제한을 40K로 설정했다.
- 그리고 `배포`를 클릭하면 바로 배포가 된다.

![Image](https://github.com/user-attachments/assets/9e3d6b68-d349-4ed3-a775-6ec561cf49a7){: .align-center}

- 배포가 완료되면 아래처럼 배포 페이지가 나온다.

![Image](https://github.com/user-attachments/assets/f97e69f1-7901-4ae7-8611-309ed9d0a725){: .align-center}

- 배포 페이지에서 배포 상태를 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/a945df13-5d85-4f0b-bef5-d0ccacf647b3){: .align-center}
