<p align="center">
  <img src="https://github.com/daisuke-t-github/LLALogManager/blob/master/doc/header.png" width="700">
</p>

**LLALogManager** is iOS LogManager by Swift.


## Feature
Compared with **print()**,   
LLALogManager can output additional information.

* Date
* File name
* Function name
* Line no in File
* Log level
  
and  
- Custumize output separator
- Custumize date format


## Installation
### Carthage
`github "daisuke-t-github/LLALogManager"` 


## Example

### Swift code
```
// Log Level.
print("LEVEL")
LLALogManager.sharedInstance.d("DEVELOP")	// Output when if setting DEBUG switch
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
```

### Output
```
LEVEL
[2019-01-01 00:01:37.008][ViewController.swift][viewDidLoad():24][DEV]DEVELOP
[2019-01-01 00:01:37.011][ViewController.swift][viewDidLoad():25][INF]INFORMATION
[2019-01-01 00:01:37.011][ViewController.swift][viewDidLoad():26][WAR]WARNING
[2019-01-01 00:01:37.011][ViewController.swift][viewDidLoad():27][ERR]ERROR

VALUE
[2019-01-01 00:01:37.012][ViewController.swift][viewDidLoad():33][DEV]num = 1
[2019-01-01 00:01:37.012][ViewController.swift][viewDidLoad():36][DEV]str = word
[2019-01-01 00:01:37.012][ViewController.swift][viewDidLoad():40][DEV]str2 = 

SEPARATOR
[2019-01-01 00:01:37.012][ViewController.swift][viewDidLoad():45][DEV]Default separator is space.
[2019-01-01 00:01:37.013][ViewController.swift][viewDidLoad():48][DEV]Custom⭐️separator⭐️is⭐️.
[2019-01-01 00:01:37.013][ViewController.swift][viewDidLoad():51][DEV]Back to Default separator.

DATE FORMAT
[2019-01-01 00:01:37.013][ViewController.swift][viewDidLoad():56][DEV]Default date format is "yyyy-MM-dd HH:mm:ss.SSS".
[01/01(Thu)][ViewController.swift][viewDidLoad():59][DEV]Custom date format is "MM/dd(EEE)".
[2019-01-01 00:01:37.014][ViewController.swift][viewDidLoad():62][DEV]Back to Default date format.
```
