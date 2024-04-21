class Commands {
	
	static __New() {
		CommandRunner.AddCommands(
			"calc",  this._Calc,
			"tt",    this._Tt.Bind(this),
			"tb",    this._Tb.Bind(this),
			"rat",   this._Rat.Bind(this),
			"bs",    this._Bs.Bind(this),
			"rp",    this._Rp.Bind(this),
			"inlh",  this._Inlh.Bind(this),
			"adobe", this._Adobe.Bind(this)
		)
	}
	
	; TODO: move to class
	static _Adobe(&args, _, &err) {
		processPath := "C:\Program Files\Adobe\Adobe Audition CC\Adobe Audition CC.exe"
		
		switch args {
		case "mic":
			Run(Format('"{1}" "D:\Files\123.sesx"', processPath))
		case "":
			Run(processPath)
		default:
			err := Format("
			(
			Arg «{1}» is not supported.`n
			Supported args:
			mic `t Open microphone
			)", args)
		}
	}
	
	static _Calc(*) => Run("calc")
	
	static _Tt(&_, hwnd, &err) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToTabs()
		case VsCode.ProcessName:
			WinActivate(hwnd)
			VsCode.ToTabs()
		default: 
			this._NotSupportedCommand(app, &err, Rider.ProcessName, VsCode.ProcessName)
		}
	}
	
	static _Tb(&_, hwnd, &err) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToggleToolbar()
		default:
			this._NotSupportedCommand(app, &err, Rider.ProcessName)
		}
	}
	
	static _Rat(&_, hwnd, &err) {
		switch app := WinGetProcessName(hwnd) {
		case OperaGX.ProcessName:
			WinActivate(hwnd)
			OperaGX.ReloadAllTabs()
		default:
			this._NotSupportedCommand(app, &err, OperaGX.ProcessName)
		}
	}
	
	static _Bs(&_, hwnd, &err) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.BuildSolution()
		default: 
			this._NotSupportedCommand(app, &err, Rider.ProcessName)
		}
		
	}

	static _Rp(&_, hwnd, &err) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.NugetRestore()
		default: 
			this._NotSupportedCommand(app, &err, Rider.ProcessName)
		}
	}
	
	static _Inlh(&_, hwnd, &err) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToggleInlayHints()
		default: 
			this._NotSupportedCommand(app, &err, Rider.ProcessName)
		}
	}
	
	
	static _NotSupportedCommand(app, &err, supportedList*) {
		err := Format("App «{1}» does not support this command.`n`nApps supporting:", app)
		
		for app in supportedList {
			err .= "`n- " app
		}
	}
}