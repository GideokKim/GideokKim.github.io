---
title: "Git Commit Convention 정리"
date: 2025-05-24 16:00:00 +0900
last_modified_at: 2025-05-24 16:00:00 +0900
categories:
  - Git
tags:
  - git
  - commit
  - convention
  - best practice

toc: true
toc_sticky: true
---

# ⚡ Git Commit Convention 정리

> Git commit convention은 일관된 커밋 메시지 형식을 통해 프로젝트의 변경 이력을 더 쉽게 이해하고 관리할 수 있도록 도와준다.

## 1. 📝 Commit Message 구조

커밋 메시지는 크게 세 부분으로 구성된다:

```
<header>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

- **header**: 필수 항목으로, 커밋의 유형과 제목을 포함한다.
- **body**: docs 타입을 제외한 모든 커밋에 필수이며, 최소 20자 이상이어야 한다.
- **footer**: 선택 항목으로, 이슈 참조나 사용법 등을 포함한다.

## 2. 🏷️ Commit Message Header

```
<type>(<scope>): <summary>
```

### Type

커밋의 유형을 나타내며, 다음 중 하나를 사용한다:

| Type | Description |
|------|-------------|
| **build** | 빌드 시스템이나 외부 종속성에 영향을 주는 변경사항 |
| **chore** | 빌드 프로세스나 보조 도구 및 라이브러리 변경 |
| **ci** | CI 설정 파일 및 스크립트 변경 |
| **docs** | 문서만 변경 |
| **feat** | 새로운 기능 추가 |
| **fix** | 버그 수정 |
| **perf** | 성능 개선 |
| **refac** | 코드 리팩토링 |
| **style** | 코드의 의미에 영향을 주지 않는 변경 (포맷팅, 세미콜론 누락 등) |
| **test** | 테스트 코드 추가 또는 수정 |

### Scope

커밋이 영향을 미치는 범위를 지정한다. 예시:
- base
- benchmark
- build
- device
- examples
- node

### Summary

- 현재형으로 작성한다.
- 첫 글자는 대문자로 시작하지 않는다.
- 마지막에 마침표를 사용하지 않는다.
- 80자 이내로 작성한다.

## 3. 📄 Commit Message Body

- 현재형으로 작성한다 ("fix" not "fixed" nor "fixes").
- 변경 사항의 동기와 이전 동작과의 차이점을 설명한다.
- 80자 이내로 작성한다.

## 4. 📌 Commit Message Footer

선택적으로 다음 정보를 포함할 수 있다:

```
USAGE: <usage summary>

<usage description + instruction example>

See #<reference>

Resolves|Related #<issue number>
```

## 5. ✨ Commit Message 예시

### 간단한 리팩토링
```
refac: remove custom matrix multiplication

Since we now use BLAS for all matrix operations, our custom matrix
multiplication implementation is redundant. Additionally, the test cases
have been updated to use BLAS operations.

Resolves: #36332
```

### 문서 변경
```
docs: update commit message format
```

### 버그 수정
```
fix(solver): use relative error for convergence check

The Newton-Raphson method must use relative error for convergence check.
But, by mistake, it was using absolute error. This caused premature
termination in some cases.
```

### 새로운 기능 (Breaking Change)
```
feat!: implement sparse matrix solver

BREAKING CHANGE: Previously, all matrices were stored in dense format.
Now we use Compressed Sparse Row (CSR) format for better memory
efficiency. This affects all matrix operations and solver interfaces.

See belows for details.

- https://docs.scipy.org/doc/scipy/reference/sparse.html
- https://github.com/scipy/scipy/pull/188
```

### 추가 예시들

#### 선형대수 관련
```
feat(linear_algebra): implement QR decomposition

Add QR decomposition using Householder reflections. This provides a
more stable alternative to LU decomposition for solving least squares
problems.

See #456 for benchmark results.
```

#### 최적화 관련
```
fix(optimization): correct gradient computation in BFGS

The gradient computation in BFGS was missing a scaling factor, which
led to suboptimal convergence rates. This fix improves convergence
speed by 30% on average.

Resolves: #789
```

#### 상미분방정식 관련
```
feat(ode): add adaptive step size control

Implement adaptive step size control for Runge-Kutta methods. This
improves accuracy while maintaining computational efficiency for
stiff ODEs.

USAGE: Set adaptive=true in solver options to enable
```

#### 편미분방정식 관련
```
fix(pde): handle boundary conditions in finite difference

The finite difference solver was not properly handling Neumann
boundary conditions. This fix ensures correct gradient computation
at domain boundaries.

Resolves: #234
```

#### 보간법 관련
```
perf(interpolation): optimize spline evaluation

Replace the current O(n) spline evaluation with a more efficient
O(log n) algorithm using binary search for knot intervals.

See #567 for performance benchmarks.
```

#### 수치적분 관련
```
feat(integration): implement adaptive quadrature

Add adaptive quadrature using Gauss-Kronrod rules. This provides
better accuracy for integrands with varying behavior across the
integration domain.

USAGE: Set method='adaptive' in quad() function
```

## 6. 💡 Commit Message 작성 팁

1. **명확성**: 커밋 메시지는 변경 사항을 명확하게 설명해야 한다.
2. **일관성**: 팀 내에서 동일한 형식과 규칙을 따른다.
3. **간결성**: 불필요한 정보는 제외하고 핵심적인 내용만 포함한다.
4. **참조**: 관련된 이슈나 PR이 있다면 반드시 참조한다.

## 7. 🔗 Reference

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Angular Commit Message Guidelines](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit)
