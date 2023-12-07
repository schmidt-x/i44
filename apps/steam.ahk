class Steam {
	
	static _processName := "steam.exe"
	static _processPath := "C:\Program Files (x86)\Steam\steam.exe"
	
	static Run() => Run(this._processPath)
	
	static Close() {
		steamPID := ProcessExist(this._processName)
		
		if steamPID
			ProcessClose(steamPID)
	}
}