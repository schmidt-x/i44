class Paths {
	static _paths := Map()
	
	static C                    => "C:\"
	static D                    => "D:\"
	static Desktop              => A_Desktop
	static Study                => "C:\Users\Schmidt\OneDrive\Study"
	static Torrent              => "D:\Torrent"
	static Radeon               => "D:\Radeon ReLive\unknown"
	static Projects             => "C:\Projects"
	static ProjectsCSharp       => "C:\Projects\CSharp"
	static ProjectsRust         => "C:\Projects\Rust"
	static ProjectsRustTestProj => "C:\Projects\Rust\test_proj"
	static Qmk                  => "C:\Users\" . A_UserName . "\qmk_firmware"
	static QmkKbI44             => "C:\Users\" . A_Username . "\qmk_firmware\keyboards\ergohaven\imperial44"
	static QmkKbK02             => "C:\Users\" . A_UserName . "\qmk_firmware\keyboards\ergohaven\k02"
	static QmkUsersMe           => "C:\Users\" . A_UserName . "\qmk_firmware\users\schmidt-x"
	static ScriptFullPath       => A_ScriptFullPath
	static ScriptDir            => A_ScriptDir
	static User                 => "C:\Users\" . A_UserName
	static Git                  => A_ProgramFiles . "\Git"
	
	static __New() {
		this._paths.Set(
			"C",           this.C,
			"D",           this.D,
			"desk",        A_Desktop,
			"std",         this.Study,
			"torr",        this.Torrent,
			"radeon",      this.Radeon,
			"proj",        this.Projects,
			"proj/c#",     this.ProjectsCSharp,
			"proj/r",      this.ProjectsRust,
			"proj/r/test", this.ProjectsRustTestProj,
			"qmk",         this.Qmk,
			"qmk/i44",     this.QmkKbI44,
			"qmk/k02",     this.QmkKbK02,
			"qmk/usr/.",   this.QmkUsersMe,
			"ahk/.",       this.ScriptDir,
			"me",          this.User,
			"git",         this.Git,
		)
		
		this._paths.Default := ""
	}
	
	static TryFind(folderName, &path) {
		path := this._paths[folderName]
		return path != ""
	}
}