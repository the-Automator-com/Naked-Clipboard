;*******************************************************
; Want a clear path for learning AutoHotkey; Take a look at our AutoHotkey Udemy courses.  They're structured in a way to make learning AHK EASY
; Right now you can  get a coupon code here: https://the-Automator.com/Learn
;*******************************************************
#SingleInstance, force

; libraries
#Include lib\pasteNaked.ahk
#Include lib\ScriptObj\scriptobj.ahk

; gui components
#Include gui\menu.ahk

global script := {base			: script
				 ,name			: regexreplace(A_ScriptName, "\.\w+")
				 ,version		: "0.1.0"
				 ,author		: "Joe Glines"
				 ,email			: "joe.glines@the-automator.com"
				 ,homepagetext	: ""
				 ,homepagelink	: ""
				 ,donateLink	: "https://www.paypal.com/donate?hosted_button_id=MBT5HSD9G94N6"
				 ,resfolder		: A_ScriptDir "\res"
				 ,iconfile		: A_WinDir "\system32\imageres.dll,242"
				 ,configfile	: A_ScriptDir "\settings.ini"
				 ,configfolder	: ""}

IniRead, currentHotkey, % script.configfile, Hotkeys, main, ^g
Hotkey, % currentHotkey, % "PasteNaked"
return