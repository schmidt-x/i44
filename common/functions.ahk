HideTooltipDelayed(delay := 1000) => SetTimer(ToolTip, -delay)

Display(text, X := 0, Y := 1050, removeAfter := 1000) {
	ToolTip(text, X, Y)
	HideTooltipDelayed(removeAfter)
}

GetProcessName() {
	processName := WinGetProcessName("A")
	A_Clipboard := processName
	
	ToolTip("Process name is saved to clipboard", 0, 1050)
	HideTooltipDelayed(1000)
}

MoveMouseToCenter() {
	WinGetPos(&x, &y, &width, &height, "A")
	MouseMove(x + width/2, y + height/2) ; move mouse to the center
}

ClipSend(strToSend) {
	prevClip := ClipboardAll()
	A_Clipboard := strToSend
	SendInput("{ctrl down}v{ctrl up}")
	SetTimer(() => A_Clipboard := prevClip, -50)
}

SaveAndRunScript() {
	SendInput("^s") ; save the changes
	Sleep(100)
	Run(A_ScriptFullPath) ; run the current script
}

DisplayInfoOnHover() {
	xPrev := 0
	yPrev := 0
	
	Loop {
		MouseGetPos(&x, &y, &id, &control)
		
		if x != xPrev || y != yPrev {
			ToolTip(
				"id: " . id
				"`npid: " . WinGetPID(id)
				"`nprocess: " . WinGetProcessName(id)
				"`npath: " . WinGetProcessPath(id)
				"`nx: " . x 
				"`ny: " . y
				"`ncontrol: " . control
				"`ntitle: " . WinGetTitle(id)
				"`ntext: " . WinGetText(id)
				)
			
			xPrev := x
			yPrev := y
		}
		
		Sleep(1)
		
		if GetKeyState("Esc") {
			ToolTip() ; turn off the ToolTip
			return
		}
	}
}

IsQuoted(str) {
	return SubStr(str, 1, 1) = '"' 
		&& SubStr(str, StrLen(str), 1) = '"'
}