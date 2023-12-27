class Discord {
	static _processName     := "Discord.exe"
	static _winProcessName  := "ahk_exe Discord.exe"
	static _fullProcessName := "C:\Users\Schmidt\AppData\Local\Discord\Update.exe --processStart Discord.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static Run() {
		if hwnd := WinExist(this._winProcessName) {
			WinActivate(hwnd)
			return
		}
		
		Run(this._fullProcessName)
	}
	
	
	; --- Keybindings ---
	
	static GoBack() => SendInput("!{left}")
	
	static GoForward() => SendInput("!{right}")
}