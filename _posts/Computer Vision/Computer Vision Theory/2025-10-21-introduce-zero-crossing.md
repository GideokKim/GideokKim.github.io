---
title: "[Computer Vision] Zero Crossing으로 Sub-pixel Edge Detection 구현하기"
date: 2025-10-21 22:00:00 +0900
last_modified_at: 2025-10-21 22:00:00 +0900
categories:
  - Computer Vision Theory
tags:
  - zero crossing
  - edge detection
  - computer vision
  - sub-pixel edge detection
  - opencv
  - python
  - image processing
  - computer vision tutorial
  - opencv tutorial
  - image analysis
  - computer vision algorithm
  - edge detection algorithm
  - sub-pixel accuracy
  - image segmentation
  - computer vision theory

toc: true
toc_sticky: true
mathjax: true
---

# 🔍 Zero Crossing을 이용한 Sub-pixel Edge Detection 구현 가이드

## 1. 📋 개요

> **Zero Crossing**은 Computer Vision에서 **Sub-pixel 정밀도**로 Edge를 검출하는 고전적이지만 강력한 방법입니다. 픽셀 단위보다 더 정확한 Edge 위치를 찾아야 하는 정밀 측정, 산업 검사, 의료 영상 분석 등에서 필수적으로 사용됩니다.

## 2. 📚 이론

> Zero Crossing for Edge는 edge를 찾는 수학적이고 고전적인 방법이며, 이미지 밝기의 급격한 변화를 변곡점(Inflection Point)을 통해 정의한다.

### 2.1. 🎯 이론적 정의: Edge와 변곡점

**1.** **Edge의 수학적 정의:** Edge는 이미지 밝기 함수 $I(x)$의 **기울기(1차 미분)** $\frac{dI(x)}{dx}$의 **절대값이 최대**가 되는 지점이며, 이는 밝기가 가장 급격하게 변하는 곳을 의미한다.

**2.** **변곡점:** 1차 미분이 최댓값을 갖는 지점은 함수를 한 번 더 미분한 **2차 미분** $\frac{d^2I(x)}{dx^2}$이 **0**이 되는 지점과 같으며, 이 지점을 **변곡점**이라고 한다.

**3.** **Zero Crossing:** Edge 위치를 찾는 것은 2차 미분 값이 0이 되는 변곡점의 실수 좌표를 찾는 것이다. 디지털 이미지에서는 이산적으로 계산된 2차 미분 값이 **부호가 바뀌는 지점**을 찾는데, 이를 **Zero Crossing**이라고 한다.

## 3. 🔧 모델링

### 3.1. 📝 전제 조건 및 목표

* **전제:** 2차 미분 값 $D(x)$는 픽셀 $i$와 $i+1$ 사이에서 선형적으로 변화한다고 가정한다.
  * **픽셀 값 $I(x)$가 3차 함수(Cubic Function)**로 변화한다고 가정하는 것과 같다.
  * 선형 보간(Linear Interpolation) 이외에 다양한 방법이 있으나, 여기서는 선형 보간으로 방법을 서술한다.

* **변수 정의:**
  * $D_i$: 픽셀 $i$에서의 2차 미분 값
  * $D_{i+1}$: 픽셀 $i+1$에서의 2차 미분 값
  * $\delta$: 픽셀 $i$로부터의 서브픽셀 이동량 (찾고자 하는 값, $0 < \delta < 1$)
  * $x_{edge}$: 서브픽셀 에지 위치 (2차 미분 값이 0이 되는 지점)

* **목표:** $D(x)$가 0이 되는 $x_{edge}$를 찾고, $x_{edge} = i + \delta$에서 $\delta$를 유도한다.

### 3.2. 📐 선형 보간을 이용한 2차 미분 모델링

> 픽셀 $i$를 기준으로 상대 좌표 $\delta$를 사용하여 2차 미분 함수 $D(\delta)$를 직선 방정식으로 모델링한다.

**1.** **직선의 방정식 (기울기-절편 형태):**

$$D(\delta) = m \cdot \delta + b$$

**2.** **픽셀 $i$ 대입 (정수 좌표 $\delta=0$):** 
   픽셀 $i$에서는 $\delta = 0$이므로, $D(\delta)$는 $D_i$와 같다.

$$D_i = m \cdot (0) + b \quad \rightarrow \quad b = D_i$$

**3.** **픽셀 $i+1$ 대입 (정수 좌표 $\delta=1$):** 
   픽셀 $i+1$에서는 $\delta = 1$이므로, $D(\delta)$는 $D_{i+1}$와 같다.

$$D_{i+1} = m \cdot (1) + b$$

$b=D_i$를 대입하여 기울기 $m$을 구한다.

$$D_{i+1} = m + D_i \quad \rightarrow \quad m = D_{i+1} - D_i$$

**4.** **최종 선형 모델:** 
   위에서 구한 $m$과 $b$를 대입하여 픽셀 $i$와 $i+1$ 사이의 $D(\delta)$ 모델을 완성할 수 있다.

$$\mathbf{D(\delta)} = (D_{i+1} - D_i) \cdot \delta + D_i$$

### 3.3. ⚡ Zero Crossing ($\mathbf{D(\delta) = 0}$)을 이용한 $\mathbf{\delta}$ 유도

> $x_{edge}$에서는 2차 미분 값이 0이 되어야 한다. 즉, $D(\delta) = 0$이 되는 $\delta$를 찾는다.

**1.** **방정식 설정:**

$$0 = (D_{i+1} - D_i) \cdot \delta + D_i$$

**2.** **$\mathbf{\delta}$ 항 분리:**

$$-D_i = (D_{i+1} - D_i) \cdot \delta$$

**3.** **$\mathbf{\delta}$ 에 대해 정리:**

$$\mathbf{\delta} = -\frac{D_i}{D_{i+1} - D_i}$$

**4.** **$\mathbf{\delta}$ 에 대해 연산 최적화:**

$$\mathbf{\delta} = \frac{D_i}{D_i - D_{i+1}}$$

### 3.4. ✅ 최종 결과

계산된 $\delta$는 정수 픽셀 $i$로부터의 sub-pixel 이동량이며, 최종 edge 위치는 $x_{edge} = i + \delta$이다.

## 4. 🧮 2차 미분 근사 및 계산

> 디지털 이미지에서는 픽셀 값 $I$를 사용하여 2차 미분 값 $D_i$를 근사한다. 픽셀 기반이기 때문에 discrete data로 간주하고 연산하게 된다.

### 4.1. 📊 2차 미분 근사 공식

- 픽셀 $i$에서의 2차 미분 값 $D_i$는 다음과 같이 주변 세 픽셀을 사용하여 근사된다.

$$\mathbf{D_i} \approx I_{i+1} - 2I_i + I_{i-1}$$

### 4.2. 🔍 Zero Crossing 식별

- sub-pixel edge는 두 인접 픽셀 $i$와 $i+1$ 사이에서 $D_i$와 $D_{i+1}$의 **부호가 다를 때** 발생한다. 수식으로 표현하면 다음과 같다.

$$D_i \cdot D_{i+1} < 0$$

## 5. 🎯 sub-pixel 위치 정제 (선형 보간)

> Zero Crossing이 발생하는 정수 픽셀 쌍 $i$와 $i+1$을 찾았다면, 이 사이에 2차 미분 값이 정확히 0이 되는 지점을 **선형 보간**으로 추정한다.

### 5.1. 📏 이동량 ($\delta$) 계산

- 픽셀 $i$로부터의 sub-pixel 이동량 $\mathbf{\delta}$는 다음과 같다.

$$\mathbf{\delta} = \frac{D_i}{D_i - D_{i+1}}$$

### 5.2. 🎯 최종 edge 위치

- 최종 sub-pixel edge 위치 $\mathbf{x_{edge}}$는 정수 픽셀 $i$와 계산된 이동량 $\delta$의 합이다.

$$\mathbf{x_{edge}} = i + \delta$$

### 5.3. ⚠️ 추가 고려 사항

- 실제 적용 시, 노이즈와 다중 edge 문제를 해결하기 위해 Zero Crossing 전 가우시안 필터링을 적용하거나, 가장 큰 1차 미분(기울기)을 갖는 Zero Crossing만을 edge로 선택하는 임계값 처리가 필요하다.
  - 간단한 도형에 대한 sub-pixel edge 추정의 경우 고려하지 않아도 된다.