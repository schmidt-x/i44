class Mode {
	
	static _current     := unset
	static _display     := Gui()
	static _displayEdit := unset
	static _enabled     := true
	
	static __New() {
		this.init_display()
		this.inti_default_mode()
		
		if this._enabled
			this.show()
	}
	
	static init_display() {
		this._display.Opt("AlwaysOnTop -Caption +ToolWindow")
		this._display.BackColor := "000000" ; any color (since we're gonna make it transparent)
		WinSetTransColor(this._display.BackColor . " 240", this._display.Hwnd)
		this._display.SetFont("s16 c0x5c5c5c", "JetBrains Mono Regular")
		this._displayEdit := this._display.AddText("Background171717 -E0x255 w90 h27 Center")
	}
	
	static inti_default_mode() {
		this._current := ModeType.Normal
		this.displayNormal()
	}
	
	static IsNormal  => this._current == ModeType.Normal
	static IsInsert  => this._current == ModeType.Insert
	static IsMouse   => this._current == ModeType.Mouse
	static IsSelect  => this._current == ModeType.Select
	static IsNSymbol => this._current == ModeType.Normal | ModeType.Symbol
	static IsISymbol => this._current == ModeType.Insert | ModeType.Symbol
	static IsSSymbol => this._current == ModeType.Select | ModeType.Symbol
	
	
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
		
		this._current |= ModeType.Symbol
		
		switch {
		case this._current & ModeType.Normal: this.displayNSymbol()
		case this._current & ModeType.Insert: this.displayISymbol()
		case this._current & ModeType.Select: this.displaySSymbol()
		default: this.displayUndef()
		}
	}
	
	static UnsetSybmol() {
		if !(this._current & ModeType.Symbol)
			return
		
		this._current ^= ModeType.Symbol
		
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
		this._displayEdit.Value := layerName
	}
	
	static hide() {
		this._display.Hide()
	}
	
	static show() {
		this._display.Show("x-20 y987 NoActivate")
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

class ModeType {
	static Normal => 1
	static Insert => 2
	static Symbol => 4
	static Mouse  => 8
	static Select => 16
}