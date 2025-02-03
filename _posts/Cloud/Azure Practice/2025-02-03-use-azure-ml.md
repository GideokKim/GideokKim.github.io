---
title: "[Azure] Azure Machine Learning 리소스 사용하기"
date: 2025-02-03 11:00:00 +0900
last_modified_at: 2025-02-03 11:00:00 +0900
categories: 
  - Azure
tags:
  - azure
  - azure ml
  - azure ml studio
  - azure ml compute
  - azure ml notebook

toc: true
toc_sticky: true
---

# 🎯 Azure Machine Learning 리소스 사용하기

> 이전 포스트에서 만든 `Azure Machine Learning` 리소스를 사용해서 `Compute` 생성 및 `Notebook`을 사용해본다.

## 1. Azure Machine Learning Studio 접속

- 아래 그림에서 `Launch Studio` 클릭

![Image](https://github.com/user-attachments/assets/6af125a6-00e7-4708-9fb3-411ea75d1632)

- `Notebooks` 클릭
  - 따로 준비해둔 파이썬 코드가 있어 테스트를 위해 바로 업로드 후 실행한다.

![Image](https://github.com/user-attachments/assets/9b02ea74-96af-45a6-8570-0e1baf3e8baf)

- `Files` 클릭 후 `Upload folder` 클릭

![Image](https://github.com/user-attachments/assets/b3f0fc73-af70-47db-938f-845760682bdd)

- 파일 업로드 진행

![Image](https://github.com/user-attachments/assets/61152394-e52d-4b6f-a6af-73c47ed3bf0c)

- 파일 업로드가 완료되면 아래처럼 내가 업로드한 폴더가 보인다.

![Image](https://github.com/user-attachments/assets/2ac974f2-3713-4201-bb08-363036313174)

## 2. Compute 생성

- `Compute`에 들어가서 `New` 클릭

![Image](https://github.com/user-attachments/assets/2966b252-d052-4573-9e09-6e9f85bb104d)

- `Compute name` 입력 후 원하는 하드웨어 리소스 선택 그리고 `Review + create` 클릭
  - `Compute name`에 문자열입력시 시작이 숫자가 될 수 없다.
  - 하드웨어 리소스는 `Available quota`가 존재해아 사용가능하다.

![Image](https://github.com/user-attachments/assets/772d8a69-9b92-4ffc-aaa3-630a7244dc2f)

- 생성이 좀 오래 걸릴 수 있고 트래픽이 몰리면 생성이 안될 수 있지만 다시 시도하면 된다.

## 3. 코드 실행

- 다시 `Notebooks`로 와서 업로드한 파이썬 코드를 실행한다.
- Compute를 방금 생성한 것으로 선택하고 `Run` 클릭
- Jupyter Notebook과 동일하게 아래에 결과가 보인다.

![Image](https://github.com/user-attachments/assets/9e137d44-283e-4853-b283-d7fd318fccfb)
