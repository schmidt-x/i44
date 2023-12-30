class Goland {
	static _processName     := "goland64.exe"
	static _winProcessName  := "ahk_exe goland64.exe"
	static _fullProcessName := "C:\Users\Schmidt\AppData\Local\JetBrains\Toolbox\apps\Goland\ch-0\223.8617.58\bin\goland64.exe"
	
	static _projects := Map()
	
	static __New() {
		this.init_projects()
	}
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static Run(project := "") {
		if StrIsEmptyOrWhiteSpace(project) {
			if !WinExist(this._winProcessName)
				Run(this._fullProcessName)
			
			return
		}
		
		proj := this._projects[project]
		
		if proj == "" {
			Display("Project not found")
			return
		}
		
		Run(Format('"{1}" "{2}"', this._fullProcessName, proj))
	}
	
	
	; --- init ---
	
	static init_projects() {
		this._projects.Set(
			"test",     "C:\Projects\Go\test",
			"leetcode", "C:\Projects\Go\leetcode",
			"gitbr",    "C:\Projects\Go\git-branches",
		)
		
		this._projects.Default := ""
	}
	
	; --- ---
	
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