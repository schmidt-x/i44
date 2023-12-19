class Paths {
	
	static _paths := Map()
	
	static C        => "C:\"
	static D        => "D:\"
	static Desktop  => A_Desktop
	static Radeon   => "D:\Radeon ReLive\unknown"
	static Projects => "C:\Projects"
	static Study    => "C:\Study"
	static Torrent  => "D:\Torrent"
	static VialQmk  => "C:\Users\" . A_UserName . "\vial-qmk"
	static QmkK02   => "C:\Users\" . A_UserName . "\vial-qmk\keyboards\ergohaven\k02"
	
	static __New() {
		this._paths.Set(
			"desk",     A_Desktop,
			"std",      this.Study,
			"torr",     this.Torrent,
			"radeon",   this.Radeon,
			"prj",      this.Projects,
			"C",        this.C,
			"D",        this.D,
			"vial_qmk", this.VialQmk,
			"qmk_k02",  this.QmkK02,
		)
		
		this._paths.Default := ""
	}
	
	static TryFind(folderName, &path) {
		p := this._paths[folderName]
		
		if p == this._paths.Default {
			path := ""
			return false
		}
		
		path := p
		return true
	}
}