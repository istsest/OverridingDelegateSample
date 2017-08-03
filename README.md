# Overriding delegate sample

## 상황
- Customized UI 등을 개발하기 위해 기본 델리게이트를 가진 컨트롤 상속받아 클래스를 만드는 경우.
- 자체 델리게이트를 가진 클래스를 상속받아 재사용이 가능한 클래스를 구현하는데 하위 클래스 내부에서 델리게이트를 구현하고 해당 클래스를 사용하는 모듈에서 다시 호출되도록 할 경우

## 목적
- 해당 클래스 내부에서 델리게이트 함수를 구현할 수 있어야 한다.
- 해당 델리게이트 함수는 다시 해당 클래스를 사용하는 외부 모듈의 델리게이트로 호출되어야 한다.

## 예제
- UIScrollView
- UIScrollView는 UIScrollViewDelegate라는 기본 delegate를 가진다.
- Customized UIScrollView를 개발하기 위해 이를 상속받아 MyScrollView라는 클래스를 만든다.
- 이렇게 상속된 MyScrollView 자신을 UIScrollView delegate로 지정한다.
- UIScrollViewDelegate 함수들을 정의하고 필요한 구현을 한다.
- 이때 해당 델리게이트 함수가 MyScrollView를 이용하는 코드에서 실행될 수 있도록 델리게이트를 다시 호출한다.
