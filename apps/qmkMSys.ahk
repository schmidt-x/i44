class QmkMSys {
	static _fullProcessName         := "C:\QMK_MSYS\conemu\ConEmu64.exe"
	static _fullProcessNameWithArgs := 'C:\QMK_MSYS\conemu\ConEmu64.exe -NoSingle -NoUpdate -icon "C:\QMK_MSYS\icon.ico" -title "QMK MSYS" -run "C:\QMK_MSYS\usr\bin\bash.exe" -l -i -cur_console:m:""'
	
	static Run(folder := "") {
		if StrIsEmptyOrWhiteSpace(folder) {
			Run(this._fullProcessNameWithArgs, Paths.Qmk)
			return
		}
		
		if folder == "." {
			if !Explorer.TryGetPath(&path) {
				Display("path not found")
				return
			} 
			
			Run(this._fullProcessNameWithArgs, path)
			return
		}
		
		if !Paths.TryFind(folder, &p) {
			Display("folder not found")
			return
		}
		
		Run(this._fullProcessNameWithArgs, p)
	}
	
}