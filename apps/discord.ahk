class Discord {
	static _processName     := "Discord.exe"
	static _winProcessName  := "ahk_exe Discord.exe"
	static _fullProcessName := "C:\Users\" . A_UserName . "\AppData\Local\Discord\Update.exe --processStart Discord.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static Run() {
		if hwnd := WinExist(this._winProcessName) {
			WinActivate(hwnd)
		} else {
			Run(this._fullProcessName)
		}
	}
	
	static EditMessage() => SendInput("e")
	
	static ReplyToMessage() => SendInput("r")
	
	static NextSection() => SendInput("{F6}")
	
	static PreviousSection() => SendInput("+{F6}")
	
	static Forward() => SendInput("!{Right}")
	
	static Backward() => SendInput("!{Left}")
	
	static NavigateToCurrentCall() => SendInput("+!^v")
	
	static UploadFile() => SendInput("+^u")
}