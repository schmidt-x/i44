class OS {
	
	static Sleep() => Run("rundll32.exe powrprof.dll,SetSuspendState 0,1,0")
	
	static ShutDown() => Run("shutdown /s /t 0")
	
	static RunCmd(folder := "") {
		if StrIsEmptyOrWhiteSpace(folder) {
			Run("cmd", Paths.User)
			return
		}
		
		if !Paths.TryFind(folder, &p) {
			Display("folder not found")
			return
		}
		
		Run("cmd", p)
	}
	
	
	; --- Keybindings ---
	
	static GetProcessName() => WinGetProcessName("A")
	
	static OpenClipboard() => SendInput("#v")
	
	static Redo() => SendInput("^y")
	
	static Undo() => SendInput("^z")
	
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
	
	static MoveWindowToLeftScreen() => SendInput("#+{left}")
	
	static MoveWindowToRightScreen() => SendInput("#+{right}")
	
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
	
	static MoveToBeginning() => SendInput("^{Home}")
	
	static MoveToEnd() => SendInput("^{End}")
}