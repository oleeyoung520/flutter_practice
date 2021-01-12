# Dart_Asynchronous_programming:: Future, async, await



## Async Programming

- 요청한 작업이 결과를 기다리지 않고 바로 다음 작업으로 넘어감으로써 실행을 멈추지 않는다

- File IO나 http 통신 등 CPU 속도보다 느린 작업을 기다리지 않기 위해서 필요하다

- Dart에서의 작업

  - Dart는 단일 thread에서 실행
  - disk IO나 http request 등 느린 작업이 발생하면 그 작업을 끝나는 것을 알려주는 Listener 생성. 작업이 완료되면 alert.
  - 기다리던 작업이 진행되는 동안 main thread는 다른 일 계속 진행
  - 기다리던 작업이 끝나면 event loop는 이것을 확인하고 연결된 method를 main thread에 올리고 작업을 마무리

- Dart에서 Listener가 `Future`

  

  

## Future

- Future는 비동기 처리를 위한 API
- 총 3가지 상태
  1. Uncompleted: 아직 처리가 끝나지 않은 상태
  2. Completed with Data: 처리가 끝나고 Data를 얻은 상태
  3. Completed with Error: 처리가 끝났으나 결과가 Error인 상태

![img](https://blog.kakaocdn.net/dn/lyHIP/btqBsGLyWJD/iMZDPncmSJXYT4EWFSKw10/img.png)

- 흔히들 선물상자에 비유해서 http 통신에 있어서 (1) 아직 request가 도착하지 않은 상태라면 선물상자가 열리지 않은 것이고, (2) 통신이 완료되었고 원하는 데이터릴 얻은 상태는 선물 상자를 열 수 있고 그 결과가 data인 것, (3) 선물 상자르 열었지만 Error인 상태로 표현하는 듯





## Future에서 결과값을 가져오는 방법

1. then

2. async, await




- 위의 두 방법을 사용하지 않을 경우

```dart
import 'dart:async';

Future<String> longTask() {
  return Future.delayed(Duration(seconds: 3), () => "long task result");
}

void printLongTaskResult() {
  var result = longTask();
  print(result);
}

void main() {
  printLongTaskResult();
  print('one');
  print('two');
  print('three');
}

// ** print result **
// Instance of 'Future<String>'
// one
// two
// three

```

- 3초를 기다리지 않고 바로 출력해서 올바른 결과를 얻지 못함

- print 까지 기다리기 위해 then 또는 async, await이 필요

  

### then









### async, await

> - future가 완료될 때까지 실행을 일시 중단하려면 async 함수에서 await을 사용하면 된다.
> - async 함수에서 try-catch 사용하여 에러를 잡는다.
> - 코드를 동시에 실행하려면 isolate를 만든다.









## cf) 참고자료

- https://medium.com/flutter-community/futures-async-await-threading-in-flutter-baeeab1c1fe3
- https://youtu.be/CCMuCvcOfnQ?list=LL

- https://dart.dev/codelabs/async-await
- https://puzzleleaf.tistory.com/216

- https://benghak.github.io/2020-01-27-Flutter_week_05_01/

- https://chopby.tistory.com/45

