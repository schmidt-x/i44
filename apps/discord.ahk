class Discord {
	
	static _processName := "ahk_exe Discord.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._processName)
	
	static GoBack() => SendInput("!{left}")
	
	static GoForward() => SendInput("!{right}")
	
	
}