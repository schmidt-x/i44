class ModeType {
	static Normal => 1
	static Insert => 2
	static Symbol => 4
	static Mouse  => 8
	static Select => 16
}

class Mode {
	static _current     := unset
	static _display     := Gui()
	static _displayText := unset
	static _enabled     := true
	
	static _width  := 90
	static _height := 27
	
	static _isCenterRelative := false
	static _posX := 0
	static _posY := 1000
	
	static _gui_padd_x := unset
	static _gui_padd_y := unset
	
	static __New() {
		this.init_display()
		
		this._current := ModeType.Normal
		this.displayNormal()
		
		if this._enabled
			this.show()
	}
	
	static init_display() {
		this._display.Opt("AlwaysOnTop -Caption +ToolWindow")
		this._display.BackColor := "000000" ; any color (since we're gonna make it transparent)
		WinSetTransColor(this._display.BackColor . " 240", this._display.Hwnd)
		this._display.SetFont("s16 c0x5c5c5c", "JetBrains Mono Regular")
		
		textOpts := Format("Background171717 -E0x255 w{1} h{2} Center", this._width, this._height)
		this._displayText  := this._display.AddText(textOpts)
		
		; get the actual size of the window, including its title bar, menu and borders
		this._display.Show("Hide")
		this._display.GetPos(, , &width, &height)
		
		; calculate padding added by Gui
		this._gui_padd_x := (width - this._width) / 2
		this._gui_padd_y := (height - this._height) / 2
	}
	
	
	static IsNormal  => this._current == ModeType.Normal
	static IsInsert  => this._current == ModeType.Insert
	static IsMouse   => this._current == ModeType.Mouse
	static IsSelect  => this._current == ModeType.Select
	static IsNSymbol => this._current == (ModeType.Normal | ModeType.Symbol)
	static IsISymbol => this._current == (ModeType.Insert | ModeType.Symbol)
	static IsSSymbol => this._current == (ModeType.Select | ModeType.Symbol)
	
	
	static SetDefault() {
		if this._current == ModeType.Normal
			return
		
		this._current := ModeType.Normal
		this.displayNormal()
	}
	
	static SetInsert() {
		if this._current == ModeType.Insert
			return
		
		this._current := ModeType.Insert
		this.displayInsert()
	}

	static SetNormal() {
		if this._current == ModeType.Normal
			return
		
		this._current := ModeType.Normal
		this.displayNormal()
	}
	
	static SetMouse() {
		if this._current == ModeType.Mouse
			return
		
		this._current := ModeType.Mouse
		this.displayMouse()
	}
	
	static SetSelect() {
		if this._current == ModeType.Select
			return
		
		this._current := ModeType.Select
		this.displaySelect()
	}
	
	static SetSymbol() {
		if this._current & ModeType.Symbol
			return
		
		prevMode := this._current
		this._current |= ModeType.Symbol
		
		switch prevMode {
		case ModeType.Normal: this.displayNSymbol()
		case ModeType.Insert: this.displayISymbol()
		case ModeType.Select: this.displaySSymbol()
		default: this.displayUndef()
		}
	}
	
	static UnsetSybmol() {
		if !(this._current & ModeType.Symbol)
			return
		
		this._current &= ~ModeType.Symbol
		
		switch this._current {
		case ModeType.Normal: this.displayNormal()
		case ModeType.Insert: this.displayInsert()
		case ModeType.Select: this.displaySelect()
		default: this.displayUndef()
		}
	}
	
	; --- DISPLAY ---
	
	static ToggleDisplay() {
		if this._enabled 
			this.hide()
		else
			this.show()
		
		this._enabled := !this._enabled
	}
	
	static display(layerName) {
		this._displayText.Value := layerName
	}
	
	static hide() {
		this._display.Hide()
	}
	
	static show() {
		static textPos := Format("x{1} y{2} NoActivate"
			, this._posX - this._gui_padd_x - (this._isCenterRelative ? this._width / 2 : 0)
			, this._posY - this._gui_padd_y - (this._isCenterRelative ? this._height / 2 : 0)
		)
		
		this._display.Show(textPos)
	}
	
	static displayNormal() => this.display("Normal")
	static displayInsert() => this.display("Insert")
	static displaySymbol() => this.display("Symbol")
	static displayMouse()  => this.display("Mouse")
	static displaySelect() => this.display("Select")
	
	static displayNSymbol() => this.display("N_Symb")
	static displayISymbol() => this.display("I_Symb")
	static displaySSymbol() => this.display("S_Symb")
	
	static displayUndef() => this.display("Undef")
}