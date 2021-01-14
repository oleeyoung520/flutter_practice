



#  Dart 기본 문법



## 1. 변수 선언

- `var`를 사용하여 선언: 타입 추론 지원(컴파일러가 변수의 타입을 스스로 찾아낼  수 있도록 하는 기능)

- `dynamic`: 하나의 변수에 여러 타입의 변경이 필요한 경우

  

## 2. 접근 지정자

- java와 마찬가지로 `_` 기호를 사용하면 private 키워드를 붙인 것처럼 된다

  

## 3. Named Parameter

- 함수 정의할 때 `{}`로 감싼 매개변수

- 선택적으로 사용할 수 있음

- ```Dart
  static InputDecoration textFieldStyle(String labelTextStr, {String hintTextStr}) {
      return InputDecoration(
          labelText: labelTextStr,
          hintText: hintTextStr
          );
  }
  
  // Example
  TextField(decoration: textFieldStyle('ID'));
  TextField(decoration: textFieldStyle('Password', '비밀번호'));
  ```



## 4. Class

- Dart는 class와 mixin 기반의 상속을 사용하는 객체지향 언어
  - 모든 객체는 클래스의 인스턴스
  - mixin은 부모 클래스로 부터 상속 받아서 매서드를 사용하지 않고 다른 클래스를 포함하는 방식으로 사용
- new 키워드를 통해서 새로운 객체 생성
- Dart2 부터는 new를 생략 가능 
- `.`을 통해 인스턴스 변수나 method 접근할 수 있다. `?.`을 통해 null인 경우 오류 발생하는 것을 방지(null point exception)
- Mixin: `with`을 통해 상속하지 않고 다른 클래스의 기능을 가져오거나 override할 수 있다.(cf) Ruby의 include 같은 것)



## 5. Collection

- List, Map, Set

- List

  ```dart
  List<String> li = ['one', 'two', 'three'];
  ```

- Map

  ```dart
  Map<String, int> intStrMap = {
      'one': 1,
      'two': 2
  };
  print(intStrMap['two']);
  ```

- Set

  ```dart
  Set<String> s = {'one', 'two'};
  print(s.contains('three'));	// fasle
  ```

- ```dart
  var variable1 = <String>{};	// Set<String>으로 취급
  var variable2 = {};		// Map<dynamic, dynamic>으로 취급
  ```

- `...` : collection을 펼쳐주는 연산자

  ```dart
  var variable1 = [1, 2, 3];
  var variable2 = [0, ...items, 4];	// [0, 1, 2, 3, 4]
  ```

- `forEach`

  ```dart
  var li = [1, 2, 3];
  li.forEach((e) {
      print(e);
  });	// 1, 2, 3
  li.forEach(print);	// 1, 2, 3
  ```

- `where`

  ```dart
  var li = [1, 2, 3, 4, 5];
  li.where((e) => e % 2 == 0).forEach(print);	// 2, 4
  ```



## 6. null 처리

- `?.` 연산자: null 여부 판단

- `??` 연산자: 객체가 null일 경우 작동을 간편하게 구현

  ```dart
  String name = null;
  print(name?.length);	// null
  print(name?.length ?? 'jay');	// jay
  ```



## 7. Lamda

```dart
// ([인수명]) => [동작이나 반환값]
(number) => number % 2 == 0;
```



## 8. 문자열 파싱

- 문자열 -> 정수

  ```dart
  var num1 = int.parse('520');	// 520
  ```



## [참고]

- https://medium.com/hongbeomi-dev/dart-%EA%B8%B0%EB%B3%B8-%EB%AC%B8%EB%B2%95-1b54cdb83b09