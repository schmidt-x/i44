class Rider {
	static _processName     := "rider64.exe"
	static _winProcessName  := "ahk_exe rider64.exe"
	static _fullProcessName := "C:\Users\" . A_UserName . "\AppData\Local\JetBrains\Toolbox\apps\Rider\ch-0\232.10203.29\bin\rider64.exe"
	static _projects        := Map()
	
	static __New() {
		this.init_projects()
	}
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static Run(projName := "") {
		if StrIsEmptyOrWhiteSpace(projName) {
			; It doesn't seem to have a way to open the welcome page
			; (if at least one solution is already opened)
			if !WinExist(this._winProcessName)
				Run(this._fullProcessName)
			
			return
		}
		
		proj := this._projects[projName]
		
		if proj == "" {
			Display("Project not found")
			return
		} 
		
		Run(Format('"{1}" "{2}"', this._fullProcessName, proj))
	}
	
	
	; --- init ---
	
	static init_projects() {
		this._projects.Set(
			"console", "C:\Projects\CSharp\TestConsole\TestConsole.sln",
			"web",     "C:\Projects\CSharp\TestWeb\TestWeb.sln",
			"web2",    "C:\Projects\CSharp\TestWeb2\TestWeb2.sln",
			"tgbot",   "C:\Projects\CSharp\TestTgBot\TestTgBot.sln"
		)
		
		this._projects.Default := ""
	}
	
	
	; --- Keybindings ---
	
	static ToggleBreakpoint() => SendInput("{F9}")
	
	static ParameterInfo() => SendInput("^p")
	
	static UnfoldBlockOfCode() => SendInput("^=")
	
	static FoldBlockOfCode() => SendInput("^-")
	
	static CloseTab() => SendInput("^{F4}")
	
	static ErrorDescription() => SendInput("^{F1}")
	
	static GoToDeclarationOrUsages() => SendInput("^b")
	
	static GoToImplementation() => SendInput("^!b")
	
	static CloneCaretAboveWithVirtualSpace() => SendInput("!+{up}")
	
	static CloneCaretBelowWithVirtualSpace() => SendInput("!+{down}")
	
	static GoBack() => SendInput("^{NumpadSub}")
	
	static GoForward() => SendInput("^+{NumpadSub}")
	
	static QuickDocumentation() => SendInput("^q")
	
	static CommentLine() => SendInput("^/")
	
	static ContextActions() => SendInput("!{Enter}")
	
	static NextTab() => SendInput("!{right}")
	
	static PreviousTab() => SendInput("!{left}")
	
	static MoveLineUp() => SendInput("^+!{F4}")
	
	static MoveLineDown() => SendInput("^+!{F5}")
	
	static ReopenLastClosedTab() => SendInput("^+t")
	
	static NewFile() => SendInput("^{insert}") ; insert new file/code
	
	; --- Tool Windows ---
	
	static ToggleExplorer() => SendInput("!1")
	
	static ToggleTerminal() => SendInput("^!1")
	
	static ToggleDebug() => SendInput("!5")
	
	static ToggleDbExplorer() => SendInput("^!3")
	
	static ToggleUnitTests() => SendInput("!8")
	
	static ILViewer() => SendInput("^!2")
	
	static ToggleStructure() => SendInput("^{F11}")
	
	static ToggleServices() => SendInput("^!4")
	
	static ToggleSourceControl() => SendInput("^+!2")
	
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
	
	static GotoNextError() => SendInput("{F12}")
	
	static GotoPreviousError() => SendInput("+{F12}")
	
	static SearchEverywhere() => SendInput("^n")
	
	static ToggleInlayHints() => SendInput("^+!{F1}")
	
	; --- Debugger ---
	
	static RerunDebugger() => SendInput("^+{F5}") ; Other/Touchbar/Debugger/Rerun
	
	static StopDebugger() => SendInput("+{F5}") ; Other/Touchbar/Debugger/Stop
	
	static StepOut() => SendInput("+{F11}") ; Main Menu/Run/Debugger Actions/Step Out
	
	static StepOver() => SendInput("{F10}") ; Main Menu/Run/Debugger Actions/Step Over
	
	static StepInto() => SendInput("{F11}") ; Main Menu/Run/Debugger Actions/Step Into
	
	; --- ---
	
	static PreviousMethod() {
		; Alt problem - it gets focused on Alt-panel (same as for OperaGx GoBack/GoForward)
		
		SendInput("{Alt Down}")
		SendInput("{Up}")
		SendInput("{Alt up}")
	}	
		
	static NextMethod() {
		SendInput("{Alt Down}")
		SendInput("{Down}")
		SendInput("{Alt up}")
	}
		
	static MoveCaretToMatchingBrace() => SendInput("^]") ; works only if tapped twice
	
	static ExpandSelection() => SendInput("^w")
	
	static ShrinkSelection() => SendInput("^+w")
	
}