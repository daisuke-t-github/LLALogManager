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

	// MARK: - Singleton
	public static let sharedInstance = LLALogManager()



	// MARK: - Enum, const.
	public enum Level : UInt
	{
		case debug = 0	// Information for developers.
		case info = 1	// Generic information.
		case warn = 2	// Warning.
		case error = 3	// Error(Possible Continue).
		case fatal = 4	// Fatal(Impossible Continue).
	}

	private let keyDelegate = "delegate"
	private let keyAutoNewLine = "autonewline"
	private let keySeparator = "separator"
	private let keyDate = "date"
	private let keyIndex = "index"
	private let keyFileName = "fileName"
	private let keyFunction = "function"
	private let keyLine = "line"
	private let keyLevel = "level"
	private let keyItems = "items"
	
	// default.
	public static let defaultLevel: Level = Level.debug
	public static let defaultSeparator: String = " "
	public static let defaultDateFormat: String = "yyyy-MM-dd HH:mm:ss.SSS"
	public static let defaultLevelMap: [Level : String] = [
		Level.debug	: "🐝",
		Level.info	: "ℹ️",
		Level.warn	: "⚠️",
		Level.error	: "💣",
		Level.fatal	: "💥",
		]


	
	// MARK: - Member
	public weak var delegate: LLALogManagerDelegate?
	private var dispatchQueue: DispatchQueue? = nil

	private var dateFormatter: DateFormatter = DateFormatter()
	public var dateFormat: String = LLALogManager.defaultDateFormat
	{
		didSet
		{
			dateFormatter.dateFormat = dateFormat
		}
	}
	private var index: UInt = 0
	public var level: Level = LLALogManager.defaultLevel
	public var levelMap: [Level : String] = LLALogManager.defaultLevelMap
	public var separator: String = LLALogManager.defaultSeparator
	public var isAutoNewLineEnabled = true
	public var isThreadingEnable = false
	

	
	// MARK: - Life-cycle
	private init()
	{
		dateFormatter.dateFormat = dateFormat
		
		let queueLabel = name + NSUUID().uuidString
		dispatchQueue = DispatchQueue(label: queueLabel)
	}



	// MARK: - Function(Util)
	public var version: String
	{
		let bundle = Bundle(for: type(of: self))
		guard let dict = bundle.infoDictionary else
		{
			print("error bundle get.")
			return ""
		}

		return dict["CFBundleShortVersionString"] as! String
	}
	
	private var name: String
	{
		let bundle = Bundle(for: type(of: self))
		return bundle.bundleIdentifier!
	}
	
	private func incrementIndex() -> UInt
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
	


	// MARK: - Function(Log)
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

	private func log(_ level: Level, items: [Any], file: String, function: String, line: Int) -> Void {

		guard level.rawValue >= self.level.rawValue else
		{
			return
		}


		let param: [String : Any?] = [
			keyDelegate : delegate,
			keyAutoNewLine : isAutoNewLineEnabled,
			keySeparator : separator,
			keyDate : dateFormatter.string(from: Date()),
			keyIndex : incrementIndex(),
			keyFileName : NSString(string: file).lastPathComponent,
			keyFunction : function,
			keyLine : line,
			keyLevel : levelMap[level]!,
			keyItems : items
			]

		if isThreadingEnable && level != Level.fatal
		{
			guard dispatchQueue != nil else
			{
				return
			}

			dispatchQueue?.async(execute: {
				self.log(param)
			})
		}
		else
		{
			self.log(param)
		}

	}
	
	private func log(_ param: [String: Any?])
	{
		let delegate: LLALogManagerDelegate? = param[keyDelegate] as? LLALogManagerDelegate
		let isAutoNewLine = param[keyAutoNewLine] as! Bool
		let date = param[keyDate] as! String
		let index = param[keyIndex] as! UInt
		let fileName = param[keyFileName] as! String
		let function = param[keyFunction] as! String
		let line = param[keyLine] as! Int
		let level = param[keyLevel] as! String
		let items = param[keyItems] as! [Any]
		let separator = param[keySeparator] as! String

		
		if delegate != nil
		{
			delegate!.log(date: date,
						  index: index,
						  fileName: fileName,
						  function: function,
						  line: line,
						  level: level,
						  items: items)
		}
		else
		{
			print("[\(date)][\(index)][\(fileName)][\(function):\(line)][\(level)]",
				terminator: "")

			var separator2 = ""
			for elm in items
			{
				autoreleasepool
				{
					print(separator2, terminator: "")
					print(elm, terminator: "")

					separator2 = separator
				}
			}
		}
		
		
		if isAutoNewLine
		{
			print("")
		}
	}

}
