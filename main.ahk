#Requires AutoHotkey v2.0
#Hotstring EndChars `t`s
; #NoTrayIcon
#SingleInstance
#UseHook

; set the ToolTip position relative to the screen
CoordMode("ToolTip")

; do the same for the Mouse
CoordMode("Mouse")

#Include system\paths.ahk
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
#Include hotkeys\apps.ahk
#Include hotkeys\modes\normal.ahk
#Include hotkeys\modes\insert.ahk
#Include hotkeys\modes\symbol.ahk
#Include hotkeys\modes\mouse.ahk
#Include hotkeys\modes\select.ahk
#Include hotstrings.ahk

