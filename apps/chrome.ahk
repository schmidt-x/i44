class Chrome {
	static _processName := "ahk_exe chrome.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._processName)
	
	static NewTab() => SendInput("^t")
	
	static CloseTab() => SendInput("^w")
	
	static ReloadTab() => SendInput("^r")
	
	static NextTab() => SendInput("^{PgDn}") ; next tab
	
	static PreviousTab() => SendInput("^{PgUp}") ; previous tab
	
	static MoveTabRight() => SendInput("^+{PgDn}")
	
	static MoveTabLeft() => SendInput("^+{PgUp}")
	
	static GoBack() => SendInput("!{left}")
	
	static GoForward() => SendInput("!{right}")
	
	
	; static FocusOnAddressBar() => SendInput("^{F5}") ; Move cursor to the address bar
}