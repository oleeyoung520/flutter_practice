# TextFormField



## Form class

- 여러 form field widget들을 담고 있는 widget

- FormState의 메서드를 호출하여 child인 각 FormField를 save, reset, validate 한다.

- FormState를 얻으려면 GlobalKey를 Form 생성자에 전달하고 GlobalKey.currentState를 호출하면 된다.

  

## TextFormField

- TextField를 포함하는 FormField

- TextField Widget과 모양과 기능이 동일하지만 추가적으로 `validator` property를 가지고 있어 error msg를 표시할 로직을 정해줄 수 있기 때문에 입력값을 검증하는 입력폼에 사용할 수 있다.

   

## TextField 텍스트 변화를 감지하는 방법

1. `TextField`의 `onChanged` property
2. `TextEditingController` 인스턴스에 handling listener 사용



## Code

- Form의 상태를 확인해서 동적으로 처리해야하므로 StatefulWidget 상속하여 구현
- Form에서 각 widget의 고유 ID를 부여할 때 GlobalKey 함수 사용
- TextFormField의 validator property를 통해 적합성 검증 로직을 부여
- 버튼을 누르면 검증을 시도
- `_formKey.currentState.validate()`: _formKey는 Form의 ID값. currentState.validate() 함수를 통해 Form 내부의 모든 child FormField의 validator가 실행. 모든 validator가 적합할 경우 true 반환하고 if문에 들어가게 된다.

```dart
class LoginPageRoute extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPageRoute> {
    String _email, _password = "";
    final _formKey = GlobalKey<FormState>();
    final passwordCtr = TextEditingController();
    
    @override
    void dispose(){
        super.dispose();
        passwordCtr.dispose();
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold
            body: Container(
                child: Form(
                    key: _formKey,
                    child: Column(
                        children: <Widget>[
                            EmailInput(),		// TextFormField
                            PasswordInput(),	// TextFormField
                            SubmitButton()		// Button
                        ]))));
      }
    
    
    Widget EmailInput() {
          // UserInfoTextFormField: Custom TextFormField
          return UserInfoTextFormField(
              validator: (val) => !ValidationUtils.validateEmail(val)? msg_invalid_email: null,
              onChanged: (val) {setState(() => _email = val);},
          );
    }
    
    Widget PasswordInput() {
          // UserInfoTextFormField: Custom TextFormField
          return UserInfoTextFormField(
              validator: (val) => !ValidationUtils.validationPWLogin(val)? msg_empty_password: null,
              onChanged: (val) {setState(() => _email = val);},
          );
      }


      InkWell SubmitButton() {
          return InkWell(...),
          onTap: () {
              if (_formKey.currentState.validate()) {...}});
      }
    }
```





## 추가

- Form 없이 사용 가능

- Form 없이 사용하려면 GlobalKey를 생성자에 전달하고 GlobalKey.currentState를 사용하여 Form Field를 save, reset 하면 된다

- TextEditingController.text 사용

- 더이상 필요하지 않으면 TextEditingController.dispose 호출해서 삭제

- ```
  /// Flutter code sample for TextFormField
  
  // This example shows how to move the focus to the next field when the user
  // presses the SPACE key.
  
  import 'package:flutter/material.dart';
  
  import 'package:flutter/services.dart';
  
  void main() => runApp(MyApp());
  
  /// This is the main application widget.
  class MyApp extends StatelessWidget {
    static const String _title = 'Flutter Code Sample';
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: _title,
        home: MyStatefulWidget(),
      );
    }
  }
  
  /// This is the stateful widget that the main application instantiates.
  class MyStatefulWidget extends StatefulWidget {
    MyStatefulWidget({Key key}) : super(key: key);
  
    @override
    _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
  }
  
  /// This is the private State class that goes with MyStatefulWidget.
  class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    Widget build(BuildContext context) {
      return Material(
        child: Center(
          child: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              // Pressing space in the field will now move to the next field.
              LogicalKeySet(LogicalKeyboardKey.space): const NextFocusIntent(),
            },
            child: FocusTraversalGroup(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                onChanged: () {
                  Form.of(primaryFocus.context).save();
                },
                child: Wrap(
                  children: List<Widget>.generate(5, (int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(200, 50)),
                        child: TextForm-Field(
                          onSaved: (String value) {
                            print('Value for field $index saved as "$value"');
                          },
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
  
  ```







## [참고]

- https://api.flutter.dev/flutter/material/TextFormField-class.html
- https://flutter.dev/docs/cookbook/forms/validation

