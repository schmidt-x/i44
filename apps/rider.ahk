class Rider {
	
	static _processName := "ahk_exe rider64.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._processName)
	
	static ToggleBreakpoint() => SendInput("{F9}")
	
	static ParameterInfo() => SendInput("^p")
	
	static UnfoldBlockOfCode() => SendInput("^=")
	
	static FoldBlockOfCode() => SendInput("^-")
	
	static CloseTab() => SendInput("^{F4}")
	
	static ErrorDescription() => SendInput("^{F1}")
	
	static GoToDeclaration() => SendInput("^b") ; go to declaration or usages
	
	static GoToImplementation() => SendInput("^!b") ; go to implementation
	
	static CopyCursorUp() => SendInput("^w") ; copy caret above
	
	static CopyCursorDown() => SendInput("^e") ; copy caret below
	
	static GoBack() => SendInput("^{NumpadSub}") ; go back
	
	static GoForward() => SendInput("^+{NumpadSub}") ; go forward
	
	static QuickDocumentation() => SendInput("^q") ; quick documentation
	
	static CommentLine() => SendInput("^/") ; comment line
	
	static ContextActions() => SendInput("!{Enter}") ; context actions
	
	static NextTab() => SendInput("!{right}")
	
	static PreviousTab() => SendInput("!{left}")
	
	static MoveLineUp() => SendInput("!+{up}")
	
	static MoveLineDown() => SendInput("!+{down}")
	
	static ReopenLastClosedTab() => SendInput("^+t") ; reopen last closed tab
	
	static NewFile() => SendInput("^{insert}") ; insert new file/code
	
	
	; --- Tool Windows ---
	
	static ToggleExplorer() => SendInput("!1")
	
	static ToggleTerminal() => SendInput("^!1")
	
	static ToggleDebug() => SendInput("!5")
	
	static ToggleDbExplorer() => SendInput("^!3")
	
	static ToggleUnitTests() => SendInput("!8")
	
	static ILViewer() => SendInput("^!2")
	
	static ToggleServices() => SendInput("^!4")
	
	; --- ---
	
	
	static OpenSettings() => SendInput("^!s")
	
	static RestorePackages() => SendInput("^{F9}")
	
	static BuildSolution() => SendInput("^!+o")
	
	static ReformatCode() => SendInput("^!i")
	
	static FoldAll() => SendInput("^ma")
	
	static UnfoldAll() => SendInput("^mx")
	
	static ToggleToolbar() => SendInput("^{Numpad2}")
	
	static ToTabs() => SendInput("^{6}") ; reformat spaces to tabs
	
	static Refresh() {
		; It's the same key as for ErrorDescription. 
		; Replace with ^!5 if something goes buggy
		
		SendInput("^{F1}") ; Other/Refresh/ ('refresh Database Explorer' is derived)
	}
	
	
	; --- Debugger ---
	
	static RerunDebugger() => SendInput("^+{F5}") ; Other/Touchbar/Debugger/Rerun
	
	static StopDebugger() => SendInput("+{F5}") ; Other/Touchbar/Debugger/Stop
	
	static StepOut() => SendInput("+{F11}") ; Main Menu/Run/Debugger Actions/Step Out
	
	static StepOver() => SendInput("{F10}") ; Main Menu/Run/Debugger Actions/Step Over
	
	static StepInto() => SendInput("{F11}") ; Main Menu/Run/Debugger Actions/Step Into
	
	; --- ---
	
	
	
}