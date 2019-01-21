<img src="https://github.com/daisuke-t-jp/LLALogManager/blob/master/doc/header.png" width="700"></br>
------
![Platform](https://img.shields.io/badge/Platform-iOS%2010.0+-blue.svg)
[![Language Swift%204.2](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Cocoapods](https://img.shields.io/cocoapods/v/LLALogManager.svg)](https://cocoapods.org/pods/LLALogManager)

Customizable iOS logger.

### Feature

#### Additional Information
Compared with **print()**,   
LLALogManager can output additional information.

- Date
- Log index
- File name
- Function name
- Line no in File
- Log level

#### Customizable
- Output separator
- Date format
- Switchable Log level
- Log level string
- Switchable Auto new line insert
- Support threading


### Install
#### Carthage
`github "daisuke-t-jp/LLALogManager"` 

#### CocoaPods
```
platform :ios, '10.0'
use_frameworks!

target 'target' do
pod 'LLALogManager'
end
```


### Example

#### Swift code
```swift

import LLALogManager

let llalog = LLALogManager.sharedInstance

let level: LLALogManager.Level = llalog.level


// Log Level.
print("\nLEVEL")
llalog.d("Information for developers.")
llalog.i("Generic information.")
llalog.w("Warning.")
llalog.e("Error(Possible continue).")
llalog.f("Fatal(Impossible continue).")

print("\nChange log level to ERROR")
llalog.level = LLALogManager.Level.error
llalog.d("Information for developers.") // Log will not output.
llalog.i("Generic information.") // Log will not output.
llalog.w("Warning.") // Log will not output.
llalog.e("Error(Possible continue).")
llalog.f("Fatal(Impossible continue).")

llalog.level = level


// Change log level string.
print("\nLOG LEVEL STRING")
llalog.levelMap = ViewController.levelMap
llalog.d("DEBUG")
llalog.i("INFO")
llalog.w("WARN")
llalog.e("ERROR")
llalog.f("FATAL")
llalog.levelMap = LLALogManager.defaultLevelMap


// Change separate string.
print("\nSEPARATOR")
llalog.i("Default", "separator", "is", "space.")

llalog.separator = "⭐️"
llalog.i("Custom", "separator", "is", ".")

llalog.separator = LLALogManager.defaultSeparator


// Change date format.
print("\nDATE FORMAT")
llalog.i("Default date format is \"\(llalog.dateFormat)\".")

llalog.dateFormat = "MM/dd(EEE)"
llalog.i("Custom date format is \"\(llalog.dateFormat)\".")

llalog.dateFormat = LLALogManager.defaultDateFormat


// Change log format
print("\nLOG FORMAT")
llalog.delegate = self
llalog.i("Custom log format.")
llalog.delegate = nil
```

#### Output
```
LEVEL
[2019-01-13 23:10:09.110][2][ViewController.swift][viewDidLoad():45][🐝]Information for developers.
[2019-01-13 23:10:09.110][3][ViewController.swift][viewDidLoad():46][ℹ️]Generic information.
[2019-01-13 23:10:09.110][4][ViewController.swift][viewDidLoad():47][⚠️]Warning.
[2019-01-13 23:10:09.111][5][ViewController.swift][viewDidLoad():48][💣]Error(Possible continue).
[2019-01-13 23:10:09.111][6][ViewController.swift][viewDidLoad():49][💥]Fatal(Impossible continue).

Change log level to ERROR
[2019-01-13 23:10:09.111][7][ViewController.swift][viewDidLoad():56][💣]Error(Possible continue).
[2019-01-13 23:10:09.111][8][ViewController.swift][viewDidLoad():57][💥]Fatal(Impossible continue).

LOG LEVEL STRING
[2019-01-13 23:10:09.111][9][ViewController.swift][viewDidLoad():65][DEB]DEBUG
[2019-01-13 23:10:09.111][10][ViewController.swift][viewDidLoad():66][INF]INFO
[2019-01-13 23:10:09.112][11][ViewController.swift][viewDidLoad():67][WAR]WARN
[2019-01-13 23:10:09.112][12][ViewController.swift][viewDidLoad():68][ERR]ERROR
[2019-01-13 23:10:09.126][13][ViewController.swift][viewDidLoad():69][FAT]FATAL

SEPARATOR
[2019-01-13 23:10:09.126][14][ViewController.swift][viewDidLoad():75][ℹ️]Default separator is space.
[2019-01-13 23:10:09.127][15][ViewController.swift][viewDidLoad():78][ℹ️]Custom⭐️separator⭐️is⭐️.

DATE FORMAT
[2019-01-13 23:10:09.127][16][ViewController.swift][viewDidLoad():85][ℹ️]Default date format is "yyyy-MM-dd HH:mm:ss.SSS".
[01/13(Sun)][17][ViewController.swift][viewDidLoad():88][ℹ️]Custom date format is "MM/dd(EEE)".

LOG FORMAT
ℹ️ 18 ViewController.swift viewDidLoad():96	 --- Custom log format.
```
