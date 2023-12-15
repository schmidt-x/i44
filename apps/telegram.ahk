class Telegram {
	
	static _processName     := "Telegram.exe"
	static _winProcessName  := "ahk_exe Telegram.exe"
	static _fullProcessName := "C:\Users\" . A_UserName . "\AppData\Roaming\Telegram Desktop\Telegram.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static StartNewLine() => SendInput("+{Enter}")
		
	static SendMessage() =>	SendInput("{Enter}")
	
	static Open() {
		tgHwnd := WinExist(this._winProcessName)
		
		if tgHwnd {
			WinActivate(tgHwnd)
		} else {
			Run(this._fullProcessName)
		}
	}
	
	static Close() {
		if ProcessExist(this._processName)
			ProcessClose(this._processName)
	}
}