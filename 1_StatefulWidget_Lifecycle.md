# Stateful Widget Life Cycle



1. State
   - widget이 build()될 때 동기적으로 읽을 수 있고
   - widget의 수명 동안 변경될 수 있는 정보
   - 상태 변경이 될 때, State.setState를 사용하여 State에게 알린다.



2. Lifecycle 설명


|Lifecycle|설명|
|:-:|-|
|createState()|State 객체 생성. StatefulWidget에서 필수적으로 오버라이드 해야하는 함수.|
|initState()|State 초기화. 처음 한 번만 호출됨.|
|didChangeDependencies()|initState() 다음으로 호출. 또는 해당 위젯이 의존하는 위젯이 변경되면 호출.|
|build()|State 클래스에서 반드시 오버라이디 되어야하는 함수. State 변경될 때마다 호출됨.|
|setState()|State 상태가 변화했음을 framework에 알리기 위해 사용. 이후 build()를 다시 호출.|
|didUpdateWidget()|부모 Widget이 변경되어 자식 widget을 다시 build() 해야할 때 호출됨. 이후에는 항상 build() 호출.|
|dipose()|State 객체가 영구적으로 제거. 더이상 build() 호출되지 않음.|



![img](https://media.vlpt.us/images/ieed0205/post/58506754-27b1-4423-b62f-6eb8b7281e40/%EC%BA%A1%EC%B2%98.PNG)





## [참고]

- https://brunch.co.kr/@mystoryg/139
- https://fenderist.tistory.com/114
- https://velog.io/@ieed0205/Flutter-1.-Lifecycle%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0