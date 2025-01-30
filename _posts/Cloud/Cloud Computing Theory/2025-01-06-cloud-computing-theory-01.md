---
title: "☁️ 클라우드 컴퓨팅 핵심 이론: 가상화 기술부터 발전 역사까지"
date: 2025-01-06 09:00:00 +0900
categories:
  - Cloud Computing Theory
tags:
  - cloud computing
  - cloud theory
  - virtualization technology
  - distributed systems
  - cloud service models
  - cloud infrastructure
  - cloud security
  - cloud history
---

# ☁️ Cloud Computing이란?

> 📌 클라우드 컴퓨팅이란 인터넷(cloud)을 통해서 원격으로 서버, 스토리지, 데이터베이스, 소프트웨어, 네트워크 등 다양한 컴퓨터 자원을 원할 때 즉시 사용할 수 있는 것을 말한다.

- 🚫 로컬 서버나 개인 기기에 의존하지 않는다.

# 📜 Cloud Computing의 역사

> 🕰️ Cloud Computing이라는 용어는 1990년대 말에 도입되어 쓰이기 시작했지만, Cloud Computing을 가능하게 한 기술은 1960년대부터 꾸준히 발전해왔다.

- 1960년대: ⏳ 시분할 기술 ARPANET(Advanced Research Projects Agency NETwork)
- 1990년대: 🌐 WWW(World Wide Web) Internet 붐
- 2000년대 초: 📦 Salesforce.com 등 SaaS(Software as a Service) 서비스 확산
- 2006년: 🏗️ AWS(Amazon Web Services) IaaS(Infrastructure as a Service) 서비스 본격화
- 2008-2010년: 📱 iPhone 등장으로 Cloud Computing 수요 급증
- 2008-2010년: 🛠️ Google App Engine, MS Azure 등 PaaS(Platform as a Service) 서비스 본격화
- 2010-현재: ⚡ Serverless, AI 등 다양한 기술 도입

# 💻 Cloud Computing을 가능하게 하는 핵심 기술

## 🖥️ Virtualization (가상화)

> 🔄 가상화란 서버, 운영체제, 스토리지, 네트워크 등 다양한 컴퓨팅 자원의 가상 버전을 생성함으로써 하나의 물리적인 하드웨어에서 여러 환경이 동시에 실행되어 소프트웨어를 하드웨어와 분리시키는 기술이다.

### 🔧 가상화의 종류

- Server Virtualization
- Operating System Virtualization
- Network Virtualization
- Storage Virtualization
- Desktop Virtualization
- Application Virtualization

### Server Virtualization

> 서버 가상화는 물리 서버를 여러 개의 가상 머신(VM)으로 분할하여 각각 독립적인 운영 체제와 응용 프로그램을 실행하는 것을 의미한다. 이를 통해 서버 리소스를 효율적으로 활용할 수 있으며, 하나의 물리 서버에서 여러 워크로드를 동시에 실행할 수 있다.

![Image](https://github.com/user-attachments/assets/2b66cc3e-9f3d-4ee3-b90e-4c26c765e4a1)

*이미지 출처: [What Is Server Virtualization? Guide for Server Virtualization](https://www.dnsstuff.com/what-is-virtualization)*

### Operating System Virtualization

> 컨테이너화(Containerization) 또는 컨테이너 기반 가상화라고도 알려진 이 유형의 가상화는 하나의 운영 체제 커널을 공유하는 여러 격리된 사용자 공간 인스턴스인 컨테이너를 생성하는 것이다. 컨테이너는 가볍고 이식 가능한 환경을 제공하여 리소스를 효율적으로 활용하고 응용 프로그램을 빠르게 배포할 수 있게 한다.

- Docker와 Kubernetes가 대표적이다.

![Image](https://github.com/user-attachments/assets/a961160a-acc1-46cb-93c6-0143ac8cf461)

*이미지 출처: 직접 제작*

### Network Virtualization

> 네트워크 가상화는 스위치, 라우터, 방화벽과 같은 네트워크 리소스를 추상화하고 가상화하는 것을 의미한다. 가상 네트워크를 생성하여 네트워크 트래픽을 논리적으로 분리하고 보다 유연하고 확장 가능한 네트워크 구성을 가능하게 한다.

![Image](https://github.com/user-attachments/assets/15e02500-464a-4352-af25-641a8389150e)

*이미지 출처: [What Is Network Virtualization?](https://bradhedlund.com/2013/05/28/what-is-network-virtualization/)*

### Storage Virtualization

> 스토리지 가상화는 하드 드라이브 또는 스토리지 어레이와 같은 물리적 스토리지 장치를 추상화하여 운영 체제나 응용 프로그램에 논리적 단위로 제공하는 것이다. 스토리지 리소스의 중앙 관리를 가능하게 하며, 데이터 이동을 간소화하고 데이터 복제 및 스냅샷과 같은 기능을 제공한다.

### Desktop Virtualization

> 데스크톱 가상화 또는 가상 데스크톱 인프라(Virtual Desktop Infrastructure, VDI)는 원격 서버에 호스팅된 가상 머신에서 데스크톱 운영 체제와 응용 프로그램을 실행하는 것을 의미한다. 사용자는 원격으로 가상 데스크톱에 액세스하여 유연성, 중앙 관리 및 향상된 보안을 제공받을 수 있다.

![Image](https://github.com/user-attachments/assets/127b157f-bb8f-4237-9eef-21afaf30a0a9)

*이미지 출처: [What is VDI (Virtual Desktop Infrastructure) and How Does VDI Work?](https://www.helpwire.app/blog/what-is-virtual-desktop-infrastructure/)*

#### DaaS (Desktop as a Service)

> DaaS는 기술적으로는 VDI에 기반을 두고 있다. VDI는 기업에서 자체적으로 서버를 운영하여 데스크탑 가상화를 이용한다면, DaaS는 클라우드 서비스 제공업체에서 사용자에게 VDI 서비스를 제공하고 종량제 방식으로 과금을 하는 서비스이다.

![Image](https://github.com/user-attachments/assets/a95ee9d8-3728-45b2-830a-d9568bda809a)

*이미지 출처: [Navigating the Blurred the Line Between VDI, Physical Desktop, and DaaS](https://www.netapp.com/blog/daas-vs-vdi-vs-pc/)*

### Application Virtualization

> 애플리케이션 가상화는 애플리케이션을 기반 운영 체제에서 분리하여 격리된 컨테이너에 포장하는 것이다. 이를 통해 애플리케이션은 호스트 시스템 또는 다른 애플리케이션과 충돌하지 않고 자체적인 가상 환경에서 실행될 수 있다.

![Image](https://github.com/user-attachments/assets/14ae0b36-0fd8-4f16-b4fe-de54497e0c67)

*이미지 출처: [Application Virtualization](https://www.appviewx.com/education-center/application-virtualization/)*


## 🌐 Distributed Computing (분산 컴퓨팅)

> 분산 컴퓨팅이란 여러 대의 컴퓨터를 네트워크로 연결하여 하나의 컴퓨터처럼 사용하는 기술이다.

## 📈 Scalable Infrastructure (확장 가능한 인프라)

> 확장 가능한 인프라란 서버 자원을 추가하여 확장하는 것을 말한다.

## 🌐 Broadband Internet (광대역 인터넷)

> 대역폭이 넓은 인터넷 기술이다.

## 🤖 Automation & Orchestration (자동화 및 오케스트레이션)

> 자동화 및 오케스트레이션이란 컴퓨터 자원을 자동으로 관리하는 것을 말한다.

## 📊 Standardization and APIs (표준화 및 API)

> 표준화 및 API(Application Programming Interface)란 컴퓨터 자원을 표준화하여 사용하는 것을 말한다.

## 🔒 Security and Data Protection (보안 및 데이터 보호)

> 보안 및 데이터 보호란 컴퓨터 자원을 보호하는 것을 말한다.

## 🧠 Analytics and Machine Learning (분석 및 머신 러닝)

> 분석 및 머신 러닝이란 컴퓨터 자원을 분석하여 사용하는 것을 말한다.
