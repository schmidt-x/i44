class Steam {
	static _processName     := "steam.exe"
	static _fullProcessName := "C:\Program Files (x86)\Steam\steam.exe"
	
	static Run() => Run(this._fullProcessName)
	
	static Close() {
		if steamPID := ProcessExist(this._processName)
			ProcessClose(steamPID)
	}
}