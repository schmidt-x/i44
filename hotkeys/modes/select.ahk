#HotIf Mode.IsSelect

*F13::Mode.SetNormal()

*F14::Mode.SetInsert()

*F15::Mode.SetSymbol()

*F16::Mode.SetMouse()

<+>+Up::OS.ScrollUp()

<+>+Down::OS.ScrollDown()

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

<^>+Home:: {
	return
}

<^>+End::{
	return
}

#HotIf