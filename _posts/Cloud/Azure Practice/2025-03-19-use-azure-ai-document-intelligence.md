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
  - Azure에서 AI Service를 사용하기 위해서 리소스 그룹을 만들고 그 안에 리소스를 생성하는 것은 동일하다.
  - 단, AI Service의 경우에는 ‘Document Intelligence’와 같이 제품 하나씩 리소스를 생성할 수도 있고, ‘AI services’를 생성하여 여러 AI Service를 한 번에 관리할 수도 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/01.png){: .align-center}

- Marketplace에서 `document intelligence`를 검색하고 `Azure 서비스만`을 체크하면 바로 보인다.
- 들어가서 만들기를 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/02.png){: .align-center}

- 인스턴스 세부 정보를 나에게 맞게 입력하고 검토 및 만들기를 누르자.
- 리소스는 금방 만들어진다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/03.png){: .align-center}

- 내 리소스에 들어가서 `Go to Document Intelligence Studio`를 누르면 이제 기능을 사용해볼 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/04.png){: .align-center}

## 2. Azure AI Document Intelligence  - Document analysis 사용하기

> Azure AI Document Intelligence로 문서를 분석해보자.

### 2.1 OCR/Read 사용하기

> 광학 문자 인식(OCR) 기능을 사용하여 줄, 단어, 위치 및 언어를 감지한다. Document Intelligence의 다른 모델은 이 모델을 사용하여 문서에서 텍스트를 추출한다.

- Document Intelligence Studio에 들어가서 `OCR/Read`를 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/05.png){: .align-center}

- 진입하면 Sample을 선택할 수 있고 `Analyze options`를 통해 여러 옵션을 선택할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/06.png){: .align-center}

- `Run analysis`를 누르면 문서를 분석할 수 있다.
- 아래처럼 바운딩 박스가 표시되고 어떤 글자들이 추출되었는지 확인할 수 있다.
  - Polygon은 바운딩 박스의 좌표를 의미한다.
- 한국어도 잘 인식하는 것을 확인할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/07.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/08.png){: .align-center}

### 2.2 Layout 사용하기

> 문서에서 텍스트, 선택 마크, 표, 단락 및 단락 유형을 추출한다. REST API를 사용하거나 Python, C#, Java 및 JavaScript의 SDK로 시작할 수 있다.

- Document Intelligence Studio에 들어가서 `Layout`을 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/09.png){: .align-center}

- `OCR/Read`와 마찬가지로 `Analyze options`를 통해 여러 옵션을 선택할 수 있다.
- `OCR/Read`와 다르게 `Layout`은 바운딩 박스에 있는 글자들이 어떤 항목에 들어가는지 표시가 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/10.png){: .align-center}

- `Query field`를 추가해서 추출을 원하는 field를 지정할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/11.png){: .align-center}

- 결과에 `Field`가 추가되고 어디가 title인지 알 수 있다!!

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/12.png){: .align-center}


### 2.3 General document 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 대부분의 유형의 문서에서 키-값 쌍, 선택 마크 및 엔티티를 추출한다.

- *🌟앞으로 문서에서 키-값 쌍을 추출하려면 레이아웃 모델을 사용하고 키-값 쌍 추가 기능을 활성화해야 합니다.🌟*
  - 🌟아마도 추후에는 layout으로 기능이 통합될 수도 있을 것 같다....!🌟

- Document Intelligence Studio에 들어가서 `General document`을 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/13.png){: .align-center}

- 이전과 마찬가지로 `Analyze options`를 통해 여러 옵션을 선택할 수 있다.
- `Run analysis`를 누르면 문서를 분석할 수 있다.
- 바운딩 박스가 생성 안된 곳은 어떤 키-값 쌍으로 묶어야 할지 판단이 안되어 묶지 않은 것으로 보인다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/14.png){: .align-center}

## 3. Azure AI Document Intelligence  - Prebuilt models 사용하기

> 미리 구축된 모델을 사용하여 특수한 문서들을 분석해보자.

### 3.1 Invoice 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 사진, 스캔한 문서 및 디지털 PDF를 포함한 다양한 형식과 품질의 invoice를 분석한다. 고객 이름, 청구 주소, 만기일 및 청구 금액과 같은 주요 정보를 구조화된 JSON 데이터 형식으로 추출한다. 현재 영어 및 스페인어 invoice가 지원된다.

- Document Intelligence Studio에 들어가서 `Invoice`을 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/15.png){: .align-center}

- 우선 query field 없이 분석을 진행해보자.
  - 단순히 글자를 인식하는 것이 아니라 vendor사 이름이라는 것까지 추출해낸다....!!

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/16.png){: .align-center}

- 그리고 query field를 추가하면 추출을 원하는 field를 지정할 수 있다!

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/17.png){: .align-center}

- field를 추가하니 이전에는 못잡아내던 Account Number도 잘 잡아낸다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/18.png){: .align-center}

### 3.2 Receipt 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 인쇄된 영수증과 손으로 쓴 영수증을 모두 분석한다. 상점 이름, 상점 전화번호, 거래 날짜, 총 세금 및 거래 총액과 같은 주요 정보를 구조화된 JSON 데이터 형식으로 추출한다.

- Document Intelligence Studio에 들어가서 `Receipt`을 선택하자.
- 바로 아무런 옵션 없이 분석을 진행해보자.
  - 현재는 영수증에서 `Delivery fee`를 잘 못잡아내는 것을 확인할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/19.png){: .align-center}

- `Query field`를 추가해서 `Delivery fee`를 잡아내보자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/20.png){: .align-center}

- 이제 잘 잡아내는 것을 확인할 수 있다!!!

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/21.png){: .align-center}

### 3.3 Identity documents 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 운전 면허증 및 여권을 포함한 신원 문서를 분석한다. 미국 50개 주와 컬럼비아 특별구의 운전 면허증이 지원된다. 주요 정보를 구조화된 JSON 데이터 형식으로 추출한다.

- *🌟참고로 한국 신분증도 된다!🌟*

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/22.png){: .align-center}

### 3.4 Business cards 사용하기

> 광학 문자 인식(OCR) 기능과 딥 러닝 모델을 결합하여 인쇄된 명함을 분석한다. 주요 정보를 구조화된 JSON 데이터 형식으로 추출하며, 여기에는 이름, 성, 회사 이름, 이메일 주소 및 전화번호가 포함된다.

- 전 직장 명함인데 잘 잡는 것을 확인할 수 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/23.png){: .align-center}

### 3.5 Credit cards 사용하기

> 카드 번호, 카드 소지자 이름, 만기일 및 은행 정보와 같은 정보를 추출한다.

- 샘플 카드로 해보니 잘 잡히는 것을 확인할 수 있다!

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-19-use-azure-ai-document-intelligence/24.png){: .align-center}