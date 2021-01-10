#  Hello world



```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,	// 텍스트 기술 순서(left to right)
      ),
    ),
  );
}
```

- 앱 실행하기 위해 `main` 함수에서 `runApp()`호출.
- `runApp()` 함수가 주어진 Widget을 Widget Tree의 루트로 만든다.
  - Root Widget: `Center` widget
  - 하위 Widget: `Text` widget



# StatelessWidget vs StatefulWidget

- 앱 작성시 Widget이 state를 관리하는지 여부에 따라 구분

- `build` method: 화면을 구성하는 UI를 구현하는 method. 즉, 화면이 출력 될 때 `build()`가 호출되면서 내부 UI widget들이 화면에 출력.

  

## StatelessWidget

- 상태를 가지지 않는 위젯 클래스
- 내부 모든 widget은 상태를 가질 수 없으며 상태 변화를 인식할 필요가 없다
- 화면 생성될 때 한번만 `build()` 호출하고 다시 호출되지 않는다
- **`build()` 호출 1번**



## StatefulWidget

- 화면 구성 변경될 수 있는 경우 사용

- StatefulWidget을 상속하는 widget 클래스와 State를 상속하는 상태 클래스 두개로 구성

- `build()`를 StatefulWidget이 아닌 State를 상속하는 상태 클래스에 구성

- 변경된 값이 UI 위젯에 반영하기 위해 `setState` 사용

- **`setState`는 StatefulWidget의 내부 상태 변경할 때 사용되는 method이자 변경된 상태 값을 플랫폼에 전달하여 `build()` 호출**

  


# [참고]

- https://flutter.dev/docs/development/ui/widgets-intro#hello-world
- https://here4you.tistory.com/220