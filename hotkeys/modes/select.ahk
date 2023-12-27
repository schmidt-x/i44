#HotIf Mode.IsSelect

*F13::Mode.SetNormal()

*F14::Mode.SetInsert()

*F15::Mode.SetSymbol()

*F16::Mode.SetMouse()

Up::OS.SelectUp()

Down::OS.SelectDown()

Left::OS.SelectLeft()

Right::OS.SelectRight()

Home::OS.SelectToLineBeginning()

End::OS.SelectToLineEnd()

PgUp::OS.SelectToPageBeginning()

PgDn::OS.SelectToPageEnd()

c::OS.Copy()

s::return

v::OS.Paste()

x::OS.Cut()

^Left::OS.SelectLeftByWord()

^Right::OS.SelectRightByWord()

^Up:: {
	switch {
	case Rider.IsActive:  Rider.ExpandSelection()
	case VsCode.IsActive: VsCode.ExpandSelection()
	}
}

^Down:: {
	switch {
	case Rider.IsActive:  Rider.ShrinkSelection()
	case VsCode.IsActive: VsCode.ShrinkSelection()
	}
}

+Up::OS.ScrollUp()

+Down::OS.ScrollDown()

#HotIf