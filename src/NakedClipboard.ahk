#Requires Autohotkey v1.1.33+
;--
;@Ahk2Exe-SetVersion     0.6.0
;@Ahk2Exe-SetMainIcon    res\241.ico
;@Ahk2Exe-SetProductName Naked Clipboard
;@Ahk2Exe-SetDescription Paste the clipboard as plain text
;******************************************************************************
; Want a clear path for learning AutoHotkey?                                  *
; Take a look at our AutoHotkey Udemy courses.                                *
; They're structured in a way to make learning AHK EASY                       *
; Right now you can  get a coupon code here: https://the-Automator.com/Learn  *
;******************************************************************************
#SingleInstance, force

; libraries
#Include <pasteNaked>
#Include <ScriptObject\ScriptObject>

; gui components
#Include <gui\menu>

global script := {base         : script
                 ,name         : regexreplace(A_ScriptName, "\.\w+")
                 ,eddID        : 25921
                 ,version      : "0.6.0"
                 ,author       : "Joe Glines"
                 ,email        : "joe.glines@the-automator.com"
                 ,homepagetext : "https://the-Automator.com/NakedClip"
                 ,homepagelink : "https://www.the-automator.com/NakedClip"
                 ,donateLink   : "https://www.paypal.com/donate?hosted_button_id=MBT5HSD9G94N6"
                 ,resfolder    : A_ScriptDir "\res"
                 ,configfile   : A_ScriptDir "\settings.ini"
                 ,configfolder : ""}

script.GetLicense()

try script.Update("https://raw.githubusercontent.com/RaptorX/Naked-Clipboard/master/ver"
                 ,"https://github.com/RaptorX/Naked-Clipboard/releases/download/latest/NakedClipboard.zip")
Catch err
	if err.code != 6
		MsgBox % err.msg

IniRead, currentHotkey, % script.configfile, % "Hotkeys", % "main", % "^g"
Hotkey, % currentHotkey, % "PasteNaked"
return