//
//  ViewController.swift
//  LLALogManager
//
//  Created by Daisuke T on 2019/01/09.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		print("default print log.")
		LLALogManager.sharedInstance.d("")
		LLALogManager.sharedInstance.d("DEVELOP")
		LLALogManager.sharedInstance.i("INFORMATION")
		LLALogManager.sharedInstance.w("WARNING")
		LLALogManager.sharedInstance.e("ERROR")


		let num: Int = 1
		LLALogManager.sharedInstance.d("num = \(num)")

		let str: String = "word"
		LLALogManager.sharedInstance.d("str = \(str)")

		var str2: String? = "word2"
		str2 = nil
		LLALogManager.sharedInstance.d("str2 = \(str2 ?? "")")

		LLALogManager.sharedInstance.d("a", "b", "c")
		
		LLALogManager.sharedInstance.separator = "⭐️"
		LLALogManager.sharedInstance.d("a", "b", "c")

		LLALogManager.sharedInstance.separator = LLALogManager.SEPARATOR_DEFAULT
		LLALogManager.sharedInstance.d("a", "b", "c")
	
	}
}

