---
title: "[Environment Setup] WSL2 환경에서 CUDA 설치하기"
date: 2025-02-05 13:00:00 +0900
last_modified_at: 2025-02-05 13:00:00 +0900
categories: 
  - Environment Setup
tags:
  - environment setup
  - wsl2
  - cuda
toc: true
toc_sticky: true
---

# 🎯 WSL2 환경에서 CUDA 설치하기

> 일반적인 ubuntu 환경에서 설치하는 것과 비슷할 것 같으나 실제 설치한 순서대로 정리해보고자 한다.

- 당연히 NVIDIA 그래픽 카드가 있는 것으로 가정한다.
- 또한, 이 포스트는 모든 명령어를 최신 버전으로 설치한다는 가정하에 작성되었다.

![Image](https://github.com/user-attachments/assets/ac604b30-77ce-4ecb-89cc-6077a703832a){: .align-center}

## 1. 📥 NVIDIA 드라이버를 Windows에 설치

> [NVIDIA 드라이버 다운로드 페이지](https://www.nvidia.com/en-us/drivers/)

- 나에게 맞는 드라이버를 선택하여 다운로드 및 설치를 진행한다.
- 설치 후 아래 명령어를 실행하여 캡처한 것처럼 뜬다면 드라이버가 정상적으로 설치된 것이다.

```bash
nvidia-smi
```

![Image](https://github.com/user-attachments/assets/4e4a30ef-5803-476f-a1cf-372d64020099){: .align-center}

## 2. 🔒 WSL2에 CUDA Toolkit 설치를 위한 준비

> ubuntu version을 확인하고 설치해야 한다.

### ubuntu version 확인 및 필수 패키지 설치

```bash
sudo get update
```

```bash
sudo get upgrade
```

```bash
# ubuntu version 확인
lsb_release -a
```

```bash
sudo apt install wget build-essential -y
```

### CUDA keyring 설치

> 키링은 패키지 관리 시스템에서 사용되는 키 관리 도구로, 패키지 저장소 정보를 관리하는 역할을 한다.

- NVIDIA CUDA 키링을 설치하는 이유:
  - 패키지의 신뢰성 검증: NVIDIA에서 제공하는 정품 소프트웨어임을 보장
  - 안전한 업데이트: 인증된 소스에서만 업데이트를 받음
  - 패키지 무결성 확인: 다운로드 과정에서 파일이 변조되지 않았음을 확인

```bash
# 여기서 나에게 맞는 ubuntu version을 선택하여 설치(eg. ubuntu2404)
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
```

## 3. 📦 CUDA 설치

> 여기서 나에게 맞는 CUDA version을 선택하여 설치(eg. cuda-12.1)

```bash
sudo apt install cuda
```

## 4. 🔧 환경변수 설정

### `~/.bashrc`를 수정해야 하는 경우

```bash
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
```

### `~/.zshrc`를 수정해야 하는 경우

```bash
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.zshrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.zshrc
source ~/.zshrc
```

## 5. ✅ 최종 설치 확인

```bash
nvcc --version
```

## 6. 📝 참고 사항

- keyring의 앞으로 쓰지 않을 가능성이 높으므로 삭제한다.

```bash
rm cuda-keyring_1.1-1_all.deb
```
