---
title: "[Azure] Azure AI Speech - Custom Voice 만들기"
date: 2025-03-18 18:00:00 +0900
last_modified_at: 2025-03-18 18:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai speech
  - azure custom voice 

toc: true
toc_sticky: true
---

# 🎯 Azure AI Speech - Custom Voice 만들기

> Azure AI Speech Service에서 Custom Voice를 만들어보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. 🔧 Custom Voice 세팅하기

### 1.1 Speech Studio 기본 세팅

- Azure Portal에 들어가서 이전에 생성한 Speech Resource에 들어가면 Speech Studio에 들어가는 버튼이 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/01.png){: .align-center}

- Speech Studio에 들어가서 스크롤을 내리면 보이는 `Custom Voice`를 선택하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/02.png){: .align-center}

- 들어가서 `Custom Voice 프로젝트`를 생성하자.
- 진행하고자 하는 프로젝트의 정보를 넣고 프로젝트를 만들자.
  - 교육 데이터의 언어로 `한국어`도 있으니 사용할 교육 데이터에 따라 선택하자.
- 만들기를 누르면 프로젝트가 만들어진다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/03.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/04.png){: .align-center}

### 1.2 레코드 및 빌드

- 프로젝트가 생성되어 들어가보면 레코드 및 빌드에서 내 목소리를 레코드하고 학습시킬 수 있다.
- 시작 버튼을 누르면 성우 사용 약관을 볼 수 있다. 확인 후 동의를 하자.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/05.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/06.png){: .align-center}

- 마이크로 주변 소음을 체크하고 녹음 단계로 넘어갈 수 있다.
- 녹음 단계에서는 총 20개의 문장을 내가 직접 발음하여 녹음을 하면 된다.
  - 이때 여러가지 품질이 괜찮은지 체크가 되는데 잘 확인하고 다음 문장으로 넘어가자.
  - 제대로 녹음이 안되는 문장은 넘어가도 된다. 예시 문장이 50개가 있어 그 중 20개만 잘 녹음하고 학습을 진행하면 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/07.png){: .align-center}

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/08.png){: .align-center}

## 2. 🤖 모델 학습 및 테스트

> 모델 학습이 완료되면 모델 검토용 샘플들이 있다. 샘플들을 재생해보면 진짜 내 목소리로 내가 말하는 것처럼 나온다....!

- Custom Voice가 생성한 내 목소리와 진짜 내 목소리를 비교해보자!

![Image]({{ site.url }}{{ site.baseurl }}/images/cloud/azure-practice/2025-03-18-use-azure-ai-speech-custom-voice/09.png){: .align-center}