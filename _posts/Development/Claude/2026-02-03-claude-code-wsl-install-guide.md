---
title: "[Claude] Windows에서 Claude Code 구축하기 - WSL2 vs Git Bash"
date: 2026-02-03 11:00:00 +0900
last_modified_at: 2026-02-03 11:00:00 +0900
categories:
  - Claude
tags:
  - claude code
  - wsl
  - wsl2
  - windows
  - git bash
  - 개발도구
  - AI
  - cursor
  - vscode

toc: true
toc_sticky: true
---

## intro

AI 코딩 도구가 하루가 다르게 바뀌는 요즘, Cursor랑 Antigravity 같은 것들도 쓰고 있는데 지금은 Claude Code를 가장 많이 쓰려고 한다. 커뮤니티가 크고 정보가 많아서 매일 새로운 쓰임새가 나오는 게 좋다. Claude Max 요금이 부담되긴 하는데, 한 달 정도 커뮤니티를 지켜보고 지금부터 써보면서 정리하려 한다. 이 글에서는 Windows에서 Claude Code 쓰려면 WSL2랑 Git Bash 중 뭘 쓰는 게 나은지부터 정리한다.

## 1. 📋 Windows에서 Claude Code 구축 개요

> **Claude Code는 Windows 10 1809+ / Windows Server 2019+에서 실행 가능하다.** WSL 또는 Git for Windows와 함께 사용할 수 있으며, **두 가지 방식** 중에서 선택하면 된다.

Claude Code는 AI 기반 코딩 도구로, 터미널에서 명령어를 통해 사용한다. Windows에서는 **PowerShell이나 CMD에서 직접 실행되지 않고**, WSL 또는 Git Bash 환경이 필요하다. 아래 두 가지 방식 중 상황과 선호에 맞는 것을 선택하면 된다.

### 1.1. 🎯 두 가지 실행 방식 비교

| 구분 | WSL2 방식 | Git Bash 방식 |
| ---- | --------- | ------------- |
| 안정성 | ✅ 더 안정적 | ✅ 사용 가능 |
| 성능 | ✅ Linux 네이티브 환경으로 우수 | WSL 오버헤드 없음 |
| 설정 난이도 | WSL2 설치 필요 | Git for Windows만 설치 |
| 권장도 | ⭐ 권장 | WSL 없이 간단히 사용할 때 |

- **WSL2**: 더 안정적이고 성능이 좋아 대부분의 경우 권장된다.
- **Git Bash**: 설정이 더 단순하고, WSL 오버헤드 없이 사용할 수 있다.

## 2. 🛠️ Claude Code 설치 방법

### 2.1. 💻 방식 1: WSL2 (권장)

WSL2를 [설치]({{ site.url }}{{ site.baseurl }}/environment-setup/wsl-install/)한 뒤, WSL 터미널에서 아래 명령어로 Claude Code를 설치한다.

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/01.png){: .align-center}

**zsh 사용자**: 기본 셸이 zsh여도 그대로 사용해도 된다. `| bash` 때문에 스크립트가 bash로 실행되며, 공식 문서에서도 Bash와 Zsh 모두 지원한다고 명시되어 있다.

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/02.png){: .align-center}

설치가 완료되면 `claude doctor`로 설치 상태를 확인할 수 있다.

```bash
claude doctor
```

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/03.png){: .align-center}

설치와 확인이 끝나면 프로젝트 디렉토리에서 `claude`를 실행하면 된다.

### 2.2. 💻 방식 2: Git Bash (네이티브 Windows)

WSL 없이 사용하려면 **Git for Windows**를 설치한 뒤, Git Bash에서 Claude Code를 실행한다.

1. [Git for Windows](https://git-scm.com/downloads/win) 다운로드 및 설치
1. Git Bash를 열고 아래 명령어로 Claude Code 설치

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

1. 설치 후 프로젝트 디렉토리에서 `claude` 실행

```bash
cd your-awesome-project
claude
```

**참고**: 휴대용(Portable) Git을 사용하는 경우, Git Bash 경로를 환경 변수로 지정해야 할 수 있다.

```powershell
$env:CLAUDE_CODE_GIT_BASH_PATH="C:\Program Files\Git\bin\bash.exe"
```

### 2.3. 💻 VS Code, Antigravity 또는 Cursor (선택)

코드 편집이 필요하다면 Windows에 에디터를 설치해 두는 것이 좋다. Claude Code는 WSL 터미널 또는 Git Bash에서 실행하고, 에디터는 Windows에서 사용하는 방식으로 함께 활용할 수 있다. 아래 링크에서 Windows용 설치 파일을 다운로드할 수 있다.

- [VS Code 다운로드](https://code.visualstudio.com/download)
- [Antigravity 다운로드](https://antigravity.google/download)
- [Cursor 다운로드](https://cursor.com/downloads)

#### 사용 흐름

1. Windows에 VS Code, Antigravity 또는 Cursor 설치
1. WSL 터미널 또는 Git Bash를 열고 프로젝트 디렉토리로 이동한 뒤 `claude` 실행
1. 에디터와 터미널을 함께 사용하며 작업

```bash
cd your-awesome-project
claude
```

나는 이전까지 Cursor를 주로 쓰고 있었어서 Cursor IDE에서 한 번 실행해보았다.

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/04.png){: .align-center}

### 2.4. 🖥️ Windows Terminal (선택)

WSL 터미널 접근을 편하게 하려면 Windows Terminal 설치를 권장한다. PowerShell보다 나은 터미널 경험을 제공한다. Windows PowerShell에서 아래 명령어로 설치할 수 있다.

```powershell
winget install Microsoft.WindowsTerminal
```

## 3. 📝 Claude Code 사용법

### 3.1. ⚙️ 초기 세팅

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/05.png){: .align-center}

처음 시작하면 위와 같은 화면이 뜨면서 초기 세팅이 진행된다.

> 다크모드 설정

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/06.png){: .align-center}

나는 기본으로 다크모드를 선택했다.

> login 방법 설정

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/07.png){: .align-center}

나는 아직 API Key 가반의 요금 지불이 아니고 Max 요금제 구독이라 1번으로 했다.

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/08.png){: .align-center}

이후 로그인을 위한 링크가 터미널에서 뜨는데, 그걸 복사해서 Chrome 같은 브라우저에 붙여넣으면 로그인이 된다. 위 화면은 링크를 복사해서 넣었을 때 보이는 화면이다.

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/09.png){: .align-center}

승인하면 코드가 보이는데, 그 코드를 복사해서 원래 세팅하던 터미널(Paste code here if prompted)에 넣어주면 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/10.png){: .align-center}

이후 터미널 세팅이나 작업 폴더를 믿을 것인지 등이 뜨는데, 1번으로 전부 선택해주면 된다.

![Image]({{ site.url }}{{ site.baseurl }}/images/development/claude/2026-02-03-claude-code-wsl-install-guide/11.png){: .align-center}

완전히 세팅이 끝나면 뜨는 화면이다.

## 4. 🎯 Claude Code 구축 정리

| 구분 | 설치 위치 | 비고 |
| ---- | --------- | ---- |
| Claude Code | WSL 또는 Git Bash | 필수. 두 방식 중 선택 |
| VS Code / Antigravity / Cursor | Windows | 선택. 편집용 에디터 |
| Windows Terminal | Windows | 선택. 터미널 사용 편의 |

**결론적으로**, WSL2 또는 Git Bash 중 하나를 선택해 Claude Code를 설치하고, 필요 시 Windows에 에디터(VS Code, Antigravity, Cursor 등)만 추가하면 된다. WSL2가 더 안정적이고 성능이 좋아 대부분 권장되며, WSL 없이 간단히 쓰고 싶다면 Git Bash 방식을 선택하면 된다.

---

**참고 자료**

- [Claude Code 공식 문서 - Set up Claude Code](https://code.claude.com/docs/en/setup)
