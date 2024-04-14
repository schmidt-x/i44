class Paths {
	
	static Qmk => this._qmk
	static User => this._user
	static Desktop => this._desktop
	static ProjectsCSharp => this._projectsCSharp
	
	
	static _desktop   := A_Desktop
	static _user      := "C:\Users\" . A_UserName
	static _study     := this._user . "\OneDrive\Study"
	static _torrent   := "D:\Torrent"
	static _radeon    := "D:\Radeon ReLive\unknown"
	static _scriptDir := A_ScriptDir
	
	static _projects        := "D:\Projects"
	static _projectsCSharp  := this._projects . "\CSharp"
	static _projectsRust    := this._projects . "\Rust"
	static _rustTestProject := this._projectsRust . "\test_proj"
	
	static _qmk          := this._user . "\qmk_firmware"
	static _qmkKeyboards := this._qmk . "\keyboards"
	static _qmkUsers     := this._qmk . "\users"
	static _qmkKbI44     := this._qmkKeyboards . "\ergohaven\imperial44"
	static _qmkKbK02     := this._qmkKeyboards . "\ergohaven\k02"
	static _qmkUsersMe   := this._qmkUsers . "\schmidt-x"
	
	static _vsCodeUser := this._user . "\AppData\Roaming\Code\User"
	
	
	static _paths := Map()
	
	static __New() {
		this._paths.Set(
			"desk",        this._desktop,
			"std",         this._study,
			"torr",        this._torrent,
			"radeon",      this._radeon,
			"proj",        this._projects,
			"proj/c#",     this._projectsCSharp,
			"proj/r",      this._projectsRust,
			"proj/r/test", this._rustTestProject,
			"qmk",         this._qmk,
			"qmk/i44",     this._qmkKbI44,
			"qmk/k02",     this._qmkKbK02,
			"qmk/usr",     this._qmkUsers,
			"qmk/usr/.",   this._qmkUsersMe,
			"ahk/i44",     this._scriptDir,
			"me",          this._user,
			"code/usr",    this._vsCodeUser,
		)
		
		this._paths.Default := ""
	}
	
	static TryGetFolderPath(folderName, &path) { ; -> bool
		path := this._paths[folderName]
		return path != ""
	}
	
	static TryGet(&path, clsid := false) { ; -> bool
		if !IsSet(path) {
			path := ""
		}
		
		explorerHwnd := WinActive("ahk_exe explorer.exe")
		if !explorerHwnd {
			return false
		}
	
		if explorerHwnd == DllCall("GetShellWindow") {
			path := this._desktop
			return true
		}
		
		title := WinGetTitle(explorerHwnd)
		
		for window in ComObject("Shell.Application").Windows {
			if window.hwnd != explorerHwnd || window.Document.Folder.Self.Name != title {
				continue
			}
			
			p := window.Document.Folder.Self.Path
		
			if !clsid && SubStr(p, 1, 2) == "::" {
				return false
			}
		
			path := p
			return true
		}
		
		return false
	}
	
	static GetSelected(&err) { ; -> string
		if !IsSet(err) {
			err := ""
		}
		
		prevClip := ClipboardAll()
		A_Clipboard := ""
		SendInput("+^c")
		
		if not ClipWait(0.5) {
			err := "timed out"
			path := ""
		} else {
			path := A_Clipboard
		}
		
		SetTimer(() => A_Clipboard := prevClip, -50)
		return path
	}
}