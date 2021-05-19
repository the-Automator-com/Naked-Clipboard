Menu, Tray, Click, 1
Menu, Tray, NoStandard
Menu, Tray, Icon, % script.iconfile
Menu, Tray, Add, % "Preferences"
Menu, Tray, Default, % "Preferences"
Menu, Tray, Add
; Menu, Tray, Add, % "Check for Updates", % "Update"
Menu, Tray, Add, % "About"
Menu, Tray, Add
Menu, Tray, Add, % "Reload"
Menu, Tray, Add, % "Exit"

Preferences()
{
	global currentHotkey, oldHotkey, WindowsKey

	gui preferences:new
	oldHotkey := currentHotkey
	currentHotkey := RegExReplace(currentHotkey, "#", "", count)
	winKey := count ? True : false
	
	gui add, groupbox, w255, % "Select Paste Hotkey"
	gui add, Checkbox, xp+10 yp+25 Checked%winKey% vWindowsKey, % "Win"
	gui add, hotkey, w100 x+10 yp-3 vCurrentHotkey, % regexreplace(currentHotkey, "\$")
	gui add, button, w75 x+10 default gSave, % "Save"
	gui show
}

Save(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:="")
{
	global currentHotkey, oldHotkey, WindowsKey
	gui preferences:Default

	Hotkey, % oldHotkey, % "OFF"
	gui Submit

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
		script.update(false, false)
	catch err
		msgbox % err.code ": " err.msg

	return
}