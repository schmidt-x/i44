class VsCode {
	
	static _winProcessName  := "ahk_exe Code.exe"
	static _fullProcessName := "C:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
	
	static IsActive => WinActive(this._winProcessName)
	
	
	static OpenCurrentScript() {
		command := Format('"{1}" "{2}"', this._fullProcessName, A_ScriptDir)
		Run(command)
	}
	
	static Run(folder) {
		if !StrLen(folder) {
			Run(this._fullProcessName)
			return
		}
		
		if folder = "." {
			if Explorer.TryGetPath(&p) ; it might return a special path though...
				Run(Format('"{1}" "{2}"', this._fullProcessName, p))
			else
				Run(this._fullProcessName)
			
			return
		}
		
		if !Paths.TryFind(folder, &p) {
			ToolTip("path not found")
			HideTooltipDelayed()
			return
		}
		
		Run(Format('"{1}" "{2}"', this._fullProcessName, p))
	}
	
	static OpenSelected() {
		prevClip := ClipboardAll()
		A_Clipboard := ""
		SendInput("^+c")
		
		if !ClipWait(1) {
			ToolTip("time out", 0, 1050)
			HideTooltipDelayed()
			return
		}
		
		path := A_Clipboard
		SetTimer(() => A_Clipboard := prevClip, -50)
		
		Run(Format('"{1}" {2}', this._fullProcessName, path))
	}
	
	static NewFile() => SendInput("^+{Insert}") ; explorer.newFile

	static UnfoldBlockOfCode() => SendInput("^=")

	static FoldBlockOfCode() => SendInput("^-")

	static CloseTab() => SendInput("^{F4}")

	static GoToDeclaration() => SendInput("{F12}")

	static CopyCursorUp() => SendInput("^!{up}") ; add cursor above
	
	static CopyCursorDown() => SendInput("^!{down}") ; add cursor below
	
	static GoBack() => SendInput("!{left}")
	
	static GoForward() => SendInput("!{right}")
	
	; This shortcut does both: Quck documentation and Error description (if there's any)
	static ShowHover() => SendInput("^k^i")
	
	static CommentLine() => SendInput("^/")
	
	static NextTab() => SendInput("^{PgDn}")
	
	static PreviousTab() => SendInput("^{PgUp}")
	
	static MoveLineUp() => SendInput("!+{up}")
	
	static MoveLineDown() => SendInput("!+{down}")
	
	static OpenSettings() => SendInput("^,")
	
	static ToggleExplorerFocus() => SendInput("^+e") ; toggle explorer focus
	
	static OpenTerminal() => SendInput("^j") ; toggle Terminal
	
	static ToggleBreakpoint() => SendInput("{F9}")
	
	static FoldAll() => SendInput("^k^0")
	
	static UnfoldAll() => SendInput("^k^j")
	
	static ReopenLastClosedTab() => SendInput("^+t")
	
	static MoveEditorLeft() => SendInput("^+{PgUp}")
	
	static MoveEditorRight() => SendInput("^+{PgDn}")
	
	static ToTabs() => SendInput("^+4")
	
	static ParameterHints() => SendInput("^+{Space}")
	
	static GoToBracket() => SendInput("^+\")
	
	static ShowNextChange() => SendInput("!{F3}") ; git
	
	static ShowPreviousChange() => SendInput("!+{F3}") ; git
	
	static GotoNextProblem() => SendInput("!{F8}")
	
	static GotoPreviousProblem() => SendInput("!+{F8}")
	
	static GotoFile() => SendInput("^p")
}
