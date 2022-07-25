;******************************************************************************
; Want a clear path for learning AutoHotkey?                                  *
; Take a look at our AutoHotkey Udemy courses.                                *
; They're structured in a way to make learning AHK EASY                       *
; Right now you can  get a coupon code here: https://the-Automator.com/Learn  *
;******************************************************************************
#SingleInstance, force
#Include %A_ScriptDir%
;@Ahk2Exe-SetMainIcon  res\241.ico

; libraries
#Include <pasteNaked>
#Include <ScriptObj\ScriptObj>

; gui components
#Include <gui\menu>

global script := {base         : script
                 ,name         : regexreplace(A_ScriptName, "\.\w+")
                 ,eddID        : 25921
                 ,version      : "0.3.3"
                 ,author       : "Joe Glines"
                 ,email        : "joe.glines@the-automator.com"
                 ,homepagetext : "https://the-Automator.com/NakedClip"
                 ,homepagelink : "https://www.the-automator.com/NakedClip"
                 ,donateLink   : "https://www.paypal.com/donate?hosted_button_id=MBT5HSD9G94N6"
                 ,resfolder    : A_ScriptDir "\res"
                 ,configfile   : A_ScriptDir "\settings.ini"
                 ,configfolder : ""}

script.GetLicense()


IniRead, currentHotkey, % script.configfile, % "Hotkeys", % "main", % "^g"
Hotkey, % currentHotkey, % "PasteNaked"
return