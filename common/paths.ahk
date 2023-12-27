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
	static ProjectsGo     => "C:\Projects\Go"
	static Qmk            => "C:\Users\" . A_UserName . "\qmk_firmware"
	static QmkK02         => "C:\Users\" . A_UserName . "\qmk_firmware\keyboards\ergohaven\k02"
	static VialQmk        => "C:\Users\" . A_UserName . "\vial-qmk"
	static VialK02        => "C:\Users\" . A_UserName . "\vial-qmk\keyboards\ergohaven\k02"
	static ScriptFullPath => A_ScriptFullPath
	static ScriptDir      => A_ScriptDir
	static User           => "C:\Users\" . A_UserName
	static Git            => A_ProgramFiles . "\Git"
	static Rider          => "C:\Users\" . A_UserName . "\AppData\Local\JetBrains\Toolbox\apps\Rider\ch-0\232.10203.29\bin"
	
	static __New() {
		this._paths.Set(
			"C",        this.C,
			"D",        this.D,
			"desk",     A_Desktop,
			"std",      this.Study,
			"std/git",  this.StudyGit,
			"torr",     this.Torrent,
			"radeon",   this.Radeon,
			"proj",     this.Projects,
			"proj/c#",  this.ProjectsCSharp,
			"proj/go",  this.ProjectsGo,
			"qmk",      this.Qmk,
			"qmk/k02",  this.QmkK02,
			"vial-qmk", this.VialQmk,
			"vial/k02", this.VialK02,
			"ahk/.",    this.ScriptDir,
			"me",       this.User,
			"git",      this.Git,
			"rider",    this.Rider,
		)
		
		this._paths.Default := ""
	}
	
	static TryFind(folderName, &path) {
		path := this._paths[folderName]
		return path != ""
	}
}