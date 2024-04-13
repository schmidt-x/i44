class Explorer {
	static _processName     := "explorer.exe"
	static _winProcessName  := "ahk_exe explorer.exe"
	static _fullProcessName := "C:\Windows\explorer.exe"
	
	static ProcessName => this._processName
	static IsActive => WinActive(this._winProcessName)
	
	static Run(folder, &err) {
		if !IsSet(err) {
			err := ""
		}
		
		if Helper.StrIsEmptyOrWhiteSpace(folder) {
			SendInput("#e")
			return
		}
	
		if !Paths.TryGetFolderPath(folder, &path) {
			err := "folder not found"
			return
		}
		
		Run(Format('"{1}" "{2}"', this._fullProcessName, path))
	}
	
	
	; --- Shortcuts ---
	
	static FocusOnAddressBar() => SendInput("!d")
	
	static CloseTab() => SendInput("^w")
	
	static NextTab() => SendInput("^{tab}")
	
	static PreviousTab() => SendInput("^+{tab}")
	
	static NewTab() => SendInput("^t")
	
	static CreateFolder() => SendInput("+^n")
}