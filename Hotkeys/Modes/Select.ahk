#HotIf Mode.IsSelect

*F13::Mode.SetNormal()

*F14::Mode.SetInsert()

*F15::Mode.AddSymbol()

*F16::Mode.SetMouse()

<+>+Up::ScrollUp()

<+>+Down::ScrollDown()

<+>+End:: {
	switch {
	case Rider.IsActive:  Rider.ExtendSelection()
	case VsCode.IsActive: VsCode.ExpandSelection()
	}
}

<+>+Home:: {
	switch {
	case Rider.IsActive:  Rider.ShrinkSelection()
	case VsCode.IsActive: VsCode.ShrinkSelection()
	}
}

<^>+Home::return

<^>+End::return

#HotIf