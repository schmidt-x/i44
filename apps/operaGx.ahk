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
	
	static SpeedDial() => SendInput("!{Home}")
	
	static NewTab() => SendInput("^t")
	
	static CloseTab() => SendInput("^w")
	
	static ReloadTab() => SendInput("^r")
	
	static NextTab() => SendInput("^{PgDn}") ; switch right through tabs
	
	static PreviousTab() => SendInput("^{PgUp}") ; switch left through tabs
	
	static MoveTabLeft() => SendInput("^+,") ; move tab left (vimium)
	
	static MoveTabRight() => SendInput("^+.") ; move tab right (vimium)
	
	static FindPrevious() => SendInput("^+g")
	
	static FindNext() => SendInput("^g")
	
	static DuplicateTab() {
		; modified
		; name: _
		; default: none
		SendInput("^1")
	}
	
	static ReopenLastClosedTab() => SendInput("^+t")
	
	static OpenSettings() => SendInput("^{F12}")
	
	static ReloadAllTabs() => SendInput("^+r")
	
	static ToMainWorkspace() {
		; modified
		; name: Workspaces shortcuts (main)
		; default: none
		SendInput("^2")
	}
	
	static ToChillWorkspace() {
		; modified
		; name: Workspaces shortcuts (chill)
		; default: none
		SendInput("^3")
	}
}