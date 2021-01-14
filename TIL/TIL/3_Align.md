# Align

- child widget이 parent widget 어디에 위치할 것인지 명시하는 방법
- Align은 parent widget의 한정 구역 내에 위젯을 위치시킬 수 있도록 한다.



## alignment property

- 수직, 수평의 배열 위치를 정하는 value

- Alignment로 -1.0 ~ 1.0에 해당되는 정렬 값을 통해 원하는 위치에 배열시킬 수 있다(왼쪽 ~ 오른쪽, 위쪽 ~ 아래쪽). center point가 (0, 0)

- Example

  <img src="https://flutter.github.io/assets-for-api-docs/assets/widgets/align_alignment.png" alt="A blue square container with the Flutter logo positioned according to the Alignment specified above. A point is marked at the center of the container for the origin of the Alignment coordinate system." style="zoom: 67%;" />

  ```dart
  Container(
      child: Align(
          alignment: Alignment(-0.75, 0.6),	// (width, height)
        	child: FlutterLogo(...),
      )
  );
  ```

  

- Alignment 대신에 FractionalOffset class를 사용하면 (0, 0) 좌표가 center가 아니라 왼쪽 위가 된다.

  <img src="https://flutter.github.io/assets-for-api-docs/assets/widgets/align_fractional_offset.png" alt="A blue square container with the Flutter logo positioned according to the FractionalOffset specified above. A point is marked at the top left corner of the container for the origin of the FractionalOffset coordinate system." style="zoom:67%;" />

  ```dart
  Container(
      child: Align(
          alignment: FractionalOffset(0.2, 0.6),
          child: FlutterLogo(...),
      ),
    )
  ```

  



- Center는 alignment가 항상 Alignment.center인 Align Class와 같다.