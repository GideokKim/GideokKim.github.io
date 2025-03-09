---
title: "[Environment Setup] WSL2 환경에서 CUDA 설치하기"
date: 2025-02-05 13:00:00 +0900
last_modified_at: 2025-03-09 18:00:00 +0900
categories: 
  - Environment Setup
tags:
  - environment setup
  - wsl2
  - cuda
  - ubuntu
  - install
toc: true
toc_sticky: true
---

# 🎯 WSL2 환경에서 CUDA 설치하기

> 일반적인 ubuntu 환경에서 설치하는 것과 비슷할 것 같으나 실제 설치한 순서대로 정리해보고자 한다.

- 당연히 NVIDIA 그래픽 카드가 있는 것으로 가정한다.
- 또한, 이 포스트는 모든 명령어를 최신 버전으로 설치한다는 가정하에 작성되었다.

![Image](https://github.com/user-attachments/assets/ac604b30-77ce-4ecb-89cc-6077a703832a){: .align-center}

## 1. 📥 NVIDIA 드라이버를 Windows에 설치

> WSL2에서 사용하지만 Windows 10에 제대로 드라이버가 설치되어 있어야 오동작을 안한다.

> [NVIDIA 드라이버 다운로드 페이지](https://www.nvidia.com/en-us/drivers/)

## 1.1. 드라이버 설치 확인

- 아래 명령어를 실행하여 드라이버가 설치되어 있는지 확인해보자.
- 현재 내 Windows 10에는 드라이버가 설치되어 있지 않다.

```bash
nvidia-smi
```

![Image](https://github.com/user-attachments/assets/cc826df5-dca0-4c3c-b990-764fbdda92d1){: .align-center}

### 1.2. 드라이버 설치

- [NVIDIA 드라이버 다운로드 페이지](https://www.nvidia.com/en-us/drivers/)에 접속하여 자신의 버전에 맞는 드라이버를 설치하자.
  - 나는 노트북에 `GeForce RTX 2070`을 사용하고 있으므로 그 버전에 맞는 드라이버를 설치한다.
- 설치가 끝나면 재부팅을 해주자.

![Image](https://github.com/user-attachments/assets/819e9546-5672-4dc0-9050-2e3e3f656610){: .align-center}

### 1.3. 드라이버 설치 확인

- 재부팅 후 아래 명령어를 실행하여 드라이버가 설치되었는지 확인해보자.
- `nvidia-smi` 명령어를 입력하면 아래와 같이 나오면 NVIDIA 드라이버가 잘 설치되었다는 뜻이다.

```bash
nvidia-smi
```

![Image](https://github.com/user-attachments/assets/6e25f8bf-e7c1-41e3-b7a6-1b4e9d9c14ad){: .align-center}

## 2. 📥 Windows에 CUDA Toolkit 설치

> 이제 드라이버가 설치되었으니 CUDA Toolkit을 설치해보자.

### 2.1. CUDA Toolkit 설치 확인

- 아래 명령어를 실행하여 CUDA Toolkit이 설치되어 있는지 확인해보자.
- 현재 내 Windows 10에는 CUDA Toolkit이 설치되어 있지 않다.

```bash
nvcc --version
```

![Image](https://github.com/user-attachments/assets/cc4c15da-b484-466a-b47b-5c26508d896a){: .align-center}

### 2.2 Visual Studio 설치

- CUDA Toolkit을 설치할 때 빠른 설치로 진행하면 Visual Studio를 요구하는 설치가 포함되어 있다.
- 스스로 어떤 것들을 제외해야할지 모르겠다면 마음 편하게 Visual Studio를 설치하자.

![Image](https://github.com/user-attachments/assets/b7742bda-1535-4467-b276-31fbdfbc1bb1){: .align-center}

### 2.3. CUDA Toolkit 설치
- [CUDA Toolkit 설치 페이지](https://developer.nvidia.com/cuda-downloads)에 접속하여 자신의 버전에 맞는 CUDA를 설치하자.
  - `nvidia-smi` 명령어를 입력하면 아래와 같이 나오는데 여기서 CUDA Version과 동일한 CUDA Toolkit을 설치하면 된다.

```bash
PS C:\Users\KGD> nvidia-smi
Sun Mar  9 14:36:33 2025
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 572.60                 Driver Version: 572.60         CUDA Version: 12.8     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                  Driver-Model | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 2070      WDDM  |   00000000:01:00.0 Off |                  N/A |
| N/A   41C    P0             32W /  115W |       0MiB /   8192MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|  No running processes found                                                             |
+-----------------------------------------------------------------------------------------+
```

- 아래와 같이 CUDA Toolkit 설치 중간에 Visual Studio에 종속된 설치들이 있다.

![Image](https://github.com/user-attachments/assets/af2699e6-41df-402f-848a-29949a9dc04c){: .align-center}

### 2.4. CUDA Toolkit 설치 확인

- 아래 명령어를 실행하여 CUDA Toolkit이 설치되었는지 확인해보자.

```bash
nvcc --version
```

![Image](https://github.com/user-attachments/assets/3097b5d4-c568-4ed8-85a5-9a14423ae352){: .align-center}

## 3. 🔒 WSL2에 CUDA Toolkit 설치를 위한 준비

> ubuntu version을 확인하고 설치해야 한다.

- WSL2에 NVIDIA 드라이버는 설치할 필요가 없다. Windows에 설치한 드라이버로 알아서 설정된다.

### 3.1. ubuntu version 확인 및 필수 패키지 설치

```bash
sudo apt update
```

```bash
sudo apt upgrade
```

```bash
# ubuntu version 확인
lsb_release -a
```

```bash
sudo apt install wget build-essential -y
```

### 3.2. CUDA keyring 설치

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

## 4. 📦 CUDA 설치

> 여기서 나에게 맞는 CUDA version을 선택하여 설치(eg. cuda-12.8)

```bash
sudo apt install cuda
```

## 5. 🔧 환경변수 설정

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

## 6. ✅ 최종 설치 확인

```bash
nvcc --version
```

## 7. 📝 참고 사항

- keyring의 앞으로 쓰지 않을 가능성이 높으므로 삭제한다.

```bash
rm cuda-keyring_1.1-1_all.deb
```
