class VsCode {
	static _processName     := "Code.exe"
	static _winProcessName  := "ahk_exe Code.exe"
	static _fullProcessName := "C:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	
	static Run(folder := "") {
		if StrIsEmptyOrWhiteSpace(folder) {
			Run(this._fullProcessName)
			return
		}
		
		if folder = "." {
			if !Explorer.TryGetPath(&p) {
				Display("path not found")
				return
			}
			
			Run(Format('"{1}" "{2}"', this._fullProcessName, p))
			return
		}
		
		if !Paths.TryFind(folder, &p) {
			Display("folder not found")
			return
		}
		
		Run(Format('"{1}" "{2}"', this._fullProcessName, p))
	}
	
	static OpenSelected() {
		prevClip := ClipboardAll()
		A_Clipboard := ""
		SendInput("^+c")
		
		if !ClipWait(1) {
			Display("time out")
			return
		}
		
		path := A_Clipboard
		SetTimer(() => A_Clipboard := prevClip, -50)
		
		Run(Format('"{1}" {2}', this._fullProcessName, path))
	}
	
	
	; --- Shortcuts ---
	
	static OpenSettings() => SendInput("^,")
	
	static Fold() => SendInput("+^[")
	
	static Unfold() => SendInput("+^]")
	
	static FoldAll() => SendInput("^k^0")
	
	static UnfoldAll() => SendInput("^k^j")
	
	static GotoBracket() => SendInput("+^\")
	
	static ParameterHints() => SendInput("+^{Space}")
	
	static CloseEditor() => SendInput("^{F4}")
	
	static GoToDefinition() => SendInput("{F12}")
	
	static GoToImplementation() => SendInput("^{F12}")
	
	; This shortcut does both: Quck documentation and Error description (if there's any)
	static ShowOrFocusHover() => SendInput("^k^i")
	
	static CommentLine() => SendInput("^/")
	
	static QuickFix() => SendInput("^.")
	
	static ToggleBreakpoint() => SendInput("{F9}") ; editor.debug.action.toggleBreakpoint
	
	static NextTab() => SendInput("^{PgDn}")
	
	static PreviousTab() => SendInput("^{PgUp}")
	
	static ReopenLastClosedTab() => SendInput("+^t")
	
	static NewFile() {
		; modified
		; name: explorer.newFile
		; default: none
		SendInput("^{Insert}")
	}
	
	static CopyCursorUp() => SendInput("^!{Up}") ; add cursor above
	
	static CopyCursorDown() => SendInput("^!{Down}") ; add cursor below
	
	static CopyLineDown() => SendInput("^d")
	
	; --- Tool Windows ---
	
	static ShowExplorer() => SendInput("^+e")
	
	static Debug() => SendInput("^+d")
	
	static Terminal() {
		; name: «View: Toggle Terminal»
		; command: workbench.action.terminal.toggleTerminal
		SendInput("^``")
	}
	
	; --- ---
	
	static ExpandSelection() => SendInput("+!{Right}")
	
	static ShrinkSelection() => SendInput("+!{Left}")
	
	; --- ---
	
	
	
	; --- ---
	
	
	static ToTabs() => SendInput("^+4")
	
	
	static ToggleSourceControl() => SendInput("^+g")
}
