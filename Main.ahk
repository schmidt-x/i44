#Requires AutoHotkey v2.0
#Hotstring EndChars `t`s
#SingleInstance
#UseHook

SplitPath(A_AhkPath, &__name, &__dir)
__uia := "AutoHotkey64_UIA.exe"

if (__name !== __uia) {
	Run(Format('"{}\{}" "{}"', __dir, __uia, A_ScriptFullPath))
	ExitApp()
}

InstallKeybdHook(true, true)

CoordMode("ToolTip", "Screen")
CoordMode("Mouse", "Screen")


#Include <System\Paths>
#Include <Common\Helpers>
#Include <Misc\CommandRunner>
#Include <Misc\Mode>
#Include <Apps\All>
#Include <Keyboards\I44>

#Include Hotkeys\Global.ahk
#Include Hotkeys\Modes\Normal.ahk
#Include Hotkeys\Modes\Insert.ahk
#Include Hotkeys\Modes\Symbol.ahk
#Include Hotkeys\Modes\Mouse.ahk
#Include Hotkeys\Modes\Select.ahk

#Include Misc\Hotstrings.ahk
#Include Misc\Commands.ahk


Mode.Show()

I44.EnableAhk(&err)
ThrowIfError(err)

OnExit(DisableAhk)



DisableAhk(exitReason, _) {
	if exitReason == "Reload" || exitReason == "Single" {
		return
	}
	
	I44.DisableAhk(&_)
}

