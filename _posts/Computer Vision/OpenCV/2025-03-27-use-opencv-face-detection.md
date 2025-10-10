---
title: "[OpenCV] OpenCV를 이용한 얼굴 감지"
date: 2025-03-27 13:00:00 +0900
last_modified_at: 2025-03-27 13:00:00 +0900
categories: 
  - OpenCV
tags:
  - opencv
  - face detection
  - haar cascade
  - classifier
  - gradio

toc: true
toc_sticky: true
---

# 🎯 OpenCV를 이용한 얼굴 감지

> OpenCV와 Gradio를 사용하여 실시간 얼굴 감지 애플리케이션을 만들어보자.

## 1. 필요한 라이브러리 임포트

```python
import cv2
import gradio as gr
```

## 2. Haar Cascade 분류기 설정

```python
# Haar Cascade 분류기 경로 설정
cascade_path = cv2.data.haarcascades + 'haarcascade_frontalface_default.xml'
face_cascade = cv2.CascadeClassifier(cascade_path)

# 사용 가능한 Haar Cascade 파일 목록
haarcascade_files = [
    "haarcascade_frontalface_default.xml",
    "haarcascade_eye.xml",
    "haarcascade_eye_tree_eyeglasses.xml",
    "haarcascade_frontalcatface.xml",
    "haarcascade_frontalcatface_extended.xml",
    "haarcascade_frontalface_alt.xml",
    "haarcascade_frontalface_alt2.xml",
    "haarcascade_frontalface_alt_tree.xml",
    "haarcascade_fullbody.xml",
    "haarcascade_lefteye_2splits.xml",
    "haarcascade_license_plate_rus_16stages.xml",
    "haarcascade_lowerbody.xml",
    "haarcascade_profileface.xml",
    "haarcascade_righteye_2splits.xml",
    "haarcascade_russian_plate_number.xml",
    "haarcascade_smile.xml",
    "haarcascade_upperbody.xml"
]
```

## 3. 얼굴 감지 함수 구현

1. 입력 이미지를 BGR 색상 공간으로 변환
2. 그레이스케일로 변환하여 얼굴 감지 수행
3. 감지된 얼굴 영역에 녹색 사각형 표시
4. 출력을 위해 RGB 색상 공간으로 다시 변환

```python
def detect_faces(image):
    # 이미지 불러오기
    image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
    # 그레이스케일로 변환
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # 얼굴 감지 수행
    faces = face_cascade.detectMultiScale(
        gray,
        scaleFactor=1.1,    # 이미지 축소 비율
        minNeighbors=5,     # 최소 이웃 수
        minSize=(30, 30),   # 최소 얼굴 크기
        flags=cv2.CASCADE_SCALE_IMAGE
    )

    # 감지된 얼굴에 사각형 그리기
    for (x, y, w, h) in faces:
        cv2.rectangle(image, (x, y), (x+w, y+h), (0, 255, 0), 2)

    # RGB로 다시 변환
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    return image
```

## 4. Gradio UI 구성

- `gr.Blocks()`: 유연한 UI 레이아웃 구성
- `gr.Row()`: 요소들을 가로로 배치
- `gr.Dropdown()`: Cascade 분류기 선택 메뉴
- `gr.Image()`: 웹캠 입력 및 결과 출력 화면
- `streaming=True`: 실시간 비디오 스트리밍 활성화
- `webcam_input.stream()`: 웹캠 입력을 실시간으로 처리
- `change_cascade()`: 분류기 동적 변경 지원

```python
with gr.Blocks() as demo:
    # 제목 추가
    gr.Markdown("얼굴 검출 모델")

    # UI 요소 배치
    with gr.Row():
        # Cascade 선택 드롭다운
        cascade_name = gr.Dropdown(
            label="Cascade Name",
            choices=haarcascade_files,
            value=haarcascade_files[0]
        )
        # 웹캠 입력
        webcam_input = gr.Image(
            sources="webcam",
            streaming=True,
            mirror_webcam=False
        )
        # 결과 출력
        output_image = gr.Image(streaming=True)

    # 웹캠 스트림 처리 함수
    def detect_face_from_webcam(image):
        return detect_faces(image)
    
    # Cascade 분류기 변경 함수
    def change_cascade(cascade_name):
        global face_cascade
        cascade_path = cv2.data.haarcascades + cascade_name
        face_cascade = cv2.CascadeClassifier(cascade_path)
    
    # 이벤트 핸들러 연결
    webcam_input.stream(
        fn=detect_face_from_webcam,
        inputs=[webcam_input],
        outputs=[output_image]
    )
    cascade_name.change(
        fn=change_cascade,
        inputs=[cascade_name],
        outputs=[]
    )

# 애플리케이션 실행
demo.launch(share=True)
```

## 5. 참고 자료

1. [OpenCV 공식 문서](https://docs.opencv.org/4.x/db/d28/tutorial_cascade_classifier.html)
2. [Gradio 공식 문서](https://www.gradio.app/docs/)
3. [OpenCV 얼굴 감지 예제](https://github.com/opencv/opencv/tree/master/data/haarcascades)
