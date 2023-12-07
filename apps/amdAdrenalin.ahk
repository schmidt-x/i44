class AmdAdrenalin {
	
	static _name := "RadeonSoftware.exe"
	static _processName := "ahk_exe RadeonSoftware.exe"
	static _pathExe := "C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe"
	
	static ToggleRecording() => SendInput("^+d")
	
	static SaveInstantReplay() {
		amdPID := ProcessExist(this._name)
		
		if !amdPID
			return
		
		Run(this._pathExe)
		
		if !WinWaitActive("ahk_pid " . amdPID, , 2)
			return
		
		SendInput("^+s")
		Explorer.Run("radeon")
	}
}