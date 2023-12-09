class Paths {
	
	static _paths := Map()
	
	static C        => "C:\"
	static D        => "D:\"
	static Desktop  => A_Desktop
	static Radeon   => "D:\Radeon ReLive\unknown"
	static Projects => "C:\Projects"
	static Study    => "C:\Study"
	static Torrent  => "D:\Torrent"
	
	static __New() {
		this._paths.Set(
			"desk",   A_Desktop,
			"std",    this.Study,
			"torr",   this.Torrent,
			"radeon", this.Radeon,
			"prj",    this.Projects,
			"C",      this.C,
			"D",      this.D,
		)
	}
	
	static TryFind(folderName, &path) {
		if !this._paths.Has(folderName) {
			path := ""
			return false
		}
		
		path := this._paths[folderName]
		return true
	}
}