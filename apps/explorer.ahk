class Explorer {
	
	static _processName     := "explorer.exe"
	static _winProcessName  := "ahk_exe explorer.exe"
	static _fullProcessName := "C:\Windows\explorer.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static FocusOnAddressBar() => SendInput("!d")
	
	static CloseTab() => SendInput("^w")
	
	static NextTab() => SendInput("^{tab}")
	
	static PreviousTab() => SendInput("^+{tab}")
	
	static NewTab() => SendInput("^t")
	
	static TryGetPath(&path) {
		explorerHwnd := WinActive(this._winProcessName)
		
		if !explorerHwnd {
			path := ""
			return false
		}
	
		title := WinGetTitle(explorerHwnd)
		
		if !StrLen(title) {
			path := Paths.Desktop
			return true
		}
	
		for window in ComObject("Shell.Application").Windows {
			if window.hwnd != explorerHwnd || window.Document.Folder.Self.Name != title
				continue
			
			path := window.Document.Folder.Self.Path
			return true
		}
		
		path := ""
		return false
	}
	
	static Run(folder := "") {
		if StrIsEmptyOrWhiteSpace(folder) {
			SendInput("#e")
			return
		}
		
		if !Paths.TryFind(folder, &path) {
			Display("folder not found")
			return
		}
		
		Run(Format('"{1}" "{2}"', this._fullProcessName, path))
	}
	
	static GoBack() => SendInput("!{Left}")
	
	static GoForward() => SendInput("!{Right}")
}