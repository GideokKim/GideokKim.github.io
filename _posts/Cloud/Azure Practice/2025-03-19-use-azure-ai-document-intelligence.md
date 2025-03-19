---
title: "[Azure] Azure AI Document Intelligence 사용하기"
date: 2025-03-19 20:00:00 +0900
last_modified_at: 2025-03-19 20:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai document intelligence

toc: true
toc_sticky: true
---

# 🎯 Azure AI Document Intelligence 사용하기

> Azure AI Document Intelligence를 사용해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. Azure AI Document Intelligence 리소스 생성하기

> Azure AI Document Intelligence 리소스를 생성해보자.

- 우선 내 리소스 그룹에 들어가서 리소스를 생성해야 한다.

![Image](https://github.com/user-attachments/assets/33bac3df-a06a-40c6-97dc-ef239f13277d){: .align-center}

- Marketplace에서 `document intelligence`를 검색하고 `Azure 서비스만`을 체크하면 바로 보인다.
- 들어가서 만들기를 선택하자.

![Image](https://github.com/user-attachments/assets/d3986574-1184-4aed-89cc-8c9afd62fbd9){: .align-center}

- 인스턴스 세부 정보를 나에게 맞게 입력하고 검토 및 만들기를 누르자.
- 리소스는 금방 만들어진다.

![Image](https://github.com/user-attachments/assets/6b736930-c378-4689-b92c-4ccdd7e05810){: .align-center}

- 내 리소스에 들어가서 `Go to Document Intelligence Studio`를 누르면 이제 기능을 사용해볼 수 있다.

![Image](https://github.com/user-attachments/assets/987cc438-a1be-4dfd-820f-60e9d880f88b){: .align-center}

## 2. Azure AI Document Intelligence  - Document analysis 사용하기

> Azure AI Document Intelligence로 문서를 분석해보자.

### 2.1 OCR/Read 사용하기

> 광학 문자 인식(OCR) 기능을 사용하여 줄, 단어, 위치 및 언어를 감지한다. Document Intelligence의 다른 모델은 이 모델을 사용하여 문서에서 텍스트를 추출한다.

- Document Intelligence Studio에 들어가서 `OCR/Read`를 선택하자.

![Image](https://github.com/user-attachments/assets/1e6a8cb6-0edf-46be-b9c6-33d246e03995){: .align-center}

- 진입하면 Sample을 선택할 수 있고 `Analyze options`를 통해 여러 옵션을 선택할 수 있다.

![Image](https://github.com/user-attachments/assets/ecbd1128-0b20-4e80-a228-ce91c02584d4){: .align-center}

- `Run analysis`를 누르면 문서를 분석할 수 있다.
- 아래처럼 바운딩 박스가 표시되고 어떤 글자들이 추출되었는지 확인할 수 있다.
  - Polygon은 바운딩 박스의 좌표를 의미한다.
- 한국어도 잘 인식하는 것을 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/1b5e6572-74ec-4dc5-b75f-132aec9a64e4){: .align-center}

![Image](https://github.com/user-attachments/assets/0834dda1-1f21-425a-9394-697d9fc0e23a){: .align-center}

### 2.2 Layout 사용하기

> 문서에서 텍스트, 선택 마크, 표, 단락 및 단락 유형을 추출한다. REST API를 사용하거나 Python, C#, Java 및 JavaScript의 SDK로 시작할 수 있다.

- Document Intelligence Studio에 들어가서 `Layout`을 선택하자.

![Image](https://github.com/user-attachments/assets/4d8d686a-05e4-4efa-b25c-7462fece092b){: .align-center}

- `OCR/Read`와 마찬가지로 `Analyze options`를 통해 여러 옵션을 선택할 수 있다.
- `OCR/Read`와 다르게 `Layout`은 바운딩 박스에 있는 글자들이 어떤 항목에 들어가는지 표시가 된다.

![Image](https://github.com/user-attachments/assets/33230abb-bb9a-4167-bddf-5746e02a8c2d){: .align-center}

- `Query field`를 추가해서 추출을 원하는 field를 지정할 수 있다.

![Image](https://github.com/user-attachments/assets/3f6e8054-1bb1-4df1-8c54-73fbf9c0b2fc){: .align-center}

- 결과에 `Field`가 추가되고 어디가 title인지 알 수 있다!!

![Image](https://github.com/user-attachments/assets/a5750a91-7246-434c-96f2-a6089cd5652d){: .align-center}


### 2.3 General document 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 대부분의 유형의 문서에서 키-값 쌍, 선택 마크 및 엔티티를 추출한다.

- *🌟앞으로 문서에서 키-값 쌍을 추출하려면 레이아웃 모델을 사용하고 키-값 쌍 추가 기능을 활성화해야 합니다.🌟*
  - 🌟아마도 추후에는 layout으로 기능이 통합될 수도 있을 것 같다....!🌟

- Document Intelligence Studio에 들어가서 `General document`을 선택하자.

![Image](https://github.com/user-attachments/assets/24fd7e68-75ec-4ceb-9634-003be6160529){: .align-center}

- 이전과 마찬가지로 `Analyze options`를 통해 여러 옵션을 선택할 수 있다.
- `Run analysis`를 누르면 문서를 분석할 수 있다.
- 바운딩 박스가 생성 안된 곳은 어떤 키-값 쌍으로 묶어야 할지 판단이 안되어 묶지 않은 것으로 보인다.

![Image](https://github.com/user-attachments/assets/6610222b-347a-4f7d-8e36-451c17997538){: .align-center}

## 3. Azure AI Document Intelligence  - Prebuilt models 사용하기

> 미리 구축된 모델을 사용하여 특수한 문서들을 분석해보자.

### 3.1 Invoice 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 사진, 스캔한 문서 및 디지털 PDF를 포함한 다양한 형식과 품질의 invoice를 분석한다. 고객 이름, 청구 주소, 만기일 및 청구 금액과 같은 주요 정보를 구조화된 JSON 데이터 형식으로 추출한다. 현재 영어 및 스페인어 invoice가 지원된다.

- Document Intelligence Studio에 들어가서 `Invoice`을 선택하자.

![Image](https://github.com/user-attachments/assets/69271510-bc0c-45c0-b9d8-0b92943e16cc){: .align-center}

- 우선 query field 없이 분석을 진행해보자.
  - 단순히 글자를 인식하는 것이 아니라 vendor사 이름이라는 것까지 추출해낸다....!!

![Image](https://github.com/user-attachments/assets/b0f33905-7211-4c82-92e0-e7b00126d58c){: .align-center}

- 그리고 query field를 추가하면 추출을 원하는 field를 지정할 수 있다!

![Image](https://github.com/user-attachments/assets/ab89308b-3b3f-454a-9bc0-6610960724e1){: .align-center}

- field를 추가하니 이전에는 못잡아내던 Account Number도 잘 잡아낸다.

![Image](https://github.com/user-attachments/assets/8330aaec-d30f-4de0-a2ce-c63e11411a9d){: .align-center}

### 3.2 Receipt 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 인쇄된 영수증과 손으로 쓴 영수증을 모두 분석한다. 상점 이름, 상점 전화번호, 거래 날짜, 총 세금 및 거래 총액과 같은 주요 정보를 구조화된 JSON 데이터 형식으로 추출한다.

- Document Intelligence Studio에 들어가서 `Receipt`을 선택하자.
- 바로 아무런 옵션 없이 분석을 진행해보자.
  - 현재는 영수증에서 `Delivery fee`를 잘 못잡아내는 것을 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/7d67714c-0d01-4423-93b1-0353ecf770be){: .align-center}

- `Query field`를 추가해서 `Delivery fee`를 잡아내보자.

![Image](https://github.com/user-attachments/assets/098d990d-498d-4dbd-9b55-af36e0f078ee){: .align-center}

- 이제 잘 잡아내는 것을 확인할 수 있다!!!

![Image](https://github.com/user-attachments/assets/bfb10a71-0af1-42ed-b432-c2fab1f5065a){: .align-center}

### 3.3 Identity documents 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 운전 면허증 및 여권을 포함한 신원 문서를 분석한다. 미국 50개 주와 컬럼비아 특별구의 운전 면허증이 지원된다. 주요 정보를 구조화된 JSON 데이터 형식으로 추출한다.

- *🌟참고로 한국 신분증도 된다!🌟*

![Image](https://github.com/user-attachments/assets/da603f60-2b63-4754-9aea-5e02c7f6ba48){: .align-center}