class Explorer {
	
	static _winProcessName  := "ahk_exe explorer.exe"
	static _fullProcessName := "C:\Windows\explorer.exe"
	
	static IsActive => WinActive(this._winProcessName)
	
	static FocusOnAddressBar() => SendInput("!d")
	
	static CloseTab() => SendInput("^w")
	
	static GoBack() => SendInput("!{left}")
	
	static GoForward() => SendInput("!{right}") ; go forward
	
	static NextTab() => SendInput("^{tab}") ; next tab
	
	static PreviousTab() => SendInput("^+{tab}") ; previous tab
	
	static NewTab() => SendInput("^t")
	
	static TryGetPath(&path) {
		explorerHwnd := this.IsActive
		
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
	
	static Run(folder) {
		if !StrLen(folder) {
			SendInput("#e")
			return
		}
		
		if !Paths.TryFind(folder, &p) {
			ToolTip("path not found", 0, 1050)
			HideTooltipDelayed()
			return
		}
		
		Run(Format('"{1}" "{2}"', this._fullProcessName, p))
	}
}