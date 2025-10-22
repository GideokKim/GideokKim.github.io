---
title: "[WSL2] WSL2 소개 - Windows에서 Linux 환경을 구축하는 방법"
date: 2025-10-22 22:00:00 +0900
last_modified_at: 2025-10-22 22:00:00 +0900
categories:
  - WSL2
tags:
  - wsl2
  - ubuntu
  - linux
  - windows
  - virtual machine
  - virtual box
  - virtual machine manager
  - 개발환경
  - 개발도구

toc: true
toc_sticky: true
---

# 🔍 WSL2 소개 - Windows에서 Linux 환경을 구축하는 방법

## 1. 📋 WSL2란 무엇인가?

> **WSL2(Windows Subsystem for Linux 2)**는 Windows에서 별도의 가상머신이나 듀얼 부팅 없이도 Linux 환경을 실행할 수 있게 해주는 Microsoft의 혁신적인 기술이다. 개발자들이 Windows와 Linux를 동시에 사용할 수 있는 원활하고 생산성 높은 개발 환경을 제공한다.

WSL2는 Windows 10 버전 1903 이상과 Windows 11에서 사용할 수 있으며, 현재 Linux 배포판을 설치할 때의 기본 버전이다. 이 기술을 통해 개발자들은 Windows의 편리함과 Linux의 강력한 개발 도구들을 동시에 활용할 수 있다. **참고로 이제 Windows 10은 지원이 종료되었으니 Windows 11을 사용하자.**

## 2. 🚀 WSL2의 주요 특징

### 2.1. 🎯 핵심 기능

**완전한 Linux 커널을 사용한다는 점이 가장 큰 변화다.** WSL1에서는 Windows 커널을 통해 Linux 시스템 호출을 변환했지만, WSL2는 실제 Linux 커널을 사용해서 완전한 호환성을 제공한다. 이로 인해 기존에 WSL1에서 실행되지 않던 애플리케이션들도 정상적으로 작동하게 되었다.

**파일 시스템 성능이 놀라울 정도로 향상되었다.** 특히 Linux 파일 시스템에서 작업할 때 최대 20배까지 빨라진다고 하니, 개발자 입장에서는 정말 체감할 수 있는 차이다. `git clone`이나 `npm install` 같은 작업들이 훨씬 빨라진다.

**Docker를 비롯한 다양한 Linux 애플리케이션을 실행할 수 있다.** 이전에는 Docker Desktop을 Windows에서만 사용해야 했지만, 이제 WSL2 내에서 네이티브 Docker를 사용할 수 있다. 컨테이너 개발을 하는 개발자들에게는 정말 큰 변화다.

**GPU 가속도 지원한다.** 머신러닝이나 딥러닝 작업을 하는 개발자들에게는 GPU를 활용한 학습이 가능해졌다. TensorFlow나 PyTorch 같은 프레임워크에서 GPU를 제대로 활용할 수 있다.

**GUI 애플리케이션도 실행할 수 있다.** 이제 Linux의 그래픽 애플리케이션들을 Windows 데스크톱에서 바로 실행할 수 있어서, Linux 전용 도구들도 편리하게 사용할 수 있다.

### 2.2. 🔧 지원하는 기능들

WSL2에서는 정말 다양한 것들을 사용할 수 있다. Ubuntu, Debian, Kali Linux 같은 주요 배포판들은 물론이고, Microsoft Store에서 제공하지 않는 커스텀 배포판도 직접 가져와서 설치할 수 있다.

명령줄 도구들도 완벽하게 작동한다. BASH는 기본이고, grep, sed, awk 같은 전통적인 Unix 도구들도 모두 사용 가능하다. 개발 도구들도 마찬가지다. vim, emacs, tmux 같은 에디터나 터미널 멀티플렉서도 문제없이 돌아간다.

프로그래밍 언어 지원도 훌륭하다. NodeJS, Python, Ruby, C/C++, Rust, Go 등 거의 모든 언어를 Linux 환경에서 사용할 수 있다. 특히 Python 개발자들에게는 정말 좋은 환경이다.

데이터베이스나 웹 서버 같은 서비스들도 모두 지원한다. SSHD, MySQL, Apache, MongoDB, PostgreSQL 등등. 패키지 관리자도 apt, yum 등 원래 Linux에서 사용하던 것들을 그대로 사용할 수 있어서 매우 편리하다.

## 3. 📊 WSL1 vs WSL2 비교

| 기능 | WSL1 | WSL2 |
|------|------|------|
| Windows와 Linux 통합 | ✅ | ✅ |
| 빠른 부팅 시간 | ✅ | ✅ |
| 작은 리소스 사용량 | ✅ | ✅ |
| VMware/VirtualBox 호환 | ✅ | ❌ |
| 관리형 VM | ❌ | ✅ |
| 완전한 Linux 커널 | ❌ | ✅ |
| 완전한 시스템 호출 호환성 | ❌ | ✅ |
| OS 간 파일 시스템 성능 | ✅ | ❌ |
| systemd 지원 | ❌ | ✅ |
| IPv6 지원 | ✅ | ✅ |

### 3.1. 🎯 WSL2의 장점

**성능이 정말 많이 좋아졌다.** 파일 작업을 할 때 특히 체감이 크다. `git clone`이나 `npm install` 같은 작업들이 WSL1 대비 2-5배 빨라졌고, tar 파일 압축 해제 같은 작업은 최대 20배까지 빨라졌다고 한다. 실제로 사용해보면 정말 차이가 난다.

**호환성 문제가 거의 사라졌다.** 실제 Linux 커널을 사용하기 때문에 기존에 WSL1에서 실행되지 않던 애플리케이션들도 대부분 정상적으로 작동한다. Docker도 네이티브로 실행할 수 있고, Linux 커널이 업데이트되면 바로 반영되니까 최신 기능들도 빠르게 사용할 수 있다.

**최신 기술들도 잘 지원한다.** systemd를 사용할 수 있어서 최신 Linux 서비스 관리 방식도 그대로 사용할 수 있고, IPv6 네트워킹도 지원한다. GPU 가속 머신러닝도 가능해서 딥러닝 개발자들에게는 정말 유용하다.

### 3.2. ⚠️ WSL1을 고려해야 하는 경우

**Windows 파일 시스템을 자주 접근해야 한다면 WSL1이 더 나을 수 있다.** WSL2에서는 Windows 파일 시스템에 접근할 때 성능이 떨어지는 문제가 있다. 프로젝트 파일을 Windows에 저장해야 하거나, Windows 애플리케이션으로 Linux 파일에 접근해야 하는 경우에는 WSL1이 더 적합할 수 있다. **아무래도 WSL2는 가상머신을 사용하기 때문에 성능이 떨어질 수 있다.**

**특수한 하드웨어를 사용해야 한다면 고려해볼 만하다.** 시리얼 포트나 USB 장치에 직접 접근해야 하는 경우에는 WSL1이 더 나을 수 있다. 다만 WSL2에서도 USBIPD-WIN 프로젝트를 통해 USB 지원이 가능하니, 필요하다면 확인해보자.

**메모리 사용량이 중요한 환경이라면 WSL1을 고려해보자.** WSL2는 가상머신을 사용하기 때문에 메모리를 좀 더 많이 사용한다. 엄격한 메모리 제약이 있거나, 장시간 실행되는 세션에서 대량의 파일을 접근해야 하는 경우에는 WSL1이 더 적합할 수 있다.

## 4. 🛠️ WSL2 설치 및 설정

### 4.1. 📋 시스템 요구사항

![Image]({{ site.url }}{{ site.baseurl }}/images/development/wsl2/2025-10-22-introduce-wsl2/01.png){: .align-center}

WSL2를 사용하려면 **Windows 11**이어야 한다. Windows 버전을 확인하려면 `winver` 명령어를 실행하거나 Windows 키 + R을 누르고 `winver`를 입력하면 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/development/wsl2/2025-10-22-introduce-wsl2/02.png){: .align-center}

가장 중요한 것은 **BIOS나 UEFI에서 가상화 기능을 활성화해야 한다는 점이다.** Intel CPU라면 VT-x, AMD CPU라면 AMD-V를 활성화해야 한다. **이게 안 되어 있으면 WSL2가 제대로 작동하지 않는다.**

`제어판 -> 프로그램 -> 프로그램 및 기능 -> Windows 기능 켜기/끄기` 탭에서 위 이미지에 표시된 항목들을 활성화해야 한다.

### 4.2. 🚀 간편 설치 방법

가장 쉬운 방법은 **PowerShell**을 관리자 권한으로 실행한 다음 다음 명령어를 입력하는 것이다:

```bash
wsl --install
```

이 명령어 하나로 **WSL2와 기본 Ubuntu 배포판이 자동으로 설치된다.** 정말 간단하다.

### 4.3. 🔧 수동 설치 방법

간편 설치가 안 되거나 특별한 설정이 필요한 경우에는 수동으로 설치할 수 있다.

먼저 WSL 기능을 활성화해야 한다:
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

그 다음 Linux 커널 업데이트 패키지를 다운로드해서 설치한다. Microsoft 공식 사이트에서 받을 수 있다.

설치가 완료되면 WSL2를 기본 버전으로 설정한다:
```bash
wsl --set-default-version 2
```

이제 원하는 Linux 배포판을 설치할 수 있다:
```bash
wsl --install -d Ubuntu
wsl --install -d Debian
wsl --install -d Kali-Linux
```

## 5. 🎯 실제 사용 사례

### 5.1. 💻 개발 환경 구축

**웹 개발자들에게는 정말 유용하다.** Node.js, Python, Ruby 같은 언어들을 Linux 환경에서 개발할 수 있어서 서버 환경과 거의 동일한 조건에서 작업할 수 있다. Docker도 네이티브로 사용할 수 있어서 컨테이너 개발도 편리하다. Git도 Linux 환경에서 사용하니까 더 빠르고 안정적이다.

**시스템 관리자들도 많이 사용한다.** Linux 서버 관리 도구들을 Windows에서도 사용할 수 있어서 매우 편리하다. 네트워크 진단이나 모니터링 도구들도 그대로 사용할 수 있고, 보안 도구나 스크립팅도 Linux 환경에서 하는 게 훨씬 효율적이다.

### 5.2. 🔬 데이터 사이언스 및 머신러닝

**데이터 사이언티스트들에게는 필수 도구다.** Python의 데이터 사이언스 스택인 pandas, numpy, scikit-learn 등을 Linux 환경에서 사용할 수 있어서 성능도 좋고 설치도 간편하다. GPU 가속도 지원하니까 TensorFlow나 PyTorch 같은 딥러닝 프레임워크도 제대로 활용할 수 있다. Jupyter Notebook도 Linux 환경에서 돌리니까 더 안정적이다.

### 5.3. 🛡️ 사이버 보안

**보안 전문가들도 많이 사용한다.** Kali Linux를 WSL2에서 실행해서 침투 테스트나 보안 분석을 할 수 있다. 다양한 보안 도구들과 스크립트들을 Linux 환경에서 실행할 수 있어서 매우 편리하다. 네트워크 분석이나 모니터링도 Linux 도구들을 사용하는 게 훨씬 강력하다.

## 6. 🔧 고급 설정 및 최적화

### 6.1. 📁 파일 시스템 성능 최적화

**가장 중요한 것은 프로젝트 파일을 Linux 파일 시스템에 저장하는 것이다.** WSL2에서는 Linux 파일 시스템에서 작업할 때 훨씬 빠르다. Windows 파일 시스템에 접근할 때는 성능이 떨어지니까 가능한 한 Linux 파일 시스템을 사용하자.

**VS Code Remote WSL 확장을 사용하면 정말 편리하다.** Windows의 VS Code로 Linux 파일 시스템의 프로젝트를 편집할 수 있어서 성능 저하 없이 통합 개발 환경을 구축할 수 있다. 이 확장을 사용하면 Windows와 Linux 환경을 오가면서 작업할 필요가 없다.

### 6.2. 🌐 네트워킹 설정

**포트 포워딩이 필요한 경우가 있다.** WSL2는 가상머신을 사용하기 때문에 기본적으로 고유한 IP 주소를 가진다. 외부에서 WSL2의 서비스에 접근하려면 포트 포워딩을 설정해야 한다:

```bash
# WSL2 서비스의 포트를 Windows 호스트로 포워딩
netsh interface portproxy add v4tov4 listenport=3000 listenaddress=0.0.0.0 connectport=3000 connectaddress=172.x.x.x
```

WSL2의 내부 IP 주소를 확인하려면:
```bash
# WSL2 내부 IP 주소 확인
ip addr show eth0
```

## 7. 🎉 결론

WSL2는 정말 혁신적인 기술이다. Windows 사용자들이 Linux 환경의 강력함을 그대로 누릴 수 있게 해주니까 개발자들에게는 정말 큰 변화다. 완전한 Linux 커널과 높은 성능, 그리고 Windows와의 원활한 통합을 통해 최고의 개발 환경을 구축할 수 있다.

특히 다음과 같은 개발자들에게는 정말 추천하고 싶다:

- **웹 개발자들:** Node.js, Python 등 크로스 플랫폼 개발을 하는 사람들
- **데이터 사이언티스트들:** Linux 기반 데이터 분석 도구를 사용하는 사람들  
- **DevOps 엔지니어들:** Linux 서버 관리나 자동화 스크립트를 작성하는 사람들
- **사이버 보안 전문가들:** Linux 보안 도구나 침투 테스트를 하는 사람들

WSL2를 통해 Windows의 편리함과 Linux의 강력함을 동시에 누리면서, 더욱 생산적인 개발 환경을 만들어보자. 처음에는 설정이 복잡해 보일 수 있지만, 한 번 제대로 설정해두면 정말 편리하게 사용할 수 있다.

---

**참고 자료:**
- [Microsoft WSL 공식 문서](https://learn.microsoft.com/en-us/windows/wsl/about)
- [WSL 버전 비교 가이드](https://learn.microsoft.com/en-us/windows/wsl/compare-versions)
- [WSL GitHub 저장소](https://github.com/Microsoft/wsl)