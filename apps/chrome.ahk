class Chrome {
	static _processName     := "chrome.exe"
	static _winProcessName  := "ahk_exe chrome.exe"
	static _fullProcessName := "C:\Program Files\Google\Chrome\Application\chrome.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	
	static Run() {
		if winHwnd := WinExist(this._winProcessName) {
			WinActivate(winHwnd)
			return
		}
		
		Run(this._fullProcessName)
	}
	
	
	; --- Shortcuts ---
	
	static NewTab() => SendInput("^t")
	
	static CloseTab() => SendInput("^w")
	
	static ReloadTab() => SendInput("^r")
	
	static NextTab() => SendInput("^{PgDn}")
	
	static PreviousTab() => SendInput("^{PgUp}")
	
	static MoveTabLeft() => SendInput("^+{PgUp}")
	
	static MoveTabRight() => SendInput("^+{PgDn}")
	
	static Forward() => SendInput("!{Right}")
	
	static Back() => SendInput("!{Left}")
}