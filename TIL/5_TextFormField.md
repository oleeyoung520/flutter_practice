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
              controller: passwordCtr,
              validator: (val) => (passwordCtr.text != val)? msg_empty_password: null,
          );
      }


      InkWell SubmitButton() {
          return InkWell(...),
          onTap: () {
              if (_formKey.currentState.validate()) {...}});
      }
    }
```





## [참고]

- https://api.flutter.dev/flutter/material/TextFormField-class.html
- https://flutter.dev/docs/cookbook/forms/validation

