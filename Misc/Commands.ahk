class Commands {
	
	static __New() {
		CommandRunner.AddCommands(
			"mic",  this._Mic,
			"calc", this._RunCalc,
			"tt",   this._Tt,
			"tb",   this._Tb,
			"rat",  this._Rat,
			"bs",   this._Bs,
			"rb",   this._Rp,
			"inlh", this._Inlh,
		)
	}
	
	static _Mic(*) => Run("D:\Files\123.sesx") ; run Adobe Audition
	
	static _RunCalc(*) => Run("calc")
	
	static _Tt(*) {
		switch {
		case Rider.IsActive:  Rider.ToTabs()
		case VsCode.IsActive: VsCode.ToTabs()
		}
	}
	
	static _Tb(*) {
		switch {
		case Rider.IsActive:  Rider.ToggleToolbar()
		}
	}
	
	static _Rat(*) {
		switch {
		case OperaGX.IsActive: OperaGX.ReloadAllTabs()
		}
	}
	
	static _Bs(*) {
		switch {
		case Rider.IsActive: Rider.BuildSolution()
		}
	}

	static _Rp(*) {
		switch {
		case Rider.IsActive: Rider.NugetRestore()
		}
	}
	
	static _Inlh(*) {
		switch {
		case Rider.IsActive: Rider.ToggleInlayHints()
		}
	}
}