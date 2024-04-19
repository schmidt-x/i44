#Requires AutoHotkey v2.0
#Hotstring EndChars `t`s
#SingleInstance
#UseHook

Splitpath(A_AhkPath, &__name, &__dir)
__uia := "AutoHotkey64_UIA.exe"

if (__name !== __uia) {
	Run(Format('"{1}\{2}" "{3}"', __dir, __uia, A_ScriptFullPath))
	return
}


CoordMode("ToolTip")
CoordMode("Mouse")


#Include <System\Paths>
#Include <System\Constants>
#Include <Common\Helpers>
#Include <Misc\CommandRunner>
#Include <Misc\Mode>
#Include <Apps\All>

#Include Hotkeys\Global.ahk
#Include Hotkeys\Modes\Normal.ahk
#Include Hotkeys\Modes\Insert.ahk
#Include Hotkeys\Modes\Symbol.ahk
#Include Hotkeys\Modes\Mouse.ahk
#Include Hotkeys\Modes\Select.ahk

#Include Misc\Hotstrings.ahk
#Include Misc\Commands.ahk


Mode.Show()

