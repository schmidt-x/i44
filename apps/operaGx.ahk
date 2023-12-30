class OperaGX {
	static _processName     := "opera.exe"
	static _winProcessName  := "ahk_exe opera.exe"
	static _fullProcessName := "C:\Users\" . A_UserName . "\AppData\Local\Programs\Opera GX\opera.exe"
	
	static ProcessName     => this._processName
	static WinProcessName  => this._winProcessName
	static FullProcessName => this._fullProcessName
	
	static IsActive => WinActive(this._winProcessName)
	
	
	static Run() {
		if hwnd := WinExist(this._winProcessName) {
			WinActivate(hwnd)
			return
		}
		
		Run(this._fullProcessName)
	}
	
	
	; --- Keybindings ---
	
	static FocusOnAddressBar() => SendInput("^l")
	
	static SpeedDial() => SendInput("!{Home}") ; (aka homepage)	
	
	static NewTab() => SendInput("^t")
	
	static CloseTab() => SendInput("^w")
	
	static ReloadTab() => SendInput("^r")
	
	static NextTab() => SendInput("^{PgDn}") ; switch right through tabs
	
	static PreviousTab() => SendInput("^{PgUp}") ; switch left through tabs
	
	static MoveTabLeft() => SendInput("^+,") ; move tab left (vimium)
	
	static MoveTabRight() => SendInput("^+.") ; move tab right (vimium)
	
	static FindPrevious() => SendInput("^+g") ; find previous
	
	static FindNext() => SendInput("^g") ; find next
	
	static DuplicateTab() => SendInput("^1") ; duplicate tab
	
	static ReopenLastClosedTab() => SendInput("^+t") ; reopen last closed tab or window
	
	static OpenSettings() => SendInput("^{F12}")
	
	static ReloadAllTabs() => SendInput("^+r")
	
	static ToMainWorkspace() => SendInput("^9")
	
	static ToChillWorkspace() => SendInput("^8")
}