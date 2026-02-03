---
title: "[CRUD] Flask로 기본적인 CRUD 구현하기"
date: 2025-04-21 10:00:00 +0900
last_modified_at: 2025-04-21 10:00:00 +0900
categories: 
  - Web Development
tags:
  - CRUD
  - Flask

toc: true
toc_sticky: true
---

# 🎯 CRUD 소개

> CRUD는 데이터베이스에서 데이터를 생성(Create), 조회(Read), 수정(Update), 삭제(Delete)하기 위한 기본적인 기능을 의미한다. CRUD에 대해 이해하는 것을 목표로 한다.

## 1. ✨ CRUD란

- SW 개발에서 데이터 관리 및 조작에 수행되는 4가지 필수 작업을 나타낸다.
- 이 작업은 데이터베이스 또는 데이터 스토리지 시스템과 상호 작용하는 대부분의 애플리케이션 중추를 형성한다.

| 작업 | 설명 |
| --- | --- |
| Create | 데이터를 생성하는 작업 |
| Read | 데이터를 조회하는 작업 |
| Update | 데이터를 수정하는 작업 |
| Delete | 데이터를 삭제하는 작업 |


## 2. 💡 CRUD의 이점

> SW 개발에서 CRUD 작업의 이점은 다양하며 애플리케이션의 효율성, 유지 관리 및 사용자 경험 등에 중요한 역할을 한다.

1. `표준화`: CRUD 작업은 데이터 스토리지 시스템과 상호 작용하기 위한 공통 프레임워크를 설정하여 개발자가 다양한 애플리케이션 및 플랫폼을 쉽게 이해하고 작업할 수 있도록 한다.
2. `단순화된 개발 프로세스`: CRUD 모델을 고수함으로써 개발자는 데이터 조작을 위해 구현할 명확한 작업 세트가 있으므로 애플리케이션 작성 프로세스를 간소화할 수 있다. 이는 일관되고 효율적인 개발 관행을 촉진한다.
3. `향상된 유지 관리`: CRUD 기반 응용 프로그램은 일반적으로 데이터 관리에 대한 표준화된 접근 방식을 따르기 때문에 유지 관리가 더 쉬워진다. 이를 통해 개발자는 필요에 따라 애플리케이션의 문제를 해결하고 업데이트 하는 것이 더 간단해진다.
4. `향상된 사용자 경험`: CRUD 작업을 구현하면 사용자가 애플리케이션 내에서 데이터 생성, 읽기, 업데이트 및 삭제와 같은 필수 작업을 원활하게 수행할 수 있다. 그 결과 직관적이고 만족스러운 사용자 경험이 제공된다.
5. `모듈성과 유연성`: CRUD로 애플리케이션에서 관심사를 분리하면 모듈성과 유연성을 향상시킬 수 있다. 이는 개발자가 전체 시스템에 영향을 주지 않고 특정 응용 프로그램 부분을 쉽게 수정하거나 확장할 수 있다.
6. `확장성`: CRUD 모델에 따라 응용 프로그램은 증가하는 데이터 또는 사용자 요구를 수용하기 위해 보다 쉽게 확장할 수 있다. 데이터 관리에 대한 표준화된 접근 방식을 통해 개발자는 성능을 최적화하고 애플리케이션이 증가된 워크로드를 처리할 수 있도록 한다.
7. `다양한 기술과의 호환성`: CRUD 작업은 관계형 데이터베이스, NoSQL 데이터베이스, RESTful API 및 GraphQL 등 다양한 기술에 적용할 수 있다. 이러한 다양성으로 인해 개발자는 CRUD 기반 시스템을 다양한 기술 스택에 채택하고 통합하기 더 쉬워진다.

## 3. 📝 Python에서 CRUD 구현

> Python에서 CRUD 작업을 구현하는 방법을 알아보자. 주요 프레임워크는 아래와 같다.

| 프레임워크 | 설명 | 특징 | 사용 사례 |
| --- | --- | --- | --- |
| Django | Python 웹 프레임워크 | - 풀 스택 프레임워크로, 관리자 인터페이스, ORM, 폼 처리 등 다양한 기능을 제공합니다.<br>- 배터리 포함(Batteries included) 철학을 따르며, 많은 기능이 내장되어 있습니다.<br>- 보안 기능이 강력하며, SQL 인젝션, XSS 등의 공격을 방지합니다. | - 대규모 웹 애플리케이션<br>- 관리자 인터페이스가 필요한 프로젝트<br>- 데이터베이스 중심의 애플리케이션 |
| Flask | Python 웹 프레임워크 | - 마이크로 프레임워크로, 최소한의 기능만 제공합니다.<br>- 확장성이 높으며, 필요한 기능을 플러그인 형태로 추가할 수 있습니다.<br>- 가볍고 빠른 개발이 가능합니다. | - 소규모 웹 애플리케이션<br>- API 서버<br>- 프로토타입 개발 |
| FastAPI | Python 웹 프레임워크 | - 현대적인 웹 API를 위한 프레임워크로, 빠른 성능을 제공합니다.<br>- 자동 문서화 기능을 지원하며, OpenAPI와 JSON Schema를 활용합니다.<br>- 비동기 프로그래밍을 지원하여 높은 성능을 제공합니다. | - 고성능 API 서버<br>- 마이크로서비스<br>- 실시간 애플리케이션 |

## 4. 📝 Flask 예제

> Flask로 기본적인 CRUD 구현을 해보자.

### 4.1. 프로젝트 설정

```bash
pip install Flask
```

- 기본 폴더 구조는 아래와 같다.
  - `view directory`: 뷰 함수가 정의된 디렉토리(화면 구성)
  - `static directory`: 정적 파일 저장 디렉토리(CSS, JS, 이미지 등)
  - `templates directory`: HTML 파일 저장 디렉토리
  - `__init__.py`: 프로젝트 초기화 및 라우팅 설정
  - `models.py`: 데이터베이스 모델 정의
  - `forms.py`: 서버로 전송되는 폼 정의
  - `config.py`: 설정 파일

```bash
flask-crud/
├── myapp/
│   ├── static/
│   ├── templates/
│   ├── views/
│   ├── __init__.py
│   ├── models.py
│   └── forms.py
└── config.py
```

### 4.2. 코드 예시

- 아래 코드를 작성하고서 실행하면 홈페이지에서 확인할 수 있다.
- 실행은 `flask run` 명령어를 사용한다.

```python
# myapp/__init__.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello, Flask!'
```

## 5. 📝 심화 개념

### 5.1. 라우팅 개념

> 라우팅은 URL과 함수를 연결하는 과정이다. Flask에서는 `@app.route()` 데코레이터를 사용하여 URL과 함수를 연결한다.

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello, World!'

@app.route('/user/<username>')
def show_user(username):
    return f'User: {username}'

if __name__ == '__main__':
    app.run()
```

- **기본 라우팅**: `@app.route('/')`는 루트 URL('/')에 접근했을 때 실행될 함수를 지정한다.
- **동적 라우팅**: `@app.route('/user/<username>')`와 같이 URL에 변수를 포함시킬 수 있다. 이 경우 `<username>` 부분이 함수의 매개변수로 전달된다.
- **HTTP 메서드**: `@app.route('/login', methods=['GET', 'POST'])`와 같이 특정 HTTP 메서드만 허용할 수 있다.

### 5.2. 블루프린트(Blueprint)

> 블루프린트는 Flask 애플리케이션을 모듈화하고 확장 가능하게 만드는 방법이다. 여러 개의 작은 애플리케이션을 하나의 큰 애플리케이션으로 구성할 수 있다.

- 간단하게 라우팅을 블루프린트가 처리하는 것으로 보면 된다.

```python
# views/main_view.py
from flask import Blueprint

bp = Blueprint('main', __name__, url_prefix='/')

@bp.route('/')
def index():
    return 'Hello, Flask!'
```

```python
# myapp/__init__.py
from flask import Flask
from .views import main_view

app = Flask(__name__)
app.register_blueprint(main_view.bp)
```

- **모듈화**: 각 기능별로 블루프린트를 분리하여 코드를 체계적으로 관리할 수 있다.
- **URL 접두사**: `url_prefix`를 사용하여 블루프린트의 모든 라우트에 공통된 URL 접두사를 추가할 수 있다.
- **템플릿 네임스페이스**: 블루프린트별로 템플릿을 분리하여 관리할 수 있다.
- **정적 파일**: 블루프린트별로 정적 파일을 관리할 수 있다.
