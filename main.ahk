#Requires AutoHotkey v2.0
#SingleInstance
#UseHook

; set the ToolTip position relative to the screen
CoordMode("ToolTip")

; do the same for the Mouse
CoordMode("Mouse")

#Include hotkeys\global.ahk
#Include hotkeys\apps.ahk
#Include hotkeys\modes\insert.ahk
#Include hotkeys\modes\normal.ahk
#Include hotkeys\modes\select.ahk
#Include hotkeys\modes\mouse.ahk

#Include common\hotstrings.ahk
#Include common\functions.ahk
#Include common\terminal.ahk
#Include common\mode.ahk

#Include apps\amdAdrenalin.ahk
#Include apps\telegram.ahk
#Include apps\obsidian.ahk
#Include apps\explorer.ahk
#Include apps\discord.ahk
#Include apps\windows.ahk
#Include apps\operaGx.ahk
#Include apps\goland.ahk
#Include apps\vscode.ahk
#Include apps\chrome.ahk
#Include apps\rider.ahk
#Include apps\steam.ahk
