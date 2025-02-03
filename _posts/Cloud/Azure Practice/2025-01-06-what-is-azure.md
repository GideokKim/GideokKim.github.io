---
title: "[Azure] Microsoft Azure 소개"
date: 2025-01-06 11:00:00 +0900
last_modified_at: 2025-01-06 11:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure availability zones
  - azure region pairs
  - azure availability set
  - azure region
  - azure datacenter

toc: true
toc_sticky: true
---

# 🎯 Microsoft Azure 소개

> Microsoft Azure는 클라우드 컴퓨팅 서비스를 제공하는 플랫폼이다.

## 1. Azure global infrastructure

- Physical Infrastructure(물리적 인프라)와 connectivity network(연결 네트워크) 2개의 구성요소로 이루어진 Azure 글로벌 인프라는 300개 이상의 데이터 센터가 지역별로 배치되어 있다.
- Azure 네트워크로 통해 연결된 데이터 센터들은 고가용성, 낮은 대기시간, 확장성, 클라우드의 최신 기술들을 제공한다.

![Image](https://github.com/user-attachments/assets/89592292-10e2-4962-aed2-689f99bfd8aa){: .align-center}

*이미지 출처 : [Microsoft Datacenters](https://datacenters.microsoft.com/globe/explore/)*

### 수중 데이터 센터

- Microsoft는 2018년 수중 데이터 센터 실험을 진행했고 2020년에 성공적으로 실험을 마쳤다.
- 데이터 센터의 안정적인 서버 유지를 위해 적정온도를 유지해야 하는데 서버 냉각에만 50%가 넘는 에너지가 사용되기 때문에 수중 데이터 센터 실험을 진행했다.

## 2. Azure datacenters

- Azure 데이터 센터는 네트워크로 연결된 컴퓨터 서버들이 존재하는 빌딩으로 전세계에 걸쳐 위치하고 있다.

### Azure에서 Availability(가용성) 확보하기

![Image](https://github.com/user-attachments/assets/8271ef69-d679-46fe-8bb2-b11984411a69){: .align-center}

*이미지 출처 : [Azure Availability Zones now available for the most comprehensive resiliency strategy](https://azure.microsoft.com/en-us/blog/azure-availability-zones-now-available-for-the-most-comprehensive-resiliency-strategy/)*

#### Availability set(가용성 집합)

> 데이터센터 내에서 VM을 중복함으로써 가용성을 확보

- 가용성 집합은 Azure에서 가상 머신(VM)의 논리적 그룹을 형성하여 연관된 VM들이 동시에 영향을 받는 것을 줄여주는 기능이다.
- 가용성 집합 내의 VM들은 서로 다른 장애 도메인에 배치되어 신뢰성을 높인다.
  - 가용성 집합을 사용할 때는 가용성 집합 내에 최소 두 개 이상의 VM을 생성하는 것이 좋다.
  - 이러한 구성을 통해 애플리케이션의 높은 가용성을 보장하고 Azure의 99.95% SLA를 충족시킬 수 있다.

#### Availability zones(가용성 영역)

> 하나의 region(지역) 내 3개의 zone(영역)이 존재함으로써 데이터 센터 전체가 다운되는 경우에 대비

#### Region pairs (지역 쌍)

> 일정 거리 (예: 100마일) 이상 떨어진 곳에 존재함으로써 지진, 태풍, 대규모 화재 등의 재해 복구에 대비

- Azure 지역은 하나 혹은 그 이상의 데이터 센터들이 모여서 구성되는데 각 데이터 센터는 low latency(짧은 대기 시간) 네트워크로 연결된다.
- 지역 선택 시 고려사항
  - Compliance and data residency(규정 준수 및 데이터 보존): 국가별 준수사항 (특히 데이터 관
련. 예: GDPR)이 다르기 때문에 사용하고자 하는 서비스 적용에 문제가 없는지 확인해야 한다.
  - Service availability(서비스 가용성): 모든 지역에 동일한 서비스가 제공되는 것이 아니기 때문에 사용하고자 하는 지역에 해당 서비스가 제공되는지 확인해야 한다.
  - Pricing(가격)

## 3. Azure 서비스

