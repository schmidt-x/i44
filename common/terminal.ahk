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
	
	static _gui_padd_x := 23
	static _gui_padd_y := 14
	
	static __New() {
		this.init_funcs()
		this.init_terminal()
	}
	
	static IsActive => WinActive(this._terminal.Hwnd)
	
	static Open() {
		static terminal_pos := Format("x{1} y{2}"
			, this._posX - this._gui_padd_x - (this._isCenterRelative ? this._width / 2 : 0)
			, this._posY - this._gui_padd_y - (this._isCenterRelative ? this._height / 2 : 0)
		)
		
		this._prevWinId := WinExist("A")
		this._terminal.Show(terminal_pos)
	}
	
	static Close() {
		this._terminalEdit.Value := ""
		Sleep(1)
		this._terminal.Hide()
	}
	
	static Execute(&err := "") {
		if !IsSet(err) {
			err := ""
		}
		
		input := this._terminalEdit.Value
		this.Close()
		
		if this._prevWinId {
			prevWinId := this._prevWinId
			
			; sometimes, explorer.exe might steal the focus
			if !WinWaitActive(prevWinId, , 0.25) {
				WinActivate(prevWinId)
				
				if !WinWaitActive(prevWinId, , 0.25) {
					; give up
					err := "Focus was stolen!!!"
					this._prevWinId := 0
					return
				}
			}
			
			this._prevWinId := 0
		}
		
		if StrIsEmptyOrWhiteSpace(input) {
			err := "command is empty"
			return
		}
		
		; Divide it into just 2 parts and pass the arguments (if any) as a single string,
		; allowing further functions to handle those arguments the way they need to.
		parts := StrSplit(input, "`s", , 2)
		
		if parts.Length == 1
			this._funcs[parts[1]](this)
		else
			this._funcs[parts[1]](this, parts[2])
	}
	
	
	; --- init ---
	
	static init_funcs() {
		this._funcs.Set(
			"code",    this.code,
			"cmd",     this.cmd,
			"sv",      this.sv,
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
			"sleep",   this.sleep,
			"shdown",  this.shdown,
			"msys",    this.msys,
			"rider",   this.rider,
			"docker",  this.docker,
			"chrome",  this.chrome,
			"gx",      this.gx,
			"discord", this.discord,
		)
		
		this._funcs.Default := this.default
	}
	
	static init_terminal() {
		this._terminal.Opt("+AlwaysOnTop -Caption +ToolWindow")
		this._terminal.BackColor := "000000"
		WinSetTransColor(this._terminal.BackColor . " 230", this._terminal.Hwnd)
		this._terminal.SetFont("s18 c0xbdbdbd", "JetBrains Mono Regular")
		
		editOpts := Format("Background171717 -E0x255 Center w{1} h{2}", this._width, this._height)
		this._terminalEdit := this._terminal.AddEdit(editOpts)
	}
	
	
	; --- funcs ---
	
	static default(*) {
		Display("key not found")
	}
	
	static code(args := "") {
		VsCode.Run(args, &err)
		if err {
			Display(err)
		}
	}
	
	static cmd(args := "") {
		OS.RunCmd(args, &err)
		if err {
			Display(err)
		}
	}
	
	static mic(*) {
		Run("D:\Files\123.sesx") ; run Adobe Audition
	}

	static obsid(*) => Obsidian.Run()

	static exp(args := "") {
		Explorer.Run(args, &err)
		if err {
			Display(err)
		}
	}

	static tg(*) => Telegram.Open()
	
	static tg_minus(*) => Telegram.Close()

	static stm(*) => Steam.Run()
	
	static stm_minus(*) => Steam.Close()
	
	static msys(args := "") {
		QmkMSys.Run(args, &err)
		if err {
			Display(err)
		}
	}
	
	static rider(args := "") {
		Rider.Run(args, &err)
		if err {
			Display(err)
		}
	}
	
	static docker(*) => Docker.Run()
	
	static chrome(*) => Chrome.Run()
	
	static gx(*) => OperaGX.Run()
	
	static discord(*) => Discord.Run()

	static sv(*) => RunCurrentScript()
	
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
		case Rider.IsActive: Rider.NugetRestore()
		}
	}

	static tgl(*) => Mode.ToggleDisplay()
	
	static inlh(*) {
		switch {
		case Rider.IsActive: Rider.ToggleInlayHints()
		}
	}
	
	static sleep(*) => OS.Sleep()
	
	static shdown(*) => OS.ShutDown()
	
}