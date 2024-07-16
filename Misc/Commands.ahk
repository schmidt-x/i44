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
			"b2h",   this._B2H.Bind(this),
			"b2d",   this._B2D.Bind(this),
			"fkeys", this._Fkeys.Bind(this),
		)
	}
	
	
	static _Calc(*) => Run("calc")
	
	static _Tt(&_, hwnd, &output) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToTabs()
		case VsCode.ProcessName:
			WinActivate(hwnd)
			VsCode.ToTabs()
		default: 
			this._NotSupportedCommand(app, &output, Rider.ProcessName, VsCode.ProcessName)
		}
	}
	
	static _Tb(&_, hwnd, &output) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToggleToolbar()
		default:
			this._NotSupportedCommand(app, &output, Rider.ProcessName)
		}
	}
	
	static _Rat(&_, hwnd, &output) {
		switch app := WinGetProcessName(hwnd) {
		case OperaGX.ProcessName:
			WinActivate(hwnd)
			OperaGX.ReloadAllTabs()
		default:
			this._NotSupportedCommand(app, &output, OperaGX.ProcessName)
		}
	}
	
	static _Bs(&_, hwnd, &output) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.BuildSolution()
		default: 
			this._NotSupportedCommand(app, &output, Rider.ProcessName)
		}
	}

	static _Rp(&_, hwnd, &output) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.NugetRestore()
		default: 
			this._NotSupportedCommand(app, &output, Rider.ProcessName)
		}
	}
	
	static _Inlh(&_, hwnd, &output) {
		switch app := WinGetProcessName(hwnd) {
		case Rider.ProcessName:
			WinActivate(hwnd)
			Rider.ToggleInlayHints()
		default: 
			this._NotSupportedCommand(app, &output, Rider.ProcessName)
		}
	}
	
	static _Hid(&args, _, &output) {
		switch args {
		case "ping":
			output := I44.Ping(&ms) ? (ms " ms") : "Keyboard not responding."
		
		default:
			output := "
			(
			Wrong argument.`n
			Supported args:
			ping `t Ping the keyboard
			)"
		}
	}
	
	static _B2H(&args, _, &output) {
		res := Bin2Hex(args)
		output := (res == "") ? "Invalid input." : res
	}
	
	static _B2D(&args, _, &output) {
		res := Bin2Dec(args)
		output := (res == -1) ? "Invalid input." : res
	}
	
	; TODO: 
	static _Fkeys(&args, _, &output) {
		if StrIsEmptyOrWhiteSpace(args) {
			output := GetSupportedCommands()
			return
		}
		
		command := StrSplit(args, A_Space)[1]
		
		switch command {
			case "show":
				output := GetOutputValues()
			
			case "--on":
				SetFilterKeys(true)
				output := "Updated values:`n`n" GetOutputValues()
			
			case "--off":
				SetFilterKeys(false)
				output := "Updated values:`n`n" GetOutputValues()
			
			case "set":
				output := "TODO"
			
			default:
				output := Format("Invalid command «{}».`n`n{}", command, GetSupportedCommands())
		}
		
		GetSupportedCommands() {
			return "
			(
				show `tShow the FilterKeys values.
				set  `tSet the FilterKeys values.
				--on `tTurn FilterKeys On.
				--off`tTurn FilterKeys Off.
			)"
		}
		
		GetOutputValues() {
			FKF_FILTERKEYSON := 0x01
			FKF_AVAILABLE    := 0x02
			onBitMask := FKF_AVAILABLE | FKF_FILTERKEYSON
				
			fKeys := GetFilterKeys()
			state := fKeys.Flags & onBitMask == onBitMask
				
			return Format(
				"State:`t{}`nWait:`t{}ms`nDelay:`t{}ms`nRepeat:`t{}ms`nBounce:`t{}ms",
				state, fKeys.WaitMSec, fKeys.DelayMSec, fKeys.RepeatMSec, fKeys.BounceMSec)
		}
	}
	
	; --- helpers ---
	
	static _NotSupportedCommand(app, &output, supportedList*) {
		output := Format("App «{1}» does not support this command.`n`nApps supporting:", app)
		
		for app in supportedList {
			output .= "`n- " app
		}
	}
}