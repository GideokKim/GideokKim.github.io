---
title: "[Azure] Azure AI Vision 소개"
date: 2025-03-24 13:00:00 +0900
last_modified_at: 2025-03-24 13:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai vision

toc: true
toc_sticky: true
---

# 🎯 Azure AI Vision 소개

> Azure AI Vision에 대해 알아보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. Azure AI Vision

> Azure의 Azure AI Vision 서비스는 이미지 처리를 위한 고급 알고리즘을 제공하여, 사용자가 관심 있는 시각적 특징을 기반으로 정보를 반환한다.

### 1.1 제품 설명

| 제품/서비스               | 설명                                                                                                           |
|--------------------------|----------------------------------------------------------------------------------------------------------------|
| **Image analysis**      | 이미지에서 객체, 얼굴, 성인 콘텐츠, 자동 생성된 텍스트 설명 등 다양한 시각적 특징을 추출합니다. |
| **Optical character recognition (OCR)**    | 이미지에서 텍스트를 추출합니다. 딥러닝 기반 모델을 사용하며 다양한 표면과 배경에 있는 텍스트와도 호환됩니다. |
| **Video Analysis**| 물리 영역에서 사람의 존재, 이동 등을 실시간 이해 및 비디오 검색을 합니다. |
| **Facial recognition** | Face 서비스는 이미지에서 사람의 얼굴을 감지, 인식, 분석하는 AI 알고리즘을 제공합니다. 얼굴 인식 소프트웨어는 신원 확인, 비접촉 출입 통제, 프라이버시 보호를 위한 얼굴 흐림 처리 등 다양한 상황에서 사용 가능합니다. |

### 1.2 Microsoft Florence Foundation Model

- 마이크로소프트는 프로젝트 플로렌스(Project Florence)를 통해 AI를 사람처럼 작동하도록 개발하기 위한 지속적인 노력을 진행하고 있으며, 2021년 v1, 2023년 v2로 지속적으로 발전되어 왔다.
- 이 모델은 Azure AI Services에 반영되어 제품의 성능을 개선하고 있다.
- 다중모달리티를 활용하여 학습과 이해를 위한 전인적이고 사람 중심의 접근 방식을 취하고 있다.
- 목표는 서로 다른 모달리티의 공통 표현을 학습하고, 추가적인 외부 도메인 지식을 활용하여 사람들이 세상과 상호작용하고 해석하는 방식에 더욱 가깝게 AI 시스템을 뒷받침하는 사전 학습된 기본 AI 모델을 만드는 것이다.

![Florence v1.0 leverages data curation, unified learning, a Transformer architecture comprising an image encoder and a language encoder, and adaptation. It can be integrated into modern computer vision systems to power real-world vision and multimedia applications. Compared with existing image-text pretraining models, mainly limited to cross-modal shared representations for classification and retrieval (illustrated by the light-green adaptation module above), Florence expands the representation to support object detection, modalities beyond just RGB like image depth, and videos, respectively.](https://www.microsoft.com/en-us/research/wp-content/uploads/2021/12/Picture3.png){: .align-center}

*출처: [Azure AI milestone: New foundation model Florence v1.0 advances state of the art, topping popular computer vision leaderboards](https://www.microsoft.com/en-us/research/project/florence-foundation-model/https://www.microsoft.com/en-us/research/blog/azure-ai-milestone-new-foundation-model-florence-v1-0-pushing-vision-and-vision-language-state-of-the-art/)*

#### 1.2.1 Florence-2: Microsoft's New Foundation Model

- Florence-2 모델은 다중 작업 학습을 통해 방대한 시각적 주석을 활용하여 범용적인 동작을 목표로 한다.
- 이는 다양한 비전 작업을 위한 통합된 프롬프트 기반 표현을 제공하여, 포괄적인 학습 데이터의 부족과 통합된 아키텍처의 부재 문제를 효과적으로 해결할 수 있다.
- 비용 측면에서 장점이 있어 주목할 만한 모델이라고 한다.

![Florence-2’s model architecture.](https://images.prismic.io/encord/9bb8ae77-7b87-4196-ae81-4cf9a6da8a83_image1.png?auto=compress,format){: .align-center}

*출처: [Florence-2: Microsoft's New Foundation Model Explained](https://encord.com/blog/florence-2-explained/)*

## 2. Azure AI Vision Studio

> Azure AI Vision Studio는 이미지 분석 관련 다양한 비전 작업을 수행할 수 있는 클라우드 기반 Azure AI 서비스이다.

- 아직 활발히 개발 중이라 지원하는 언어가 기능별로 많이 다르니 확인하고 사용하자.

### 2.1 이미지 분석 기능표

- **사용자 지정 모델**
  - 이 모델 구축했으나 트레이닝에 계속 실패하는 이슈가 있어 사용하지 못했다.
- 이미지에서 사람 감지
- 이미지 캡션 생성
- 개체 감지
- 시각적 특징 식별/태깅
- 관심영역 잘라내기
- 브랜드 감지
- 이미지 범주 분류
- 얼굴 감지
- 이미지 유형 감지
- 도메인별 콘텐츠 감지
- 색 구성표 감지
- 이미지 콘텐츠 조정
- 선반 위 제품 인식
- 이미지 검색으로 사진 찾기
- 이미지에서 배경 제거
