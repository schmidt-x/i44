class Obsidian {
	
	static _processName     := "Obsidian.exe"
	static _winProcessName  := "ahk_exe Obsidian.exe"
	static _fullProcessName := "C:\Users\" . A_UserName . "\AppData\Local\Obsidian\Obsidian.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static UnfoldBlockOfCode() => SendInput("^=")
	
	static FoldBlockOfCode() => SendInput("^-")
	
	static CloseTab() => SendInput("^w")
	
	static ToggleReadingMode() => SendInput("^e")
	
	static GoBack() => SendInput("^!{left}") ; go back
	
	static GoForward() => SendInput("^!{right}") ; go forward
	
	static NextTab() => SendInput("^{PgDn}") ; next tab
	
	static PreviousTab() => SendInput("^{PgUp}") ; previous tab
	
	static MoveLineUp() => SendInput("!+{up}") ; move line up
	
	static MoveLineDown() => SendInput("!+{down}") ; move line down
	
	static FindPrevious() => SendInput("+{F3}") ; find previous
	
	static FindNext() => SendInput("{F3}") ; find next
	
	static ExplorerFocus() => SendInput("!1") ; open explorer
	
	static ShowOutline() => SendInput("!3") ; show outline (focus on the right side bar)
	
	static OpenSettings() => SendInput("^,") ; open settings
	
	static FoldAll() => SendInput("^+-")
	
	static UnfoldAll() => SendInput("^+=")
	
	static SendBoldLink() => SendInput("[****]({left 4}")
	
	static SendSpoilerBlock() => SendInput("``````spoiler-block`n")
	
	static Run() {
		Run(this._fullProcessName)
	}
}