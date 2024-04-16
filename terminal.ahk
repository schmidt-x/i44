class Terminal {
	static _terminal     := Gui()
	static _terminalEdit := unset
	static _funcs        := Map()
	static _prevWinId    := 0
	
	static _width  := 360
	static _height := 32
	
	static _isCenterRelative := true
	static _posX := 1920 / 2
	static _posY := 1054
	
	static _guiPaddX := unset
	static _guiPaddY := unset
	
	static __New() {
		this._InitFuncs()
		this._InitTerminal()
		
		OnMessage(WM_KEYDOWN, (wParam, lParam, msg, hwnd)
			=> this._OnKEYDOWN(this, wParam, lParam, msg, hwnd))
		
	}
	
	static IsActive => WinActive(this._terminal.Hwnd)
	
	static Open() {
		static opts := Format("x{1} y{2}"
			, this._posX - this._guiPaddX - (this._isCenterRelative ? this._width / 2 : 0)
			, this._posY - this._guiPaddY - (this._isCenterRelative ? this._height / 2 : 0)
		)
		
		this._prevWinId := WinExist("A")
		this._terminal.Show(opts)
	}
	
	
	; --- private ---
	
	static _OnKEYDOWN(_this, wParam, lParam, msg, hwnd) {
		if not _this.IsActive {
			return
		}
		
		switch wParam {
		case VK_ESCAPE: _this._Close()
		case VK_RETURN: _this._Execute()
		case VK_BACK, GetKeyState("LCtrl", "P"): SendInput("{Blind}+{Left}{Del}")
		default: return
		}
		
		return 0
	}
	
	static _Close() {
		this._terminalEdit.Value := ""
		Sleep(1)
		this._terminal.Hide()
		
		; Sometimes, the focus might be stolen by FileExplorer. Or if we were
		; focused on the desktop before opening the terminal, focus will not 
		; be returned back to the desktop, if we have any window opened.
		; Hence, we explicitly activate the previous window (if any).
		if this._prevWinId {
			WinActivate(this._prevWinId)
			this._prevWinId := 0
		}
	}
	
	static _Execute() {
		input := this._terminalEdit.Value
		this._Close()
		
		if Helper.StrIsEmptyOrWhiteSpace(input) {
			this._DisplayError("command is empty")
			return
		}
		
		; Divide it into just 2 parts and pass the arguments (if any) as a single string,
		; allowing further functions to handle those arguments the way they need to.
		parts := StrSplit(input, A_Space, , 2)
		
		func := this._funcs[parts[1]]
		if not func {
			this._DisplayError("command not found")
			return
		}
		
		if parts.Length == 1 {
			func(this)
		} else {
			func(this, parts[2])
		}
	}
	
	static _DisplayError(err) {
		; TODO: display in the terminal window or something
		Helper.Display(err)
	}
	
	
	static _InitFuncs() {
		this._funcs.Set(
			"code",    this.code,
			"cmd",     this.cmd,
			"rl",      this.rl,
			"tt",      this.tt,
			"tb",      this.tb,
			"mic",     this.mic,
			"info",    this.info,
			"rat",     this.rat,
			"bs",      this.bs,
			"rp",      this.rp,
			"tgl",     this.tgl,
			"obsid",   this.obsid,
			"exp",     this.exp,
			"tg-",     this.tg_minus,
			"tg",      this.tg,
			"inlh",    this.inlh,
			"stm",     this.stm,
			"stm-",    this.stm_minus,
			"msys",    this.msys,
			"rider",   this.rider,
			"docker",  this.docker,
			"chrome",  this.chrome,
			"gx",      this.gx,
			"discord", this.discord,
			"calc",    this.calc,
		)
		
		this._funcs.Default := ""
	}
	
	static _InitTerminal() {
		this._terminal.Opt("+AlwaysOnTop -Caption +ToolWindow")
		this._terminal.BackColor := "000000"
		WinSetTransColor(this._terminal.BackColor . " 250", this._terminal.Hwnd)
		this._terminal.SetFont("s18 c0xbdbdbd", "JetBrains Mono Regular")
		
		editOpts := Format("Background171717 -E0x255 Center w{1} h{2}", this._width, this._height)
		this._terminalEdit := this._terminal.AddEdit(editOpts)
		
		; get the actual size of the window, including its title bar, menu and borders
		this._terminal.Show("Hide")
		this._terminal.GetPos(, , &actualWidth, &actualHeight)
		
		; calculate padding added by Gui
		this._guiPaddX := (actualWidth - this._width) / 2
		this._guiPaddY := (actualHeight - this._height) / 2
		this._terminal.Hide()
	}
	
	
	; --- funcs ---
	
	static code(args := "") {
		VsCode.Run(args, &err)
		if err {
			Helper.Display(err)
		}
	}
	
	static cmd(args := "") {
		Helper.RunCmd(args, &err)
		if err {
			Helper.Display(err)
		}
	}
	
	static mic(*) {
		Run("D:\Files\123.sesx") ; run Adobe Audition
	}

	static obsid(*) => Obsidian.Run()

	static exp(args := "") {
		Explorer.Run(args, &err)
		if err {
			Helper.Display(err)
		}
	}

	static tg(*) => Telegram.Open()
	
	static tg_minus(*) => Telegram.Close()

	static stm(*) => Steam.Run()
	
	static stm_minus(*) => Steam.Close()
	
	static msys(args := "") {
		QmkMSys.Run(args, &err)
		if err {
			Helper.Display(err)
		}
	}
	
	static rider(args := "") {
		Rider.Run(args, &err)
		if err {
			Helper.Display(err)
		}
	}
	
	static docker(*) => Docker.Run()
	
	static chrome(*) => Chrome.Run()
	
	static gx(*) => OperaGX.Run()
	
	static discord(*) => Discord.Run()

	static rl(*) => Reload()
	
	static tt(*) {
		switch {
		case Rider.IsActive:  Rider.ToTabs()
		case VsCode.IsActive: VsCode.ToTabs()
		}
	}
	
	static tb(*) {
		switch {
		case Rider.IsActive:  Rider.ToggleToolbar()
		}
	}
	
	static info(*) => Helper.DisplayInfoOnHover()
	
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
		case Rider.IsActive: Rider.NugetRestore()
		}
	}

	static tgl(*) => Mode.ToggleDisplay()
	
	static inlh(*) {
		switch {
		case Rider.IsActive: Rider.ToggleInlayHints()
		}
	}
	
	static calc(*) => Helper.RunCalc()
	
}