class Goland {
	
	static ProcessName => "ahk_exe goland64.exe"
	static IsActive => WinActive(this.ProcessName)
	
	static ToggleBreakpoint() => SendInput("^{F8}")
	
	static ParameterInfo() => SendInput("^p")
	
	static UnfoldBlockOfCode() => SendInput("^=")
	
	static FoldBlockOfCode() => SendInput("^-")
	
	static CloseTab() => SendInput("^{F4}")
	
	static ErrorDescription() => SendInput("^{F1}")
	
	static GoToDeclaration() => SendInput("^b") ; go to declaration or usages
	
	static GoToImplementation() => SendInput("^!b")
	
	static CopyCursorUp() => SendInput("^w") ; copy caret above
	
	static CopyCursorDown() => SendInput("^e") ; copy caret below
	
	static GoBack() => SendInput("^!{left}") ; go back
	
	static GoForward() => SendInput("^!{right}") ; go forward
	
	static QuickDocumentation() => SendInput("^q") ; quick documentation
	
	static Redo() => SendInput("^+z") ; redo
	
	static CommentLine() => SendInput("^/") ; comment line
	
	static ContextActions() => SendInput("!{Enter}") ; context actions
	
	static NextTab() => SendInput("!{right}")
	
	static PreviousTab() => SendInput("!{left}")
	
	static MoveLineUp() => SendInput("!+{up}")
	
	static MoveLineDown() => SendInput("!+{down}")
	
	static ReopenLastClosedTab() => SendInput("^+t")
	
	static NewFile() => SendInput("^{insert}") ; insert new file/code
	
	static ToggleExplorer() => SendInput("!1")
	
	static ToggleTerminal() => SendInput("!{F12}") ; toggle Terminal
	
	static ToggleDebug() => SendInput("!5")
	
	static ToggleDbExplorer() => SendInput("^!3")
	
	static OpenSettings() => SendInput("^!s")
	
	static FoldAll() => SendInput("^+-")
	
	static UnfoldAll() => SendInput("^+=")
	
	static ToggleToolbar() => SendInput("^{Numpad2}")
	
	static ToTabs() => SendInput("^6") ; reformat spaces to tabs
	
	
}