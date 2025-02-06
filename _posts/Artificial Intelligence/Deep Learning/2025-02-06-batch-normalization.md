---
title: "[Deep Learning] 7. 배치 정규화(Batch Normalization)"
date: 2025-02-06 12:00:00 +0900
last_modified_at: 2025-02-06 12:00:00 +0900
categories: 
  - Deep Learning
tags:
  - deep learning
  - AI
  - neural network
  - batch normalization
  - batch normalization formula
toc: true
toc_sticky: true
---

# 🎯 배치 정규화(Batch Normalization)

![Image](https://github.com/user-attachments/assets/4324b167-1c58-4845-afbd-eb65f4824109){: .align-center}

*이미지 출처: 밑바닥부터 시작하는 딥러닝 1권 - 배치 정규화*

> 배치 정규화(Batch Normalization)는 각 층에서의 활성화 값이 적당히 분포되도록 조정한다.

- 입력값 평균 0, 분산 1로 조정한다.
- 배치 정규화의 효과
  - 학습 속도 개선
  - 초기값에 크게 의존하지 않음
  - 오버피팅 억제

---
⚠️아래 수식은 아직 정리가 안되었습니다. 참고용으로 남겨둡니다.⚠️
---

> 미니배치 m개의 입력 데이터 집합의 평균과 분산

$$
\mu_n = \frac{1}{m} \sum_{i=1}^{m} x_i
$$

$$
\sigma_n^2 = \frac{1}{m} \sum_{i=1}^{m} (x_i - \mu_n)^2
$$

- $\mu_n$: 평균
- $\sigma_n^2$: 분산

> 평균과 분산을 사용해 활성화 함수 입력값 정규화

$$
\hat{x}_i = \frac{x_i - \mu_n}{\sqrt{\sigma_n^2 + \epsilon}}
$$

- $\hat{x}_i$: 정규화된 입력값

> 최종 출력시 $\gamma$는 확대, $\beta$는 이동을 담당한다.

$$
y_i = \gamma \hat{x}_i + \beta
$$

> $\gamma$와 $\beta$는 최적의 성능을 낼 수 있도록 학습 과정에서 머신이 조정한다.

$$
\gamma, \beta = \text{arg} \min_{\gamma, \beta} \sum_{i=1}^{m} (y_i - t_i)^2
$$

