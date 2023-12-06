class Explorer {
	
	static _processName := "ahk_exe explorer.exe"
	static _pathExe := "C:\Windows\explorer.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._processName)
	
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
			path := A_Desktop
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
		
		switch folder {
		case "desk" : path := A_Desktop
		case "study": path := "C:\Study"
		case "torr":  path := "D:\Torrent"
		case "edit":  path := A_ScriptDir
		default:      path := "C:\"
		}
		
		Run(Format('"{1}" "{2}"', this._pathExe, path))
	}
}