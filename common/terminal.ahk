class Terminal {
	
	static _terminal     := Gui()
	static _terminalEdit := unset
	static _funcs        := Map()
	static _prevWinId    := 0
	
	static __New() {
		this.init_funcs()
		this.init_terminal()
	}
	
	static IsActive => WinActive(this._terminal.Hwnd)
	
	static Show() {
		/*
		this._prevWinId := WinActive("A")
		
		if this._prevWinId ; it will be zero if there is no window opened
			WinGetPos(&x, , &w, , this._prevWinId)
		else
			x := 0, w := 0
		
		* xCenter = 1920/2 => +-960 -- center of a screen.
		* 180 + 46 -- width of an Edit + border of the main Gui (which is made transparent).
		* Choose the screen to display Gui on, depending on the center of the active window.
		
		if (x + w/2) < 0 { ; the center of the active window
			pos := "y1020 x-1073" ; -960 - (226/2) = middle of the left screen
		} else {
			pos := "y1020 x847"   ;  960 - (226/2) = middle of the right screen
		}
		*/
		
		this._terminal.Show("y1020 x847")
	}
	
	static ClearAndHide() {
		this._terminalEdit.Value := ""
		Sleep(1)
		this._terminal.Hide()
	}
	
	static ExecuteAndHide() {
		key := this._terminalEdit.Value
		this.ClearAndHide()
		
		if this._prevWinId {
			WinWaitActive(this._prevWinId, , 2)
			this._prevWinId := 0
		}
		
		parts := StrSplit(key, "`s", , 2)
		
		if parts.Length > 1 {
			this._funcs[parts[1]](this, parts[2])
		} else {
			this._funcs[key](this)
		}
	}
	
	
	; --- initialization ---
	
	static init_funcs() {
		this._funcs.Set(
			"code",  this.code,
			"cmd",   this.cmd,
			"edit",  this.edit,
			"sv",    this.sv,
			"tt",    this.tt,
			"tb",    this.tb,
			"rf",    this.rf,
			"mic",   this.mic,
			"info",  this.info,
			"rat",   this.rat,
			"bs",    this.bs,
			"rp",    this.rp,
			"ox",    this.ox,
			"tgl",   this.tgl,
			"obsid", this.obsid,
			"exp",   this.exp,
			"tg-",   this.tg_minus,
			"tg",    this.tg,
			"inlh",  this.inlh,
			"stm+",  this.stm_plus,
			"stm-",  this.stm_minus,
		)
		
		this._funcs.Default := this.default
	}
	
	static init_terminal() {
		this._terminal.Opt("+AlwaysOnTop -Caption +ToolWindow")
		this._terminal.BackColor := "000000"
		WinSetTransColor(this._terminal.BackColor . " 230", this._terminal.Hwnd)
		this._terminal.SetFont("s18 c0xbdbdbd", "JetBrains Mono Regular")
		this._terminalEdit := this._terminal.AddEdit("Background171717 -E0x255 Center w180 h32")
	}
	
	
	; --- FUNCS ---
	
	static default(*) {
		ToolTip("key not found", 0, 1050)
		HideTooltipDelayed(2000)
	}
	
	static code(folder := "") => VsCode.Run(folder)
	
	static cmd(folder := "") => Windows.RunCmd(folder)

	static sv(*) => SaveAndRunScript()
	
	static tt(*) {
		switch {
		case Rider.IsActive:  Rider.ToTabs()
		case Goland.IsActive: Goland.ToTabs()
		case VsCode.IsActive: VsCode.ToTabs()
		}
	}
	
	static tb(*) {
		switch {
		case Rider.IsActive:  Rider.ToggleToolbar()
		case Goland.IsActive: Goland.ToggleToolbar()
		}
	}
	
	static rf(*) {
		switch {
		case Rider.IsActive: Rider.ReformatCode()
		}
	}
	
	static edit(*) {
		VsCode.OpenCurrentScript()
	}
	
	static mic(*) { ; run Adobe Audition
		Run("D:\Files\123.sesx")
	}
	
	static info(*) => DisplayInfoOnHover()
	
	static rat(*) {
		switch {
		case OperaGX.IsActive: OperaGX.ReloadAllTabs()
		}
	}

	static bs(*) {
		switch {
		case Rider.IsActive: Rider.BuildSolution()
		}
	}

	static rp(*) {
		switch {
		case Rider.IsActive: Rider.RestorePackages()
		}
	}

	static ox(word := "") => OperaGX.OxfordSearch(word)
	
	static tgl(*) => Mode.ToggleDisplay()
	
	static obsid(*) => Obsidian.Run()
	
	static exp(folder := "") => Explorer.Run(folder)
	
	static tg(*) => Telegram.Open()
	
	static tg_minus(*) => Telegram.Close()
	
	static inlh(*) {
		switch {
		case Rider.IsActive: Rider.ToggleInlayHints()
		}
	}
	
	static stm_plus(*) => Steam.Run()
	
	static stm_minus(*) => Steam.Close()
}

