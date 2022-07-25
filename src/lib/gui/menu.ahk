Menu, Tray, Click, 1
Menu, Tray, NoStandard

if !A_IsCompiled
	Menu, Tray, Icon, % A_WinDir "\system32\imageres.dll", 242

Menu, Tray, Add, % "Preferences"
Menu, Tray, Default, % "Preferences"
Menu, Tray, Add
Menu, Tray, Add, % "Check for Updates", % "Update"
Menu, Tray, Add, % "About"
Menu, Tray, Add
Menu, Tray, Add, % "Reload"
Menu, Tray, Add, % "Exit"

Preferences()
{
	global currentHotkey, oldHotkey, WindowsKey

	Gui, preferences:new
	oldHotkey := currentHotkey
	currentHotkey := RegExReplace(currentHotkey, "#", "", count)
	winKey := count ? true : false
	
	Gui, Add, GroupBox, w255, % "Select Paste Hotkey"
	Gui, Add, Checkbox, xp+10 yp+25 Checked%winKey% vWindowsKey, % "Win"
	Gui, Add, Hotkey, w100 x+10 yp-3 vCurrentHotkey, % regexreplace(currentHotkey, "\$")
	Gui, Add, Button, w75 x+10 default gSave, % "Save"
	Gui, show
}

Save(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:="")
{
	global currentHotkey, oldHotkey, WindowsKey
	Gui, preferences:Default

	Hotkey, % oldHotkey, % "OFF"
	Gui, Submit

	Hotkey, % (WindowsKey ? "#" : "") currentHotkey, % "PasteNaked"
	IniWrite, % (WindowsKey ? "#" : "") currentHotkey, % script.configfile, % "Hotkeys", % "main"
	Return
}

Reload()
{
	Reload
}

Exit()
{
	ExitApp, 0
}

About()
{
	script.About()
	return
}

update()
{
	try
		script.update("https://raw.githubusercontent.com/RaptorX/Naked-Clipboard/latest/ver"
		             ,"https://github.com/RaptorX/Naked-Clipboard/releases/download/latest/NakedClipboard.zip")
	catch err
		msgbox % err.code ": " err.msg

	return
}