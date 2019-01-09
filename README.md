# LLALogManager
LLALogManager is iOS LogManager by Swift.

## Feature
Compared with **print()**,   
LLALogManager can output additional information.

* Date
* Log level
* File name
* Function name
* Line no in File

Other features.
- Custumize output separator


## Sample
Code.
```
LLALogManager.sharedInstance.d("DEVELOP")
LLALogManager.sharedInstance.i("INFORMATION")
LLALogManager.sharedInstance.w("WARNING")
LLALogManager.sharedInstance.e("ERROR")

let num: Int = 1
LLALogManager.sharedInstance.d("num = \(num)")

LLALogManager.sharedInstance.d("a", "b", "c")
		
LLALogManager.sharedInstance.separator = "⭐️"
LLALogManager.sharedInstance.d("a", "b", "c")

LLALogManager.sharedInstance.separator = LLALogManager.SEPARATOR_DEFAULT
LLALogManager.sharedInstance.d("a", "b", "c")    
```

Output.
```
2019-01-09 22:29:25.659 DEV ViewController.swift viewDidLoad():19 DEVELOP
2019-01-09 22:29:25.659 INF ViewController.swift viewDidLoad():20 INFORMATION
2019-01-09 22:29:25.660 WAR ViewController.swift viewDidLoad():21 WARNING
2019-01-09 22:29:25.660 ERR ViewController.swift viewDidLoad():22 ERROR
2019-01-09 22:29:25.660 DEV ViewController.swift viewDidLoad():26 num = 1
2019-01-09 22:29:25.661 DEV ViewController.swift viewDidLoad():35 a b c
2019-01-09 22:29:25.661 DEV ViewController.swift viewDidLoad():38 a⭐️b⭐️c
2019-01-09 22:29:25.661 DEV ViewController.swift viewDidLoad():41 a b c
```
