# Basic Widget



- `Text`: style 적용된 text 출력
- `Row`, `Column`: 가로, 세로 방향 layout
- `Stack`: 그리는 순서로 쌓으며 배치.`Posutuibed` 위젯을 사용하여 상대적인 top, right, bottom, left로 위치 시킬 수 있다.
- `Container`: 직사각형 element로 BoxDecoration을 통해 background, border, shadow 등을 설정할 수 있다. margin, padding, size 설정도 가능하다. 3차원으로도 변형 가능하다.



## Row, Column

### Orientation

- LinearLayout: android:orientaion="horizontal"/"vertical"` <=> Row / Column

- android에서 LinearLayout 아래 child view가 있는 것 처럼 Row / Column도 children property로 child widget을 구성한다.

  

- Row의 경우 Main Axis가 가로, Cross Axis가 세로

- Column은 Main Axis가 세로,  Cross Axis가 가로

  

### match_parent, wrap_content

- `mainAxisSize`: main axis로 Row/Column widget이 차지하는지 설정할 수 있다. `MainAxisSize.max`, `MainAxisSize.min` 두 값을 가질 수 있다.
- `MainAxisSize.max`가 `mainAxisSize`의 defualt 값
- `mainAxisSize`를 통해서 match_parent나 wrap_content와 같이 만들 수 있다.

![Image for post](https://miro.medium.com/max/1386/1*bUP8rPQbN2w07QaEtz7ENA.png)

- Example
  
  ```dart
  body: new Container(
      color: Colors.yellowAccent,
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [...],
      ),
  )
  ```



### 정렬하기(Gravity)

- Row/Column 내부에 있는 위젯 정렬하는 옵션

1. `mainAxisAlignment`

   - main axis를 기준으로 정렬 

   - MainAxisAlignment.start가 default(Row의 경우 왼쪽, Column의 경우 위쪽부터 나란히 배치)

   - |  enum  |          Row          |        Column         |
     | :----: | :-------------------: | :-------------------: |
     | start  | 가로축 기준 좌측 정렬 | 세로축 기준 상단 정렬 |
     | center | 가로축 기준 중앙 정렬 | 세로축 기준 중앙 정렬 |
     |  end   | 가로축 기준 우측 정렬 | 세로축 기준 하단 정렬 |

     | spaceAround  | 첫 번째와 마지막 child 앞뒤에 여유 공간을 나머지 child와 공간의 절반만큼 배치 |
     | :----------: | :----------------------------------------------------------: |
     | spaceBetween | child widget을 시작과 끝에 배치, 시작과 끝 widget 사이 공간은 균등하게 배치 |
     | spaceEvenly  |            child widget 사이 공간을 균등하게 배치            |
     |     상수     |                          Row/Column                          |

     <img src="https://blog.kakaocdn.net/dn/Ui4pY/btqz7omPMo2/JQLXhUo42USHCnZjCVPkL0/img.png" alt="img" style="zoom:50%;" />

     

2. `crossAxisAlignment`

   - cross axis 기준으로 정렬

   - CrossAxisAlignment.center가 default

   - |   enum   |               Row                |              Column              |
     | :------: | :------------------------------: | :------------------------------: |
     |  start   |      가로축 기준 상단 정렬       |      세로축 기준 좌측 정렬       |
     |  center  |      가로축 기준 중앙 정렬       |      세로축 기준 중앙 정렬       |
     |   end    |      가로축 기준 하단 정렬       |      세로축 기준 우측 정렬       |
     | baseline |      baseline 기준 수평정렬      |      baseline 기준 수직정렬      |
     | stretch  | child widget으로 세로축을 채운다 | child widget으로 가로축을 채운다 |

   - `baseline`: chracter baseline에 따라 child를 정렬. Text class만 해당되며 `textBaseline` property가 TextBaseline.alphabetic으로 설정되어야 한다.  

     |                   TextBaseline.alphabetic                    |                   TextBaseline.ideographic                   |
     | :----------------------------------------------------------: | :----------------------------------------------------------: |
     | <img src="https://i.stack.imgur.com/s0ciC.png" alt="enter image description here" style="zoom:50%;" /> | <img src="https://i.stack.imgur.com/b5x6Y.png" alt="enter image description here" style="zoom:50%;" /> |





## [참고]

- https://flutter.dev/docs/development/ui/widgets-intro#basic-widgets
- https://proandroiddev.com/flutter-for-android-developers-how-to-design-linearlayout-in-flutter-5d819c0ddf1a
- https://api.flutter.dev/flutter/widgets/Row-class.html
- https://api.flutter.dev/flutter/widgets/Expanded-class.html
- http://murmurblog.com/flutter-widget/
- https://here4you.tistory.com/120
- https://beomseok95.tistory.com/310
- https://developer-popo.tistory.com/34
