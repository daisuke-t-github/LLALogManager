//
//  ViewController.swift
//  Demo
//
//  Created by Daisuke T on 2019/01/10.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import UIKit

import LLALogManager



class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		
		// Log Level.
		print("LEVEL")
		LLALogManager.sharedInstance.d("DEVELOP")	// Output when if setting DEBUG switch.
		LLALogManager.sharedInstance.i("INFORMATION")
		LLALogManager.sharedInstance.w("WARNING")
		LLALogManager.sharedInstance.e("ERROR")
		
		
		// Print value.
		print("\nVALUE")
		let num: Int = 1
		LLALogManager.sharedInstance.d("num = \(num)")
		
		let str: String = "word"
		LLALogManager.sharedInstance.d("str = \(str)")
		
		var str2: String? = "word2"
		str2 = nil
		LLALogManager.sharedInstance.d("str2 = \(str2 ?? "")")

		
		// Change separate string.
		print("\nSEPARATOR")
		LLALogManager.sharedInstance.d("Default", "separator", "is", "space.")
		
		LLALogManager.sharedInstance.separator = "⭐️"
		LLALogManager.sharedInstance.d("Custom", "separator", "is", ".")
		
		LLALogManager.sharedInstance.separator = LLALogManager.defaultSeparator
		LLALogManager.sharedInstance.d("Back", "to", "Default", "separator.")

		
		// Change date format.
		print("\nDATE FORMAT")
		LLALogManager.sharedInstance.d("Default date format is \"\(LLALogManager.sharedInstance.dateFormat)\".")
		
		LLALogManager.sharedInstance.dateFormat = "MM/dd(EEE)"
		LLALogManager.sharedInstance.d("Custom date format is \"\(LLALogManager.sharedInstance.dateFormat)\".")
		
		LLALogManager.sharedInstance.dateFormat = LLALogManager.defaultDateFormat
		LLALogManager.sharedInstance.d("Back to Default date format.")

	}

}

