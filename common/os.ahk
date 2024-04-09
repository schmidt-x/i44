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
	
	static ScrollUp() {
		MoveMouseToCenter()
		SendInput("{WheelUp 2}")
	}
	
	static ScrollDown() {
		MoveMouseToCenter()
		SendInput("{WheelDown 2}")
	}
	
	static MoveCursorToFileBeginning() => SendInput("^{Home}")
	
	static MoveCursorToFileEnd() => SendInput("^{End}")
	
	
	; --- Blind Input ---
	
	static SendBlindUp() => SendInput("{Blind}{Up}")
	
	static SendBlindDown() => SendInput("{Blind}{Down}")
	
	static SendBlindEnter() => SendInput("{Blind}{Enter}")
}