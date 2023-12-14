#HotIf Mode.IsSelect

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


; --- CTRL ---

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


; --- SHIFT ---

+Up::Windows.ScrollUp()

+Down::Windows.ScrollDown()

#HotIf