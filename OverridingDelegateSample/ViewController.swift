//
//  ViewController.swift
//  OverridingDelegateSample
//
//  Created by Joon Jang on 8/2/17.
//  Copyright © 2017 Beast. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyScrollViewDelegate {

	var myScrollView = MyScrollView(frame: CGRect.zero)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.myScrollView.delegate = self
		self.myScrollView.contentSize = CGSize(width:9999, height:9999)
		self.view.addSubview(self.myScrollView)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.myScrollView.frame = self.view.bounds
	}
	
	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
		print("View controller의 scrollViewWillBeginDragging 호출")
	}

	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		print("View controller의 scrollViewDidEndDecelerating 호출")
	}
}

