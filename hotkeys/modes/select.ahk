#HotIf Mode.IsSelect

*F13::Mode.SetNormal()

*F14::Mode.SetInsert()

*F15::Mode.SetSymbol()

*F16::Mode.SetMouse()

Up::Windows.SelectUp()

Down::Windows.SelectDown()

Left::Windows.SelectLeft()

Right::Windows.SelectRight()

Home::Windows.SelectToBeginning()

End::Windows.SelectToEnd()

PgUp::Windows.SelectToPageBeginning()

PgDn::Windows.SelectToPageEnd()

c::Windows.Copy()

s::return

v::Windows.Paste()

x::Windows.Cut()

^Left::Windows.SelectLeftByWord()

^Right::Windows.SelectRightByWord()

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

+Up::Windows.ScrollUp()

+Down::Windows.ScrollDown()

#HotIf