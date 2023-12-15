class Goland {
	
	static _processName    := "goland64.exe"
	static _winProcessName := "ahk_exe goland64.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static ToggleBreakpoint() => SendInput("^{F8}")
	
	static ParameterInfo() => SendInput("^p")
	
	static UnfoldBlockOfCode() => SendInput("^=")
	
	static FoldBlockOfCode() => SendInput("^-")
	
	static CloseTab() => SendInput("^{F4}")
	
	static ErrorDescription() => SendInput("^{F1}")
	
	static GoToDeclaration() => SendInput("^b") ; go to declaration or usages
	
	static GoToImplementation() => SendInput("^!b")
	
	static CopyCursorUp() => SendInput("^w")
	
	static CopyCursorDown() => SendInput("^e")
	
	static GoBack() => SendInput("^!{left}")
	
	static GoForward() => SendInput("^!{right}")
	
	static QuickDocumentation() => SendInput("^q")
	
	static Redo() => SendInput("^+z")
	
	static CommentLine() => SendInput("^/")
	
	static ContextActions() => SendInput("!{Enter}")
	
	static NextTab() => SendInput("!{right}")
	
	static PreviousTab() => SendInput("!{left}")
	
	static MoveLineUp() => SendInput("!+{up}")
	
	static MoveLineDown() => SendInput("!+{down}")
	
	static ReopenLastClosedTab() => SendInput("^+t")
	
	static NewFile() => SendInput("^{insert}") ; insert new file/code
	
	static ToggleExplorer() => SendInput("!1")
	
	static ToggleTerminal() => SendInput("!{F12}")
	
	static ToggleDebug() => SendInput("!5")
	
	static ToggleDbExplorer() => SendInput("^!3")
	
	static OpenSettings() => SendInput("^!s")
	
	static FoldAll() => SendInput("^+-")
	
	static UnfoldAll() => SendInput("^+=")
	
	static ToggleToolbar() => SendInput("^{Numpad2}")
	
	static ToTabs() => SendInput("^6") ; reformat spaces to tabs
	
	
}