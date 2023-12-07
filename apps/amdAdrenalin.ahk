class AmdAdrenalin {
	
	static _processName := "RadeonSoftware.exe"
	static _processNameAhk := "ahk_exe RadeonSoftware.exe"
	static _processPath := "C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe"
	
	static ToggleRecording() => SendInput("^+d")
	
	static SaveInstantReplay() {
		amdPID := ProcessExist(this._processName)
		
		if !amdPID
			return
		
		Run(this._processPath)
		
		if !WinWaitActive("ahk_pid " . amdPID, , 2)
			return
		
		SendInput("^+s")
		Explorer.Run("radeon")
	}
}