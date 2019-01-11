//
//  LLALogManager.swift
//  LLALogManager
//
//  Created by Daisuke T on 2019/01/09.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation



public class LLALogManager
{

	// MARK: singleton
	public static let sharedInstance = LLALogManager()
	

	// MARK: enum, const.
	private enum Level : UInt
	{
		case develop
		case information
		case warning
		case error
	}

	public static let defaultSeparator: String = " "
	public static let defaultDateFormat: String = "yyyy-MM-dd HH:mm:ss.SSS"

	private static let levelMap:[Level:String] = [
		Level.develop : "DEV",
		Level.information : "INF",
		Level.warning : "WAR",
		Level.error : "ERR",
		]

	
	// MARK: member
	public var separator:String = LLALogManager.defaultSeparator
	public var dateFormat:String = LLALogManager.defaultDateFormat
	
	
	// MARK: life-cycle
	private init()
	{
		// NOP
	}
	

	// MARK: method
	public func d(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		#if DEBUG
		log(Level.develop, items: items, file: file, function: function, line: line)
		#endif
	// MARK: method(util)
	public func version() -> String
	{
		let bundle = Bundle(for: type(of: self))
		guard let dict = bundle.infoDictionary else
		{
			print("error bundle get.")
			return ""
		}

		return dict["CFBundleShortVersionString"] as! String
	}
	
	public func i(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.information, items: items, file: file, function: function, line: line)
	}

	public func w(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.warning, items: items, file: file, function: function, line: line)
	}

	public func e(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.error, items: items, file: file, function: function, line: line)
	}
	
	private func log(_ level: Level, items:[Any], file: String, function: String, line: Int) -> Void {
		
		/**
		 * print prefix.
		 */
		let levelStr = LLALogManager.levelMap[level]!
		let fileName: String = NSString(string:file).lastPathComponent
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = self.dateFormat
		let date = dateFormatter.string(from: Date())

		print("[\(date)][\(fileName)][\(function):\(line)][\(levelStr)]",
			terminator: "")

		
		/**
		 * print items.
		 */
		var separator = ""
		for elm in items
		{
			print(separator, terminator: "")
			print(elm, terminator: "")
			
			separator = self.separator
		}
		
		print("")

	}
}
