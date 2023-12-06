class VsCode {
	
	static _processName := "ahk_exe Code.exe"
	static _pathExe := "C:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
	
	
	static PathExe => this._pathExe
	static ProcessName => this._processName
	static IsActive => WinActive(this._processName)
	
	
	static OpenCurrentScript() {
		command := Format('"{1}" "{2}"', this._pathExe, A_ScriptDir)
		Run(command)
	}
	
	static Run(path) {
		if !StrLen(path) {
			Run(this._pathExe)
			return
		}
		
		if path = "." {
			if Explorer.TryGetPath(&p)
				Run(Format('"{1}" "{2}"', this._pathExe, p))
			else
				Run(this._pathExe)
			
			return
		}
		
		if IsQuoted(path)
			Run(Format('"{1}" {2}', this._pathExe, path))
		else
			Run(Format('"{1}" "{2}"', this._pathExe, path))
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
		
		Run(Format('"{1}" {2}', this._pathExe, path))
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
}
