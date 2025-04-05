---
title: "[Azure] Azure AI Speech - 음성 번역(Speech Translation) 사용하기"
date: 2025-03-18 19:00:00 +0900
last_modified_at: 2025-03-18 19:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai speech
  - azure voice translation

toc: true
toc_sticky: true
---

# 🎯 Azure AI Speech - 음성 번역(Speech Translation) 사용하기

> Azure AI Speech Service에서 음성 번역을 사용해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. 🔧 음성 번역 세팅하기

> 음성 번역의 경우 딱히 세팅할 부분이 없어 거의 바로 사용할 수 있다.

- 내가 마이크로 음성 데이터를 input해도 되고 파일을 업로드해도 된다.

### 1.1 음성 번역 기본 세팅

- Azure Portal에 들어가서 이전에 생성한 Speech Resource에 들어가면 Speech Studio에 들어가는 버튼이 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-speech-translation/01.png){: .align-center}

- Speech Studio에 들어가서 스크롤을 내리면 보이는 `음성 번역(Speech Translation)`을 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-speech-translation/02.png){: .align-center}

- 기본 세팅을 원하는대로 하자.
  - 나는 마이크를 쓸 것이기 때문에 `음성 언어 선택`을 한국어로 했고, 제대로 번역됐는지 알아볼 수 있는 언어가 영어라서 `대상 언어 선택`을 영어로 하였다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-speech-translation/03.png){: .align-center}

## 2. 🤖 음성 번역 테스트

> 학습 필요 없이 바로 마이크로 음성 데이터를 넣어서 번역을 해보았다.

- 마이크 테스트, 오늘 저녁 반찬은 감자 반찬이다.
- 위 문장을 말했더니 아래처럼 결과가 나왔다!
- 결과는 음성 파일로도 만들어준다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-speech-translation/04.png){: .align-center}
