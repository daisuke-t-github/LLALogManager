//
//  LLALogManager.swift
//  LLALogManager
//
//  Created by Daisuke T on 2019/01/09.
//  Copyright © 2019 Daisuke T. All rights reserved.
//

import Foundation


public protocol LLALogManagerDelegate : class
{
	func log(date: String,
			 index: UInt,
			 fileName: String,
			 function: String,
			 line: Int,
			 level: String,
			 items:[Any]) -> Void

}



public class LLALogManager
{

	// MARK: singleton
	public static let sharedInstance = LLALogManager()



	// MARK: enum, const.
	public enum Level : UInt
	{
		case debug = 0	// Information for developers.
		case info = 1	// Generic information.
		case warn = 2	// Warning.
		case error = 3	// Error(Possible Continue).
		case fatal = 4	// Fatal(Impossible Continue).
	}

	
	
	// default.
	public static let defaultLevel: Level = Level.debug
	public static let defaultSeparator: String = " "
	public static let defaultDateFormat: String = "yyyy-MM-dd HH:mm:ss.SSS"
	public static let defaultLevelMap: [Level:String] = [
		Level.debug	: "🐝",
		Level.info	: "ℹ️",
		Level.warn	: "⚠️",
		Level.error	: "💣",
		Level.fatal	: "💥",
		]


	
	// MARK: member
	private var dateFormatter:DateFormatter = DateFormatter()
	public var dateFormat:String = LLALogManager.defaultDateFormat
	{
		didSet
		{
			dateFormatter.dateFormat = dateFormat
		}
	}
	public weak var delegate: LLALogManagerDelegate?
	private var index: UInt = 0
	public var level:Level = LLALogManager.defaultLevel
	public var levelMap: [Level:String] = LLALogManager.defaultLevelMap
	public var separator:String = LLALogManager.defaultSeparator
	public var isAutoNewLineEnabled = true
	public var isThreadingEnable = true
	

	
	// MARK: life-cycle
	private init()
	{
		dateFormatter.dateFormat = dateFormat
	}



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
	
	public func incrementIndex() -> UInt
	{
		if index == UInt.max
		{
			index = 0
		}
		else
		{
			index = index + 1
		}
		
		return index
	}



	// MARK: method(log)
	public func d(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.debug, items: items, file: file, function: function, line: line)
	}
	public func debug(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.debug, items: items, file: file, function: function, line: line)
	}

	public func i(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.info, items: items, file: file, function: function, line: line)
	}
	public func info(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.info, items: items, file: file, function: function, line: line)
	}

	public func w(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.warn, items: items, file: file, function: function, line: line)
	}
	public func warn(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.warn, items: items, file: file, function: function, line: line)
	}

	public func e(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.error, items: items, file: file, function: function, line: line)
	}
	public func error(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.error, items: items, file: file, function: function, line: line)
	}

	public func f(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.fatal, items: items, file: file, function: function, line: line)
	}
	public func fatal(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) -> Void {
		log(Level.fatal, items: items, file: file, function: function, line: line)
	}

	private func log(_ level: Level, items:[Any], file: String, function: String, line: Int) -> Void {

		guard level.rawValue >= self.level.rawValue else
		{
			return
		}


		let fileName: String = NSString(string:file).lastPathComponent
		let dateStr = dateFormatter.string(from: Date())
		let levelStr = levelMap[level]!
		let index = incrementIndex()
		

		if delegate != nil
		{
			delegate!.log(date: dateStr,
						  index: index,
						  fileName: fileName,
						  function: function,
						  line: line,
						  level: levelStr,
						  items: items)
		}
		else
		{
			print("[\(dateStr)][\(index)][\(fileName)][\(function):\(line)][\(levelStr)]",
				terminator: "")

			var separator = ""
			for elm in items
			{
				autoreleasepool
				{
					print(separator, terminator: "")
					print(elm, terminator: "")

					separator = self.separator
				}
			}
		}
		
		
		if isAutoNewLineEnabled
		{
			print("")
		}
	}

}
