class OperaGX {
	
	static _processName := "ahk_exe opera.exe"
	static _pathExe := "C:\Users\" . A_UserName . "\AppData\Local\Programs\Opera GX\opera.exe"
	
	static PathExe => this._pathExe
	static ProcessName => this._processName
	static IsActive => WinActive(this._processName)
	
	static FocusOnAddressBar() => SendInput("^l")
	
	static SpeedDial() => SendInput("!{Home}") ; (aka homepage)	
	
	static NewTab() => SendInput("^t")
	
	static CloseTab() => SendInput("^w")
	
	static ReloadTab() => SendInput("^r")
	
	static GoBack() =>
		/*
		* For some reason, in Opera Gx it opens the Alt menu (like when you tap Alt) if I do:
			SendInput("!{Left/Right}")
		* or even when:
			SendInput("{Alt down}{Left/Right}{Alt up}")
		* With the approach below, it also happens, but a little less often:
			SendInput("{Alt down}")
			SendInput("{left}")
			SendInput("{Alt up}")
		* It's typically 'Alt' problems in windows.
		* So I decided to change the shortcut in Opera GX
		*/
		SendInput("{F11}") ; back
	
	static GoForward() =>	SendInput("{F12}") ; forward
	
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
	
	static OxfordSearch(word := "") {
		static oxLink := "https://www.oxfordlearnersdictionaries.com/us/search/english/?q="
		Run(Format('"{1}" "{2}{3}"', this._pathExe, oxLink, word))
	}
	
	static ToMainWorkspace() => SendInput("^9")
	
	static ToChillWorkspace() => SendInput("^8")
}