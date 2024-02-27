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
	}
}

+Home:: {
	switch {
	case Rider.IsActive:  Rider.ShrinkSelection()
	case VsCode.IsActive: VsCode.ShrinkSelection()
	}
}

PgUp::OS.SelectToPageBeginning()

PgDn::OS.SelectToPageEnd()

^PgUp::OS.SelectToFileBeginning()

^PgDn::OS.SelectToFileEnd()

v::OS.Copy()

r::return

>#v::OS.Paste()

>^y::OS.Cut()

#HotIf