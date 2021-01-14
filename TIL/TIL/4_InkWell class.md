# InkWell class

- 별도의 gesture 기능이 제공되지 않는 위젯에 gesture 기능을 추가하고자 할 때 사용

- touch에 반응하는 직사각형 영역

- Example

  ```dart
  InkWell LoginButton() {
      return InkWell(
          child: Image.asset(...),
          onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpRoute()),
                  );
              }
          });
  }
  ```

  - `GestureDetector`와의 차이점: `InkWell`은 간단한 제스처 기능만 제공하는 반면 `GestureDetector`는 Drag 제스처 등 모든 제스처 기능을 제공한다. 또한 `GestureDetector`는 ink splash 애니메이션을 제공하지 않는다.

  

  

  ## InkResponse

  - https://api.flutter.dev/flutter/material/InkResponse-class.html

  

  





## [참고]

- https://api.flutter.dev/flutter/material/InkWell-class.html