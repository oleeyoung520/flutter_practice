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

2. async, await
2. then




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

- 3초를 기다리지 않고 바로 출력해서 보류 중인 작업을 표시(uncompleted future)

- print 까지 기다리기 위해 then 또는 async, await이 필요

  

### async, await

- Future 작업이 완료될 때까지 실행을 일시 중단하려면 async 함수에서 await를 사용하면 된다.

- await 키워드를 사용하면 비동기 작업의 완성된 결과를 얻을 수 있다. await 키워드는 async function내에서만 작동한다.

- 위의 코드에서 printLongTaskResult를 async 함수로 만들면

  ```dart
  void printLongTaskResult() async {
    var result = await longTask();
    print(result);
  }
  
  // ** print result **
  // one
  // two
  // three
  // long task result
  ```

- async 함수에서 try-catch 사용하여 에러를 잡는다.

  

## then

- future api를 사용하는 방법

- then을 이용해서 위에서 async, await를 사용한 것과 같은 결과를 얻을 수 있다.

- ```dart
  void printLongTaskResult() {
    var result = longTask();
    result.then((value) => {
        print(value)
    });
    // 에러 처리
      result.catchError((e) => {
          print(e.toString())
      });
  }
  ```

- async, await을 쓰는 방법과의 차이점은 then을 쓰면 value 값을 람다 함수 밖에서는 접근하지 못한다.

- 에러를 잡을 때는 catchError를 사용한다.





## [참고]

- https://medium.com/flutter-community/futures-async-await-threading-in-flutter-baeeab1c1fe3
- https://youtu.be/CCMuCvcOfnQ?list=LL

- https://dart.dev/codelabs/async-await
- https://benghak.github.io/2020-01-27-Flutter_week_05_01/


