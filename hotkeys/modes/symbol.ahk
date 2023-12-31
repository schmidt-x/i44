#HotIf Mode.IsNSymbol

*F13::Mode.UnsetSybmol()

Insert:: {
	switch {
	case Rider.IsActive:  Rider.NewFile()
	case Goland.IsActive: Goland.NewFile()
	case VsCode.IsActive: VsCode.NewFile()
	}
}

<+4:: {
	switch {
	case Rider.IsActive:  Rider.CloneCaretAboveWithVirtualSpace()
	case Goland.IsActive: Goland.CopyCursorUp()
	case VsCode.IsActive: VsCode.CopyCursorUp()
	}
}

<+5:: {
	switch {
	case Rider.IsActive:  Rider.CloneCaretBelowWithVirtualSpace()
	case Goland.IsActive: Goland.CopyCursorDown()
	case VsCode.IsActive: VsCode.CopyCursorDown()
	}
}

#HotIf


#HotIf Mode.IsISymbol

*F14::Mode.UnsetSybmol()

<+8::SendInput("->")

<+9::SendInput("=>")

<+-::SendInput(":=")

<+>+[::SendInput("«") ; LSft + {

<+>+]::SendInput("»") ; LSft + }

#HotIf


#HotIf Mode.IsSSymbol

*F13::Mode.UnsetSybmol()

#HotIf