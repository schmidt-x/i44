Display(text, removeAfter := 1000, whichTooltip := 1, X := 0, Y := 1050) {
	ToolTip(text, X, Y, whichTooltip)
	SetTimer(() => ToolTip(, , , whichTooltip), -removeAfter)
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

RunCurrentScript() {
	Run(Paths.ScriptFullPath) ; run the current script
}

DisplayInfoOnHover() {
	xPrev := 0
	yPrev := 0
	whichToolTip := 2
	
	Loop {
		MouseGetPos(&x, &y, &id, &control)
		
		if x != xPrev || y != yPrev {
			ToolTip(
				"id: "        . id
				"`npid: "     . WinGetPID(id)
				"`nprocess: " . WinGetProcessName(id)
				"`npath: "    . WinGetProcessPath(id)
				"`nx: "       . x 
				"`ny: "       . y
				"`ncontrol: " . control
				"`ntitle: "   . WinGetTitle(id)
				"`ntext: "    . WinGetText(id)
				, , , whichToolTip)
			
			xPrev := x
			yPrev := y
		}
		
		Sleep(1)
		
		if GetKeyState("Esc") {
			ToolTip(, , , whichToolTip) ; turn off the ToolTip
			return
		}
	}
}

IsQuoted(str) {
	return SubStr(str, 1, 1) = '"' 
		&& SubStr(str, StrLen(str), 1) = '"'
}

StrIsEmptyOrWhiteSpace(str) {
	len := StrLen(str)
	
	if !len {
		return true
	}
	
	Loop len {
		if SubStr(str, A_Index, 1) != "`s" {
			return false
		}
	}
	
	return true
}