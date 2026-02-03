---
title: "[Azure] Azure AI Language 사용하기"
date: 2025-03-20 10:00:00 +0900
last_modified_at: 2025-03-20 10:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai language

toc: true
toc_sticky: true
---

# 🎯 Azure AI Language 사용하기

> Azure AI Language Service를 사용해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*

## 1. 🔧 AI Language 기본 세팅

> AI Language는 학습하는데 시간이 걸리므로 만들어두고 나중에 사용하자.

### 1.1 AI Language 리소스 생성하기

- Azure Portal에 들어가서 Resource Group을 들어가서 Resource를 생성하자.
- `language` 검색 후 `언어 서비스`를 선택하자.
  - 아마 `Azure 서비스만`을 체크해야 잘 찾을 수 있을 것이다.
  - 그러면 아래와 같은 화면이 나온다.

![Image](https://github.com/user-attachments/assets/dc8f9540-ea60-4038-8552-1fab9df84146){: .align-center}

- 만들기를 진행하면 아래와 같은 화면이 나온다.
  - 추가 기능 선택은 만든 후에도 할 수 있으니 체크하지 않고 넘어갔다.
- 그리고 기본 정보들을 입력하고 만들면 된다.

![Image](https://github.com/user-attachments/assets/eaa51494-bb05-4c39-9a07-ac0125fef91e){: .align-center}

![Image](https://github.com/user-attachments/assets/cc120f13-711e-4540-9097-318000a7a631){: .align-center}

### 1.2 language studio 접속하기

- 만들어진 리소스에 들어가면 아래와 같은 화면이 나온다.
- 우측 하단에 `Language Studio 시작하기`를 누르면 접속할 수 있다.

![Image](https://github.com/user-attachments/assets/907cb33f-48ec-4108-ae3e-d65d64054fe1){: .align-center}

- 최초 접속을 하면 리소스 지정을 해야하는데 방금 만든 리소스로 지정을 해주면 된다.

![Image](https://github.com/user-attachments/assets/c8df54d1-e895-4542-8b9e-c3c85a26f59d){: .align-center}

## 2. 🤖 Azure AI Language - Extract information 사용하기

### 2.1 Extract named entities 사용하기

> 이 미리 구축된 기능은 명명된 개체 인식(NER)을 사용하여 텍스트에서 개체를 식별하고 이를 사람, 위치, 이벤트, 제품 및 조직과 같은 미리 정의된 클래스 또는 유형으로 분류한다. Unstructured Text(비구조화된 텍스트)에서 여러 사전 정의된 범주 그룹에 속하는 개체(단어 또는 구)를 분류하는 기능이다.

- `language studio`에 들어가서 `Extract information`을 선택하자.

![Image](https://github.com/user-attachments/assets/7debb332-b7a2-4009-821c-44b2c8a0a2e1){: .align-center}

- 한국어가 없어서 `Auto-detect language`를 선택하고 채용 공고 하나를 던져보았다.

![Image](https://github.com/user-attachments/assets/1ba7242d-853b-42b2-ae0e-2a1e20408745){: .align-center}

- 카카오 채용 공고 중 하나를 넣어보았는데, 아래처럼 organization을 잡아내는 것을 확인할 수 있었다.
  - 개인적인 생각으로는 성능이 그렇게 좋진 않은 것 같다.

![Image](https://github.com/user-attachments/assets/b7d12198-175b-4527-a1c4-1815c7188d2f){: .align-center}

- 범주 세부 정보는 아래와 같다.

| 범주          | 세부 정보                                                                                     |
|---------------|----------------------------------------------------------------------------------------------|
| **Person**    | 사용자의 이름                                                                                |
| **PersonType**| 사용자가 보유한 직업 유형 혹은 역할                                                        |
| **Location**  | 자연 및 인간이 만든 랜드마크, 구조, 지리적 기능 및 지정학적 엔터티                         |
| **Organization** | 회사, 정치 그룹, 음악 밴드, 스포츠 클럽, 정부 기관, 공공 단체. 국적 및 종교 미포함      |
| **Event**     | 역사적, 사회적 및 자연적으로 발생하는 이벤트                                               |
| **Product**   | 다양한 범주의 물리적 개체                                                                   |
| **Skill**     | 기능, 기술 또는 전문 지식 (한글 미지원)                                                      |
| **Address**   | 전체 우편 주소                                                                               |
| **PhoneNumber**| 전화 번호(미국과 유럽 전화 번호만 해당)                                                    |
| **Email**     | 이메일 주소                                                                                  |
| **URL**       | 웹 사이트에 대한 URL                                                                        |
| **IP**        | 네트워크 IP 주소                                                                             |
| **DateTime**  | 날짜 및 시간                                                                                 |
| **Quantity**   | 숫자 및 숫자 수량                                                                           |

## 3. 🎨 다른 Extract information 기능들

> Azure AI Language에는 Extract information 외에도 다양한 기능들이 있다.

### 3.1 Sentiment analysis

- 텍스트의 감정(긍정, 부정, 중립)을 분석하는 기능이다.
- 고객 피드백, 리뷰, 소셜 미디어 데이터 등을 분석할 때 유용하다.

### 3.2 Key phrase extraction

- 텍스트에서 중요한 핵심 구문을 자동으로 추출하는 기능이다.
- 문서 요약, 검색 엔진 최적화 등에 사용할 수 있다.

### 3.3 Language detection

- 입력된 텍스트의 언어를 자동으로 감지하는 기능이다.
- 다국어 처리가 필요한 애플리케이션에서 유용하다.

## 4. 📋 결론

> Azure AI Language는 자연어 처리 작업을 쉽게 수행할 수 있는 강력한 서비스다.

- 미리 학습된 모델을 사용하므로 ML 전문 지식이 없어도 사용 가능하다.
- 다양한 언어를 지원하며, 커스터마이징도 가능하다.
- 엔터프라이즈급 솔루션으로 높은 정확도를 제공한다.
