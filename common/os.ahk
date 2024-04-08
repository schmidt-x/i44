class OS {
	
	static Sleep() => Run("rundll32.exe powrprof.dll,SetSuspendState 0,1,0")
	
	static ShutDown() => Run("shutdown /s /t 0")
	
	static RunCmd(folder := "", &err := "") {
		if !IsSet(err) {
			err := ""
		}
		
		if StrIsEmptyOrWhiteSpace(folder) {
			Run("cmd", Paths.User)
			return
		}
		
		if !Paths.TryFind(folder, &p) {
			err := "folder not found"
			return
		}
		
		Run("cmd", p)
	}
	
	static GetProcessName() => WinGetProcessName("A")
	
	
	; --- Shortcuts ---
	
	static Copy() => SendInput("^c")
	
	static Cut() => SendInput("^x")
	
	static Paste() => SendInput("^v")
	
	static ScrollUp() {
		MoveMouseToCenter()
		SendInput("{WheelUp 2}")
	}
	
	static ScrollDown() {
		MoveMouseToCenter()
		SendInput("{WheelDown 2}")
	}
	
	static SelectUp() => SendInput("+{up}")
	
	static SelectDown() => SendInput("+{down}")
	
	static SelectLeft() => SendInput("+{left}")
	
	static SelectRight() => SendInput("+{right}")
	
	static SelectLeftByWord() => SendInput("^+{left}")
	
	static SelectRightByWord() => SendInput("^+{right}")
	
	static SelectToLineBeginning() => SendInput("+{home}")
	
	static SelectToLineEnd() => SendInput("+{end}")
	
	static SelectToPageBeginning() => SendInput("+{PgUp}")
	
	static SelectToPageEnd() => SendInput("+{PgDn}")
	
	static MoveCursorToFileBeginning() => SendInput("^{Home}")
	
	static MoveCursorToFileEnd() => SendInput("^{End}")
	
	static SelectToFileBeginning() => SendInput("+^{Home}")
	
	static SelectToFileEnd() => SendInput("+^{End}")
	
	static SendBlindUp() => SendInput("{Blind}{Up}")
	
	static SendBlindDown() => SendInput("{Blind}{Down}")
	
	static SendBlindEnter() => SendInput("{Blind}{Enter}")
}