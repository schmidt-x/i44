class Telegram {
	
	static _processName := "ahk_exe Telegram.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._processName)
	
	static StartNewLine() => SendInput("+{Enter}")
		
	static SendMessage() =>	SendInput("{Enter}")
}