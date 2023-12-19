#HotIf Mode.IsNSymbol

*F13::Mode.UnsetSybmol()

Insert:: {
	switch {
	case Rider.IsActive:  Rider.NewFile()
	case Goland.IsActive: Goland.NewFile()
	case VsCode.IsActive: VsCode.NewFile()
	}
}

<+1:: {
	switch {
	case Rider.IsActive:    Rider.GoBack()
	case Goland.IsActive:   Goland.GoBack()
	case VsCode.IsActive:   VsCode.GoBack()
	case Obsidian.IsActive: Obsidian.GoBack()
	case OperaGX.IsActive:  OperaGX.GoBack()
	case Chrome.IsActive:   Chrome.GoBack()
	case Discord.IsActive:  Discord.GoBack()
	case Explorer.IsActive: Explorer.GoBack()
	}
}

<+2:: {
	switch {
	case Rider.IsActive:    Rider.GoForward()
	case Goland.IsActive:   Goland.GoForward()
	case VsCode.IsActive:   VsCode.GoForward()
	case Obsidian.IsActive: Obsidian.GoForward()
	case OperaGX.IsActive:  OperaGX.GoForward()
	case Chrome.IsActive:   Chrome.GoForward()
	case Discord.IsActive:  Discord.GoForward()
	case Explorer.IsActive: Explorer.GoForward()
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

>+9:: { ; (
	switch {
	case Rider.IsActive:  Rider.GotoPreviousError()
	case VsCode.IsActive: VsCode.GotoPreviousProblem()
	}
}

>+0:: { ; )
	switch {
	case Rider.IsActive:  Rider.GotoNextError()
	case VsCode.IsActive: VsCode.GotoNextProblem()
	}
}

#HotIf


#HotIf Mode.IsISymbol

*F14::Mode.UnsetSybmol()

#HotIf


#HotIf Mode.IsSSymbol

*F13::Mode.UnsetSybmol()

#HotIf