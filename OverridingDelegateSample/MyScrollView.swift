//
//  MyScrollView.swift
//  OverridingDelegateSample
//
//  Created by Joon Jang on 8/2/17.
//  Copyright © 2017 Beast. All rights reserved.
//

import UIKit

protocol MyScrollViewDelegate: UIScrollViewDelegate {

	// 커스타마이즈드 델리게이트 함수를 여기에 추가
	
}

class MyScrollView: UIScrollView, UIScrollViewDelegate {

	// 외부로 호출하기 위한 델리게이트 선언
	weak var myDelegate: MyScrollViewDelegate?
	
	// 기본 댈라개아트 오버라이딩
	override weak var delegate: UIScrollViewDelegate? {
		get {
			return self.myDelegate
		}
		set {
			self.myDelegate = newValue as? MyScrollViewDelegate
			
			// 내부에서 델리게이트 받아 처리하기 위해 자신을 기본 델리게이트로 설정
			super.delegate = self
		}
	}

	init() {
		super.init(frame: CGRect.zero)

		// 내부에서 델리게이트 받아 처리하기 위해 자신을 기본 델리게이트로 초기 설정
		super.delegate = self
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		// 내부에서 델리게이트 받아 처리하기 위해 자신을 기본 델리게이트로 초기 설정
		super.delegate = self
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		// 내부에서 델리게이트 받아 처리하기 위해 자신을 기본 델리게이트로 초기 설정
		super.delegate = self
	}

	// 기본 델리게이트 함수 1
	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
		print("MyScrollView의 scrollViewWillBeginDragging 호출")
		
		// 내부 처리가 끝나면 외부에서 해당 델리게이트를 이용할 수 있도록 호출
		self.myDelegate?.scrollViewWillBeginDragging?(scrollView)
	}
	
	// 기본 델리게이트 함수 2
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		print("MyScrollView의 scrollViewDidEndDecelerating 호출")
		
		// 내부 처리가 끝나면 외부에서 해당 델리게이트를 이용할 수 있도록 호출
		self.myDelegate?.scrollViewDidEndDecelerating?(scrollView)
	}

	// 그외 다른 델리게이트 함수들도 구현하자.
	// 반드시 외부에서 사용할 수 있도록 외부 델리게이트를 호출하자.
	// 내부 처리가 필요없는 델리게이트 함수는 함수 선언 후 외부 델리게이트 함수만 호출하자.
	
	
	
}
