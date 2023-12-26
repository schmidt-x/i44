class Discord {
	static _processName    := "Discord.exe"
	static _winProcessName := "ahk_exe Discord.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static GoBack() => SendInput("!{left}")
	
	static GoForward() => SendInput("!{right}")
	
	
}