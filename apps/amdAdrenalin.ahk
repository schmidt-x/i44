class AmdAdrenalin {
	
	static _processName     := "RadeonSoftware.exe"
	static _winProcessName  := "ahk_exe RadeonSoftware.exe"
	static _fullProcessName := "C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe"
	
	static ToggleRecording() => SendInput("^+d")
	
	static SaveInstantReplay() {
		amdPID := ProcessExist(this._processName)
		
		if !amdPID
			return
		
		Run(this._fullProcessName)
		
		if !WinWaitActive("ahk_pid " . amdPID, , 2)
			return
		
		SendInput("^+s")
		Explorer.Run(Paths.Radeon)
	}
}