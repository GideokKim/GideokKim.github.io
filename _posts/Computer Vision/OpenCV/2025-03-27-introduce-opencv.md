---
title: "[OpenCV] OpenCV 소개"
date: 2025-03-27 09:00:00 +0900
last_modified_at: 2025-03-27 09:00:00 +0900
categories: 
  - OpenCV
tags:
  - opencv
  - face detection
  - deep learning
  - computer vision
  - mediapipe

toc: true
toc_sticky: true
---

# 🎯 OpenCV 소개

## 1. 🎨 OpenCV란?

> OpenCV(Open Source Computer Vision Library)는 오픈소스 컴퓨터 비전 및 머신 러닝 라이브러리이다.

- 2000년 Intel에서 최초 개발을 시작했으며, 현재는 비영리 단체인 OpenCV.org에서 관리하고 있다.
- BSD 라이선스로 배포되어 학술 및 상업적 용도로 자유롭게 사용 가능하다.
  - [OpenCV Github](https://github.com/opencv/opencv)
- 실시간 이미지 및 비디오 처리에 최적화되어 있으며, CUDA 및 OpenCL을 통한 GPU 가속을 지원한다.
- 다양한 프로그래밍 언어와 플랫폼을 지원:
  - 언어: C++, Python, Java, MATLAB 등
  - 플랫폼: Windows, Linux, macOS, Android, iOS 등
- MediaPipe와의 통합을 통해 고성능 실시간 비전 파이프라인 구축 가능

### 1.1 🛠️ 주요 기능 및 가능한 작업

#### 기본 이미지 처리

- 필터링 (블러링, 샤프닝)
- 에지 검출 (Canny, Sobel)
- 히스토그램 분석 및 조정
- 색 공간 변환 (RGB, HSV, YUV 등)
- 이미지 분할 및 병합

#### 고급 컴퓨터 비전 기능

- 특징점 검출 및 매칭
  - SIFT (Scale-Invariant Feature Transform)
  - ORB (Oriented FAST and Rotated BRIEF)
  - AKAZE
  - KAZE

- 객체 검출 및 인식
  - Haar Cascade Classifier
  - HOG (Histogram of Oriented Gradients)
  - DNN (Deep Neural Network) 모듈
    - TensorFlow 모델 지원
    - PyTorch 모델 지원
    - ONNX 모델 지원
  - YOLO, SSD 등 최신 객체 검출 모델 지원
  - MediaPipe 솔루션 통합

#### 딥러닝 기반 기능

- 얼굴 인식 및 분석
  - 얼굴 검출
  - 랜드마크 검출
  - 표정 인식
  - 연령 및 성별 추정

- 포즈 추정
  - 전신 키포인트 검출
  - 손 포즈 추정
  - 실시간 동작 인식

- 텍스트 감지 및 인식 (OCR)
  - 문서 텍스트 검출
  - 자연 이미지 텍스트 인식
  - 다국어 지원

#### 비디오 처리

- 실시간 비디오 캡처 및 스트리밍
- 움직임 감지 및 추적
- 배경 제거
- 비디오 안정화
- 프레임 분석 및 처리
- 실시간 객체 추적

#### 3D 비전

- 카메라 캘리브레이션
- 스테레오 매칭
- 구조광 (Structured Light)
- 깊이 맵 생성
- 포인트 클라우드 처리

### 1.2 🌍 주요 활용 분야

#### 산업 및 제조

- 제품 품질 검사 및 결함 탐지
- 바코드/QR코드 스캐닝
- 로봇 비전 및 자동화
- 정밀 측정 및 계측

#### 의료 및 보안

- 의료 영상 분석 (X-ray, CT, MRI)
- 수술 보조 시스템
- CCTV 모니터링 및 이상 감지
- 출입 통제 및 생체 인식

#### 자율 주행 및 로보틱스

- 차선/표지판/장애물 인식
- SLAM 및 내비게이션
- 물체 인식 및 조작
- 드론 비전

#### AR/VR 및 엔터테인먼트

- 증강 현실 마커 인식
- 실시간 동작 캡처
- 스포츠 동작 분석
- 게임 및 인터랙티브 미디어

## 2. 💻 설치 및 시작하기

### 2.1 📦 설치 방법

```bash
# 가상환경 생성 (권장)
python -m venv opencv-env

# 가상환경 활성화
# Windows
opencv-env\Scripts\activate
# Linux/Mac
source opencv-env/bin/activate

# 기본 설치
pip install opencv-python  # 기본 모듈
pip install opencv-contrib-python  # 추가 모듈 포함

# GPU 지원 설치 (CUDA 지원)
pip install opencv-python-headless-cuda

# MediaPipe 통합
pip install mediapipe
```

### 2.2 🌟 간단한 예제

```python
import cv2
import numpy as np

# 이미지 읽기
img = cv2.imread('image.jpg')

# GPU 백엔드 설정 (CUDA 사용 가능한 경우)
if cv2.cuda.getCudaEnabledDeviceCount() > 0:
    cv2.setUseOptimized(True)
    cv2.cuda.setDevice(0)

# 그레이스케일 변환
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# MediaPipe Face Detection 사용
import mediapipe as mp
mp_face_detection = mp.solutions.face_detection
face_detection = mp_face_detection.FaceDetection(min_detection_confidence=0.5)
results = face_detection.process(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))

# 얼굴 검출 결과 시각화
if results.detections:
    for detection in results.detections:
        bbox = detection.location_data.relative_bounding_box
        h, w, _ = img.shape
        x, y = int(bbox.xmin * w), int(bbox.ymin * h)
        width, height = int(bbox.width * w), int(bbox.height * h)
        cv2.rectangle(img, (x, y), (x + width, y + height), (0, 255, 0), 2)

# 결과 표시
cv2.imshow('Result', img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```

### 2.3 🚀 성능 최적화 팁

#### GPU 가속 활용

```python
# CUDA 백엔드 확인
print(f"CUDA 장치 수: {cv2.cuda.getCudaEnabledDeviceCount()}")
print(f"현재 CUDA 장치: {cv2.cuda.getDevice()}")

# GPU 메모리 관리
cv2.cuda.resetDevice()  # GPU 메모리 초기화
```

#### 멀티스레딩 최적화

```python
# 멀티스레딩 설정
cv2.setNumThreads(4)  # 스레드 수 설정
```

#### 메모리 최적화

```python
# 이미지 메모리 해제
img = None
cv2.destroyAllWindows()
gc.collect()  # 가비지 컬렉션 실행
```
