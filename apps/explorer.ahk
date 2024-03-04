class Explorer {
	static _processName     := "explorer.exe"
	static _winProcessName  := "ahk_exe explorer.exe"
	static _fullProcessName := "C:\Windows\explorer.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static Run(folder := "", &err := "") {
		if !IsSet(err) {
			err := ""
		}
		
		if StrIsEmptyOrWhiteSpace(folder) {
			SendInput("#e")
			return
		}
	
		if !Paths.TryFind(folder, &path) {
			err := "folder not found"
			return
		}
		
		Run(Format('"{1}" "{2}"', this._fullProcessName, path))
	}

	static TryGetPath(&path, clsid := false) {
		path := ""
		explorerHwnd := WinActive(this._winProcessName)
		
		if !explorerHwnd {
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
			
			p := window.Document.Folder.Self.Path
		
			if !clsid && SubStr(p, 1, 2) == "::" {
				return false
			}
		
			path := p
			return true
		}
		
		return false
	}
	
	
	; --- Shortcuts ---
	
	static FocusOnAddressBar() => SendInput("!d")
	
	static CloseTab() => SendInput("^w")
	
	static NextTab() => SendInput("^{tab}")
	
	static PreviousTab() => SendInput("^+{tab}")
	
	static NewTab() => SendInput("^t")
	
	static CreateFolder() => SendInput("+^n")
}