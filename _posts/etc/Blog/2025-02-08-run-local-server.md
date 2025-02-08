---
title: "[Github Blog] 로컬 서버에서 내 블로그 실행하기"
date: 2025-02-08 20:30:00 +0900
last_modified_at: 2025-02-08 20:30:00 +0900
categories:
  - Blog
tags:
  - Github Blog
  - minimal-mistakes
  - local server
  - jekyll
  - bundler
  - ruby
  - windows
  - ubuntu

toc: true
toc_sticky: true
---

# 1. 🔄 default branch 이름 및 저장소 이름 변경하기

> Github 웹 페이지에서 변경할 수 있다.

## default branch 이름 변경하기

> Settings 탭에 들어가서 default branch를 `main`으로 변경한다. 그대로 사용해도 되지만 `master` branch는 부정적인 의미를 가지고 있기 때문에 `main`으로 변경한다.

![Image](https://github.com/user-attachments/assets/2e0afa55-01fd-433a-b658-9ff20bc84251){: .align-center}

## 저장소 이름 변경하기

> 마찬가지로 Settings 탭에 들어가서 저장소 이름을 변경한다. 나의 GitHub 아이디가 `GideokKim`이기 때문에 `GideokKim.github.io`로 변경한다.

- 나는 이미 동일한 이름의 최초 블로그가 있기 때문에 변경할 수 없다고 뜨지만 이미 사용하는 이름이 아니라면 변경할 수 있다.
- 나는 블로그 정리가 끝나면 지금 작업하는 저장소로 변경할 예정이다.
  - 지금은 `new_GideokKim.github.io`로 변경해두었다.

![Image](https://github.com/user-attachments/assets/609e1548-b3c1-4624-afc9-0b71dc688779){: .align-center}

# 2. 🗑️ 저장소의 불필요한 파일 삭제하기

> 이제 불필요한 파일을 삭제하고 저장소를 정리해보자.

- 우선 로컬에 저장소를 클론한다.

```bash
git clone git@github.com:GideokKim/new_GideokKim.github.io.git
```

- `minimal-mistakes`에서 삭제를 추천한 파일들 이외에 추가적으로 더 삭제를 한다.
  - 추가 삭제 파일: `.travis.yml`, `staticman.yml`
  - 두 파일 전부 블로그 운영에 필요한 파일이 아니기 때문에 삭제한다.

![Image](https://github.com/user-attachments/assets/34e2872e-b1b6-4e9c-81e7-27afb1dae218){: .align-center}

# 3. 🌐 로컬 서버 실행

> 로컬 서버를 실행하기 위해서 필요한 것들을 설치하고 수정을 해보자.

## `Gemfile` 수정

> 먼저 아래와 같이 수정해둬야 로컬 서버를 실행했을 때 정상적으로 작동한다.

```bash
source "https://rubygems.org"

gem "github-pages", group: :jekyll_plugins
gem "jekyll-include-cache", group: :jekyll_plugins
```

## Ruby 설치

> 이후에 Jekyll를 설치할 예정인데, Jellky는 Ruby로 만들어졌으므로 미리 설치가 필요하다.

### Windows 환경

- RubyInstaller 다운로드
  - `https://rubyinstaller.org/downloads/` 에서 WITH DEVKIT 버전 다운로드
- 다운로드한 인스톨러 실행
  - "Add Ruby executables to your PATH" 체크
  - "Associate .rb and .rbw files with this Ruby installation" 체크

```bash
ruby -v
gem -v
```

### WSL2 환경(Ubuntu)

```bash
# 1. 시스템 업데이트
sudo apt update
sudo apt upgrade

# 2. 필요한 의존성 설치
sudo apt install -y curl gnupg2 dirmngr

# 3. RVM(Ruby Version Manager) 설치
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

# 4. RVM 소스 적용
source ~/.rvm/scripts/rvm

# 5. Ruby 설치
rvm install ruby

# 6. 설치 확인
ruby -v
gem -v
```

## Jekyll 및 Bundler 설치

### Windows 환경

```bash
# 1. Jekyll과 Bundler 설치
gem install jekyll bundler

# 2. 필수 의존성 설치
gem install webrick

# 3. 설치 확인
jekyll -v
bundler -v
```

### WSL2 환경(Ubuntu)

```bash
# 1. 필요한 의존성 설치
sudo apt install ruby-full build-essential zlib1g-dev

# 2. Ruby Gems 환경 설정 (사용자 계정에 설치)
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 3. Jekyll과 Bundler 설치
gem install jekyll bundler

# 4. 설치 확인
jekyll -v
bundler -v
```

## 로컬 서버 실행

> 이제 로컬 서버를 실행할 준비가 되었다. 아래 명령어를 입력해보자.

```bash
bundle exec jekyll serve
```

- 로컬 서버가 실행되면 아래와 같은 메시지가 출력된다.

![Image](https://github.com/user-attachments/assets/82099f55-e4df-4175-aa27-957f44baf753){: .align-center}

- 이제 브라우저에서 `http://localhost:4000`으로 이동하면 로컬 서버가 실행된 것을 확인할 수 있다.
  - 터미널에서 `http://localhost:4000`를 `ctrl + click` 하면 브라우저에서 열린다.
- 완전 기본 사이트가 열릴 것이다.

![Image](https://github.com/user-attachments/assets/81e09305-a115-4f8f-9083-a60aeb8e7902){: .align-center}

---

# 4. 📝 정리

> 위 단계들을 모두 수행했다면 이제 로컬 서버에서 내 블로그를 미리 확인할 수 있는 상태가 되었다. 다음에는 블로그 테마를 한 번 바꾸는 작업을 해보자!

# 5. 🔗 Reference

- [minimal-mistakes - Quick-Start Guide](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/)
