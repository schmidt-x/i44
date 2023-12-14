class Mode {
	
	static _current         := -1
	static _display         := Gui()
	static _displayEdit     := unset
	static _enabled         := false
	
	static __New() {
		this.init_display()
		this.SetInsert()
		
		if this._enabled
			this.show()
	}
	
	static init_display() {
		this._display.Opt("AlwaysOnTop -Caption +ToolWindow")
		this._display.BackColor := "000000"
		WinSetTransColor(this._display.BackColor . " 240", this._display.Hwnd)
		this._display.SetFont("s16 c0x5c5c5c", "JetBrains Mono Regular")
		this._displayEdit := this._display.Add("Text", "Background171717 -E0x255 w82 h32")
	}
	
	static IsInsert => this._current = ModeType.Insert
	static IsNormal => this._current = ModeType.Normal
	static IsMouse  => this._current = ModeType.Mouse
	static IsSelect => this._current = ModeType.Select
	
	
	static SetInsert() {
		if this.IsInsert
			return
		
		this._current := ModeType.Insert
		this.display("Insert")
	}

	static SetNormal() {
		if this.IsNormal
			return
		
		this._current := ModeType.Normal
		this.display("Normal")
	}
	
	static SetMouse() {
		if this.IsMouse
			return
		
		this._current := ModeType.Mouse
		this.display("Mouse")
	}
	
	static SetSelect() {
		if this.IsSelect
			return
		
		this._current := ModeType.Select
		this.display("Select")
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
	
}

class ModeType {
	static Insert => 0
	static Normal => 1
	static Mouse  => 4
	static Select => 5
}