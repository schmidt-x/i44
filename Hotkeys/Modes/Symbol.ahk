#HotIf Mode.IsNSymbol

*F14::Mode.SetInsert()

*F13::Mode.DelSymbol()

*F15:: {
	; F15 is sent on returning from SYMB+ to SYMB (QMK)
	return
}

Insert:: {
	switch {
	case Rider.IsActive:  Rider.NewFile()
	case VsCode.IsActive: VsCode.NewFile()
	}
}

<+1:: {
	switch {
	case Rider.IsActive:  Rider.CloneCaretAboveWithVirtualSpace()
	case VsCode.IsActive: VsCode.CopyCursorUp()
	}
}

>+2:: { ; @
	switch {
	case OperaGX.IsActive: OperaGX.DefaultPlaybackSpeed()
	}
}

<+3:: {
	switch {
	case Rider.IsActive:  Rider.CloneCaretBelowWithVirtualSpace()
	case VsCode.IsActive: VsCode.CopyCursorDown()
	}
}

>+[:: { ; {
	switch {
	case Rider.IsActive:   Rider.PrevMethod()
	case VsCode.IsActive:  VsCode.PrevMember()
	case OperaGX.IsActive: OperaGX.DecreasePlaybackSpeed()
	}
}

>+]:: { ; }
	switch {
	case Rider.IsActive:   Rider.NextMethod()
	case VsCode.IsActive:  VsCode.NextMember()
	case OperaGX.IsActive: OperaGX.IncreasePlaybackSpeed()
	}
}

#HotIf


#HotIf Mode.IsISymbol

*F14::Mode.DelSymbol()

*F15:: {
	; F15 is sent on returning from SYMB+ to SYMB 
	; and/or from NORML to SYMB (QMK)
	return
}

<+7::SendInput("{Blind}{U+2014}") ; —

<+8::SendInput("->")

<+9::SendInput("=>")

<+-::SendInput(":=")

<+>+[::SendInput("{Blind}{U+00AB}") ; LShift + { => «

<+>+]::SendInput("{Blind}{U+00BB}") ; LShift + } => »

<+\::SendInput("\n")

#HotIf


#HotIf Mode.IsSSymbol

*F17::Mode.DelSymbol()

#HotIf