class Paths {
	
	static _paths := Map()
	
	static C              => "C:\"
	static D              => "D:\"
	static Desktop        => A_Desktop
	static Radeon         => "D:\Radeon ReLive\unknown"
	static Projects       => "C:\Projects"
	static Study          => "C:\Study"
	static Torrent        => "D:\Torrent"
	static VialQmk        => "C:\Users\" . A_UserName . "\vial-qmk"
	static QmkK02         => "C:\Users\" . A_UserName . "\vial-qmk\keyboards\ergohaven\k02"
	static ScriptFullPath => A_ScriptFullPath
	static ScriptDir      => A_ScriptDir
	static User           => "C:\Users\" . A_UserName
	static Git            => A_ProgramFiles . "\Git"
	
	static __New() {
		this._paths.Set(
			"desk",     A_Desktop,
			"std",      this.Study,
			"torr",     this.Torrent,
			"radeon",   this.Radeon,
			"proj",     this.Projects,
			"C",        this.C,
			"D",        this.D,
			"vial-qmk", this.VialQmk,
			"qmk/k02",  this.QmkK02,
			"ahk/.",    this.ScriptDir,
			"me",       this.User,
			"git",      this.Git,
		)
		
		this._paths.Default := ""
	}
	
	static TryFind(folderName, &path) {
		path := this._paths[folderName]
		return path != ""
	}
}