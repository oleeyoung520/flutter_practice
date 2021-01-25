

< Factory >

- factory 생성자
- 





< @JasonSerializable >

- [JSON과 직렬화](https://flutter-ko.dev/docs/development/data-and-backend/json)
- `@JsonSerializable`: 코드 생성기에 이 클래스가 JSON 직렬화 로직이 만들어져야한다고 알려주는 annotation
- 직렬화(Serialization): 네트워크 통신을 통해 다른 곳으로 전송할 수 있는 형식이나 파일에 저장할 수 있는 형식으로 객체를 변환하는 것
- 역직렬화(Deserialization): 직렬화한 데이터를 본래의 객체로 되돌리는 변환

```dart
import 'package:json_annotation/json_annotation.dart';

/// 이 구문은 `User` 클래스가 생성된 파일의 private 멤버들을
/// 접근할 수 있도록 해줍니다. 여기에는 *.g.dart 형식이 들어갑니다.
/// * 에는 소스 파일의 이름이 들어갑니다.
part 'user.g.dart';

@JsonSerializable
class Task {
    String id;
    String name;
    String content;
    String createdAt;
    
    Task({this.id, this.name, this.content, this.createdAt});
    
}
```




