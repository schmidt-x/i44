class Helper {
	
	static RunCalc() => Run("calc")
	
	static RunCmd(folder, &err) {
		if !IsSet(err) {
			err := ""
		}
		
		if this.StrIsEmptyOrWhiteSpace(folder) {
			Run("cmd", Paths.User)
			return
		}
		
		if !Paths.TryGetFolderPath(folder, &p) {
			err := "folder not found"
			return
		}
		
		Run("cmd", p)
	}
	
	static ScrollUp() {
		this.MoveMouseToCenter()
		SendInput("{WheelUp 2}")
	}
		
	static ScrollDown() {
		this.MoveMouseToCenter()
		SendInput("{WheelDown 2}")
	}
	
	static Display(text, removeAfter := 1000, whichTooltip := 1, X := 0, Y := 0) {
		ToolTip(text, X, Y, whichTooltip)
		SetTimer(() => ToolTip(, , , whichTooltip), -removeAfter)
	}
	
	static MoveMouseToCenter() {
		; if (hwnd := WinExist("A")) == false {
			; return
		; }
		; WinGetPos(&x, &y, &width, &height, hwnd)
		
		WinGetPos(&x, &y, &width, &height, "A")
		MouseMove(x + width/2, y + height/2)
	}
	
	static ClipSend(str) {
		prevClip := ClipboardAll()
		A_Clipboard := str
		SendInput("{ctrl down}v{ctrl up}")
		SetTimer(() => A_Clipboard := prevClip, -50)
	}
	
	static DisplayInfoOnHover() {
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
	
	static StrIsEmptyOrWhiteSpace(str) {
		len := StrLen(str)
		
		if !len {
			return true
		}
		
		Loop len {
			if SubStr(str, A_Index, 1) != A_Space {
				return false
			}
		}
		
		return true
	}

	static MoveCursorToFileBeginning() => SendInput("^{Home}")
	
	static MoveCursorToFileEnd() => SendInput("^{End}")
	
	
	; --- Blind Input ---
		
	static SendBlindUp() => SendInput("{Blind}{Up}")
	
	static SendBlindDown() => SendInput("{Blind}{Down}")
	
	static SendBlindEnter() => SendInput("{Blind}{Enter}")
}