#HotIf Mode.IsNSymbol

*F13::Mode.UnsetSybmol()

*F15::return

Insert:: {
	switch {
	case Rider.IsActive:  Rider.NewFile()
	case Goland.IsActive: Goland.NewFile()
	case VsCode.IsActive: VsCode.NewFile()
	}
}

<+1:: {
	switch {
	case Rider.IsActive:  Rider.CloneCaretAboveWithVirtualSpace()
	case Goland.IsActive: Goland.CloneCaretAbove()
	case VsCode.IsActive: VsCode.CopyCursorUp()
	}
}

<+3:: {
	switch {
	case Rider.IsActive:  Rider.CloneCaretBelowWithVirtualSpace()
	case Goland.IsActive: Goland.CloneCaretBelow()
	case VsCode.IsActive: VsCode.CopyCursorDown()
	}
}

>+[:: { ; {
	switch {
	case Rider.IsActive:  Rider.PrevMethod()
	case VsCode.IsActive: VsCode.PrevMember()
	}
}

>+]:: { ; }
	switch {
	case Rider.IsActive:  Rider.NextMethod()
	case VsCode.IsActive: VsCode.NextMember()
	}
}

#HotIf


#HotIf Mode.IsISymbol

*F14::Mode.UnsetSybmol()

*F15::return

<+7::SendInput("{Blind}{U+2014}") ; —

<+8::SendInput("->")

<+9::SendInput("=>")

<+-::SendInput(":=")

<+>+[::SendInput("{Blind}{U+00AB}") ; LShift + { => «

<+>+]::SendInput("{Blind}{U+00BB}") ; LShift + } => »

<+\::SendInput("\n")

#HotIf


#HotIf Mode.IsSSymbol

*F13::Mode.UnsetSybmol()

#HotIf