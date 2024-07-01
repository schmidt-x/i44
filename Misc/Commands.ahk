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
			"hid",   this._Hid.Bind(this),
		)
	}
	
	
	static _Calc(*) => Run("calc")
	
	static _Tt(&_, hwnd, &msg) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToTabs()
		case VsCode.ProcessName:
			WinActivate(hwnd)
			VsCode.ToTabs()
		default: 
			this._NotSupportedCommand(app, &msg, Rider.ProcessName, VsCode.ProcessName)
		}
	}
	
	static _Tb(&_, hwnd, &msg) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToggleToolbar()
		default:
			this._NotSupportedCommand(app, &msg, Rider.ProcessName)
		}
	}
	
	static _Rat(&_, hwnd, &msg) {
		switch app := WinGetProcessName(hwnd) {
		case OperaGX.ProcessName:
			WinActivate(hwnd)
			OperaGX.ReloadAllTabs()
		default:
			this._NotSupportedCommand(app, &msg, OperaGX.ProcessName)
		}
	}
	
	static _Bs(&_, hwnd, &msg) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.BuildSolution()
		default: 
			this._NotSupportedCommand(app, &msg, Rider.ProcessName)
		}
	}

	static _Rp(&_, hwnd, &msg) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.NugetRestore()
		default: 
			this._NotSupportedCommand(app, &msg, Rider.ProcessName)
		}
	}
	
	static _Inlh(&_, hwnd, &msg) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToggleInlayHints()
		default: 
			this._NotSupportedCommand(app, &msg, Rider.ProcessName)
		}
	}
	
	static _Hid(&args, _, &msg) {
		switch args {
		case "ping":
			msg := I44.Ping(&ms) ? (ms " ms") : "Keyboard not responding."
		
		default:
			msg := "
			(
			Wrong argument.`n
			Supported args:
			ping `t Ping the keyboard
			)"
		}
	}
	
	
	
	; --- helpers ---
	
	static _NotSupportedCommand(app, &msg, supportedList*) {
		msg := Format("App «{1}» does not support this command.`n`nApps supporting:", app)
		
		for app in supportedList {
			msg .= "`n- " app
		}
	}
}