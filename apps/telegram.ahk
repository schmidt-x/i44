class Telegram {
	
	static _name        := "Telegram.exe"
	static _processName := "ahk_exe Telegram.exe"
	static _pathExe     := "C:\Users\" . A_UserName . "\AppData\Roaming\Telegram Desktop\Telegram.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._processName)
	
	static StartNewLine() => SendInput("+{Enter}")
		
	static SendMessage() =>	SendInput("{Enter}")
	
	static Open() {
		tgHwnd := WinExist(this._processName)
		
		if tgHwnd {
			WinActivate(tgHwnd)
		} else {
			Run(this._pathExe)
		}
	}
	
	static Close() {
		if ProcessExist(this._name)
			ProcessClose(this._name)
	}
}