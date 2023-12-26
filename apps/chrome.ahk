class Chrome {
	static _processName    := "chrome.exe"
	static _winProcessName := "ahk_exe chrome.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static NewTab() => SendInput("^t")
	
	static CloseTab() => SendInput("^w")
	
	static ReloadTab() => SendInput("^r")
	
	static NextTab() => SendInput("^{PgDn}") ; next tab
	
	static PreviousTab() => SendInput("^{PgUp}") ; previous tab
	
	static MoveTabRight() => SendInput("^+{PgDn}")
	
	static MoveTabLeft() => SendInput("^+{PgUp}")
	
	static GoBack() => SendInput("!{left}")
	
	static GoForward() => SendInput("!{right}")
	
}