#HotIf Mode.IsSelect

~Escape::Mode.SetDefault()

*F13::Mode.SetNormal()

*F14::Mode.SetInsert()

*F15::Mode.SetSymbol()

*F16::Mode.SetMouse()

Up::OS.SelectUp()

Down::OS.SelectDown()

+Up::OS.ScrollUp()

+Down::OS.ScrollDown()

Left::OS.SelectLeft()

Right::OS.SelectRight()

^Left::OS.SelectLeftByWord()

^Right::OS.SelectRightByWord()

Home::OS.SelectToLineBeginning()

End::OS.SelectToLineEnd()

+End:: {
	switch {
	case Rider.IsActive:  Rider.ExtendSelection()
	case VsCode.IsActive: VsCode.ExpandSelection()
	case Goland.IsActive: Goland.ExtendSelection()
	}
}

+Home:: {
	switch {
	case Rider.IsActive:  Rider.ShrinkSelection()
	case VsCode.IsActive: VsCode.ShrinkSelection()
	case Goland.IsActive: Goland.ShrinkSelection()
	}
}

PgUp::OS.SelectToPageBeginning()

PgDn::OS.SelectToPageEnd()

^PgUp::OS.SelectToFileBeginning()

^PgDn::OS.SelectToFileEnd()

c::OS.Copy()

s::return

v::OS.Paste()

x::OS.Cut()

#HotIf