---
title: "[알고리즘] 정렬 기본 이론"
date: 2025-04-06 17:00:00 +0900
last_modified_at: 2025-04-06 17:00:00 +0900
categories:
  - Algorithm Theory
tags:
  - sort
  - algorithm
  - coding test

toc: true
toc_sticky: true
---

## 1. 🔍 정렬(Sort)의 개념

> 정렬은 데이터를 사용자가 정의한 순서로 데이터를 나열하는 것을 말한다.

- 사용자가 정의한 순서는 오름차순이나 내림차순이 있을 수 있고 임의의 조건이 될 수도 있다.
- 데이터의 특성에 따라 다르다.

### 정렬이 필요한 이유

- 데이터를 정렬하면 원하는 데이터를 쉽게 찾을 수 있다.
  - 앞서 공부한 [이진 탐색 트리]({{ site.url }}{{ site.baseurl }}/algorithm theory/binary-tree/)가 그 예이다.

> 중앙값 찾기를 예로 보자.

![Image]({{ site.url }}{{ site.baseurl }}/images/algorithm/algorithm-theory/2025-04-06-sort-basic-theory/01.png){: .align-center}

- 위 두 경우 중 어느 데이터가 중앙값을 더 찾기 쉬울까?
- 물론 데이터가 정렬되어 있는 오른쪽이 중앙값을 찾기 쉬울 것이다.
  - 데이터를 정렬하면 데이터의 값을 보거나 비교할 필요 없이 말 그대로 데이터 전체 크기에서 중간의 값만 찾으면 그 값 자체가 중앙값이 된다.
- 정렬하지 않으면 모든 데이터를 확인하고 비교해야 한다. 혹은 정렬 후 중앙값을 찾아야 한다.

## 2. 🔄 정렬의 종류

> 데이터를 정렬하는 방법은 많다.

- [삽입 정렬]({{ site.url }}{{ site.baseurl }}/algorithm theory/insertion-sort/)
- 병합 정렬
- 힙 정렬
- 우선순위 큐
- 위상 정렬
- 계수 정렬
- 선택 정렬
- 버블 정렬
- 퀵 정렬
- 기수 정렬
