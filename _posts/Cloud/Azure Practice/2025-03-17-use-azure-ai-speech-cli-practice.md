---
title: "[Azure] Azure Services - AI Speech 사용하기(CLI version)"
date: 2025-03-17 12:00:00 +0900
last_modified_at: 2025-03-17 12:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure services
  - azure portal
  - azure ai speech

toc: true
toc_sticky: true
---

# 🎯 Azure Services - AI Speech 사용하기(CLI version)

> Azure Services에 있는 AI Speech Service를 CLI로 사용해보자.

- *Azure는 많은 기능이 빠르게 변화하고 있으므로 캡처한 이미지는 참고만 하자.*


## 1. 🔧 AI Speech 환경세팅하기

> Azure Resource 중에 AI Speech Service를 사용해보자.

### 1.1 Speech Resource 생성

- Azure Portal에 들어가서 `speech`를 검색하고 아래 표시된 리소스를 생성한다.

![Image](https://github.com/user-attachments/assets/c7d5b3d8-c0bd-42f1-8760-585026cdcf42){: .align-center}

- 필요한 정보를 입력하고 리소스를 생성한다.
  - 나는 아래 보이는 인스턴스 세부 정보 안에 `이름`과 `가격 책정 계층` 부분만 수정하였다.

![Image](https://github.com/user-attachments/assets/a8ffb5f9-5aeb-46d8-9f9f-a3e8e8ab263a){: .align-center}

### 1.2 필요한 패키지 및 .net 설치

> 필요한 패키지를 설치하고 .net 환경세팅을 해보자. [참고](https://learn.microsoft.com/ko-kr/azure/ai-services/speech-service/spx-basics?tabs=windowsinstall%2Cterminal)

- *참고로 현재 실습 기준 Windows에서만 가능하고 .net 6.0 버전을 사용해야 한다.*

#### 1.2.1 재배포 패키지 설치

> [참고](https://learn.microsoft.com/ko-kr/cpp/windows/latest-supported-vc-redist?view=msvc-170)

- Visual Studio 2019용 Microsoft Visual C++ 재배포 가능 패키지를 설치한다.
  - `https://aka.ms/vs/17/release/vc_redist.x64.exe`
- 설치 후 재시작까지 하자.

#### 1.2.2 .net 6.0 설치

> [참고](https://dotnet.microsoft.com/ko-kr/download/dotnet)

- .net 6.0 버전을 설치한다.
- 설치 후 버전을 확인해보자.

![Image](https://github.com/user-attachments/assets/009f4381-3cbc-477e-bcee-618996ecd2ae){: .align-center}

### 1.3 Microsoft Speech CLI 설치

- 아래 명령어로 설치를 진행하자 설치가 완료되면 아래 초록색 메시지가 뜬다.
- `spx` 명령어를 사용할 수 있게 된다.

```bash
dotnet tool install --global Microsoft.CognitiveServices.Speech.CLI
```

![Image](https://github.com/user-attachments/assets/c3fa46f0-345a-46f3-a2ff-0776648a2dfc){: .align-center}

- 설치 후 `spx` 명령어를 확인해보자.

```bash
spx
```

![Image](https://github.com/user-attachments/assets/ae3ee405-d50b-4d1f-a6dd-b757216849cd){: .align-center}

### 1.3.1 spx config 설정

- 아래 명령어를 사용하면 어떤 config가 필요한지 볼 수 있다.
- 당연히 표시된 부분은 예시라서 저 키 값을 입력하면 안된다.

```bash
spx config
```

![Image](https://github.com/user-attachments/assets/23a476e4-9ebd-4bf4-8342-b1ade35deaf5){: .align-center}

- 키 값은 Speech Resource에서 확인할 수 있다.

![Image](https://github.com/user-attachments/assets/a0d2ef89-312c-4655-b1c1-7ca20031ff06){: .align-center}

- 아래 명령어로 키 값을 입력하자.

```bash
spx config @key --set "YOUR_KEY"
```

- region은 Speech Resource의 키 값들 밑에 있으므로 바로 복사해서 쓰자.

```bash
spx config @region --set "YOUR_REGION"
```

## 2. 🎤 음성 인식 실습

> 음성 인식을 실습해보자. 언어 지원의 경우 [언어 및 음성 지원](https://learn.microsoft.com/ko-kr/azure/ai-services/speech-service/language-support?tabs=tts#multilingual-voices)을 참고하자.

### 2.1 음성 인식 실습

```bash
spx help recognize
```

- 아래 명령어로 마이크로폰을 사용해서 음성 인식을 진행할 수 있다.
- 언어 설정을 안하면 기본적으로 영어로 인식한다.

```bash
spx recognize --microphone --language ko-kr
```

![Image](https://github.com/user-attachments/assets/904f4259-7eba-47ff-9872-9fc87bfd6b7d){: .align-center}

### 2.2 음성 파일 인식 실습

- 아래 명령어로 음성 파일을 인식할 수 있다.

```bash
spx recognize --file "YOUR_FILE_PATH" --language ko-kr
# spx recognize --file C:\Users\KGD\Downloads\audio1.wav --language ko-kr
```

![Image](https://github.com/user-attachments/assets/612e3390-a72b-4cee-b760-85b09a3357d7){: .align-center}

### 2.3 음성 합성 실습

```bash
spx help synthesize
```

- 아래 명령어로 음성 합성을 진행할 수 있다.
- 언어 지정을 안해도 바로 잘 발음을 해준다.

```bash
spx synthesize --text "YOUR_TEXT" --speakers --voice "YOUR_VOICE"
# spx synthesize --text "안녕? 반가워!! 너 오늘 컨디션은 어떠하니??" --speakers --voice ko-KR-SunHiNeural
```

### 2.4 음성 번역 실습

```bash
spx help translate
```

```bash
spx translate --source en-US --target ko-KR
```

![Image](https://github.com/user-attachments/assets/930f5cef-801f-4d7b-b8bb-7cd8782b1026){: .align-center}