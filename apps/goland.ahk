class Goland {
	static _processName     := "goland64.exe"
	static _winProcessName  := "ahk_exe goland64.exe"
	static _fullProcessName := "C:\Users\" . A_UserName . "\AppData\Local\JetBrains\Toolbox\apps\Goland\ch-0\233.13135.104\bin\goland64.exe"
	static _projects        := Map()
	
	static __New() {
		this.init_projects()
	}
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static Run(projName := "") {
		if StrIsEmptyOrWhiteSpace(projName) {
			if !WinExist(this._winProcessName)
				Run(this._fullProcessName)
			
			return
		}
		
		proj := this._projects[projName]
		
		if !proj {
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
	
	
	; --- Shortcuts ---
	
	static OpenSettings() => SendInput("^,")
	
	static Collapse() => SendInput("+^[")
	
	static Expand() => SendInput("+^]")
	
	static CollapseAll() => SendInput("^k^0")
	
	static ExpandAll() => SendInput("^k^j")
	
	static MoveCaretToMatchingBrace() => SendInput("+^\")
	
	static ParameterInfo() => SendInput("+^{Space}")
	
	static CloseTab() => SendInput("^w")
	
	static ErrorDescription() => SendInput("^{F1}")
	
	static GoToDeclarationOrUsages() => SendInput("{F12}")
	
	static GoToImplementation() => SendInput("^{F12}")
	
	static QuickDocumentation() => SendInput("^k^i")
	
	static CommentLine() => SendInput("^/")
	
	static ContextActions() => SendInput("^.")
	
	static ToggleBreakpoint() => SendInput("{F9}")
	
	static NextTab() => SendInput("^{PgDn}")
	
	static PreviousTab() => SendInput("^{PgUp}")
	
	static ReopenLastClosedTab() => SendInput("+^t")
	
	static NewFile() {
		SendInput("{LAlt Down}{Ins}")
		SendInput("{Blind}{LAlt Up}")
	}
	
	static ExtendSelection() => SendInput("+!{Right}")
	
	static ShrinkSelection() {
		; modified
		; name:
		; default: +^w
		SendInput("+!{Left}")
	}
	
	static CloneCaretAbove() => SendInput("!^{Up}")
	
	static CloneCaretBelow() => SendInput("!^{Down}")
	
	static DuplicateLineOrSelection() => SendInput("^d")
	
	; --- Tool Windows ---
	
	static Project() => SendInput("+^e")
	
	static Terminal() => SendInput("^``")
	
	static Debug() => SendInput("+^d")
	
	static Database() => SendInput("!1")
	
	static Commit() => SendInput("!0")
	
	static Structure() => SendInput("!7")
	
	; --- ---
	
	static ToggleToolbar() => SendInput("^{Numpad2}")
	
	static ToTabs() => SendInput("^{Numpad0}")
	
	
}