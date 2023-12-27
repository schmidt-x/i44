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
		this._prevWinId := WinGetID("A")
		this._terminal.Show("y1020 x847")
	}
	
	static Close() {
		this._terminalEdit.Value := ""
		Sleep(1)
		this._terminal.Hide()
	}
	
	static Execute() {
		input := this._terminalEdit.Value
		this.Close()
		
		if this._prevWinId {
			prevWinId := this._prevWinId
			
			; sometimes, explorer.exe might steal the focus
			if !WinWaitActive(prevWinId, , 0.25) {
				WinActivate(prevWinId)
				
				if !WinWaitActive(prevWinId, , 0.25) {
					; give up
					MsgBox("Focus was stolen!!!")
					this._prevWinId := 0
					return
				}
			}
			
			this._prevWinId := 0
		}
		
		if StrIsEmptyOrWhiteSpace(input)
			return
		
		; Divide it into just 2 parts and pass the arguments (if any) as a single string,
		; allowing further functions to handle those arguments the way they need to.
		parts := StrSplit(input, "`s", , 2)
		
		if parts.Length == 1
			this._funcs[input](this)
		else
			this._funcs[parts[1]](this, parts[2])
	}
	
	
	; --- initialization ---
	
	static init_funcs() {
		this._funcs.Set(
			"code",    this.code,
			"cmd",     this.cmd,
			"sv",      this.sv,
			"tt",      this.tt,
			"tb",      this.tb,
			"rf",      this.rf,
			"mic",     this.mic,
			"info",    this.info,
			"rat",     this.rat,
			"bs",      this.bs,
			"rp",      this.rp,
			"ox",      this.ox,
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
		Display("key not found")
	}
	
	static code(args := "") => VsCode.Run(args)
	
	static cmd(args := "") => Windows.RunCmd(args)

	static sv(*) => RunCurrentScript()
	
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
	
	static exp(args := "") => Explorer.Run(args)
	
	static tg(*) => Telegram.Open()
	
	static tg_minus(*) => Telegram.Close()
	
	static inlh(*) {
		switch {
		case Rider.IsActive: Rider.ToggleInlayHints()
		}
	}
	
	static stm(*) => Steam.Run()
	
	static stm_minus(*) => Steam.Close()
	
	static sleep(*) => Windows.Sleep()
	
	static shdown(*) => Windows.ShutDown()
	
	static msys(args := "") => QmkMSys.Run(args)
	
	static rider(args := "") => Rider.Run(args)
	
	static docker(*) => Docker.Run()
}

