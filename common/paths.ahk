class Paths {
	static _paths := Map()
	
	static C              => "C:\"
	static D              => "D:\"
	static Desktop        => A_Desktop
	static Study          => "C:\Study"
	static StudyGit       => "C:\Study\Git"
	static Torrent        => "D:\Torrent"
	static Radeon         => "D:\Radeon ReLive\unknown"
	static Projects       => "C:\Projects"
	static ProjectsCSharp => "C:\Projects\CSharp"
	static ProjectsRust   => "C:\Projects\Rust"
	static Qmk            => "C:\Users\" . A_UserName . "\qmk_firmware"
	static QmkK02         => "C:\Users\" . A_UserName . "\qmk_firmware\keyboards\ergohaven\k02"
	static QmkUserMe      => "C:\Users\" . A_UserName . "\qmk_firmware\users\schmidt-x"
	static VialQmk        => "C:\Users\" . A_UserName . "\vial-qmk"
	static VialK02        => "C:\Users\" . A_UserName . "\vial-qmk\keyboards\ergohaven\k02"
	static ScriptFullPath => A_ScriptFullPath
	static ScriptDir      => A_ScriptDir
	static User           => "C:\Users\" . A_UserName
	static Git            => A_ProgramFiles . "\Git"
	
	static __New() {
		this._paths.Set(
			"C",         this.C,
			"D",         this.D,
			"desk",      A_Desktop,
			"std",       this.Study,
			"std/git",   this.StudyGit,
			"torr",      this.Torrent,
			"radeon",    this.Radeon,
			"proj",      this.Projects,
			"proj/c#",   this.ProjectsCSharp,
			"proj/r",    this.ProjectsRust,
			"qmk",       this.Qmk,
			"qmk/.",     this.QmkK02,
			"qmk/usr/.", this.QmkUserMe,
			"vial-qmk",  this.VialQmk,
			"vial/.",    this.VialK02,
			"ahk/.",     this.ScriptDir,
			"me",        this.User,
			"git",       this.Git,
		)
		
		this._paths.Default := ""
	}
	
	static TryFind(folderName, &path) {
		path := this._paths[folderName]
		return path != ""
	}
}