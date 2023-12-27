class Docker {
	static _processName     := "Docker Desktop.exe"
	static _fullProcessName := "C:\Program Files\Docker\Docker\Docker Desktop.exe"
	
	static Run() {
		Run(this._fullProcessName)
	}
}