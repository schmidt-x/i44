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

#Include system\paths.ahk
#Include system\constants.ahk
#Include common\helper.ahk
#Include common\mode.ahk

#Include apps\telegram.ahk
#Include apps\obsidian.ahk
#Include apps\explorer.ahk
#Include apps\discord.ahk
#Include apps\operaGx.ahk
#Include apps\qmkMSys.ahk
#Include apps\vscode.ahk
#Include apps\chrome.ahk
#Include apps\docker.ahk
#Include apps\rider.ahk
#Include apps\steam.ahk

#Include terminal.ahk

#Include hotkeys\global.ahk
#Include hotkeys\modes\normal.ahk
#Include hotkeys\modes\insert.ahk
#Include hotkeys\modes\symbol.ahk
#Include hotkeys\modes\mouse.ahk
#Include hotkeys\modes\select.ahk
#Include hotstrings.ahk

