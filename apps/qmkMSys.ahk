class QmkMSys {
	
	static _fullProcessName := "C:\QMK_MSYS\conemu\ConEmu64.exe"
	
	static Run(folder := "") {
		if StrIsEmptyOrWhiteSpace(folder) {
			Run(this._fullProcessName, Paths.VialQmk)
			return
		}
		
		if folder == "." {
			if !Explorer.TryGetPath(&path) {
				Display("path not found")
				return
			} 
			
			if SubStr(path, 1, 2) == "::" {
				Display("path is special")
				return
			}
			
			Run(this._fullProcessName, path)
			return
		}
		
		if !Paths.TryFind(folder, &p) {
			Display("folder not found")
			return
		}
		
		Run(this._fullProcessName, p)
	}
	
}