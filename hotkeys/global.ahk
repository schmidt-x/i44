#SuspendExempt True ; allow hotkeys to be hit even if it's suspended

<+^0:: {
	Suspend()
	Mode.SetDefault()
}

#SuspendExempt False

+Enter:: {
	switch {
	case VsCode.IsActive: VsCode.InsertLineBelow()
	case Rider.IsActive:  Rider.StartNewLine()
	default: SendInput("{Blind}{Enter}")
	}
}

^Enter:: {
	switch {
	case Explorer.IsActive: 
		VsCode.OpenSelected(&err)
		if err {
			Display(err)
		}
	default: SendInput("{Blind}{Enter}")
	}
}

+^s:: {
	switch {
	case Rider.IsActive:    Rider.OpenSettings()
	case VsCode.IsActive:   VsCode.OpenSettings()
	case Obsidian.IsActive: Obsidian.OpenSettings()
	case OperaGX.IsActive:  OperaGX.OpenSettings()
	}
}

^0:: {
	switch {
	case OperaGX.IsActive: OperaGX.SwitchToLastTab()
	default: SendInput("{Blind}0")
	}
}

^1:: {
	switch {
	case Rider.IsActive:    Rider.Explorer()
	case VsCode.IsActive:   VsCode.ShowExplorer()
	case Obsidian.IsActive: Obsidian.ExplorerFocus()
	default: SendInput("{Blind}1")
	}
}

^2:: {
	switch {
	case Rider.IsActive:   Rider.Terminal()
	case VsCode.IsActive:  VsCode.Terminal()
	default: SendInput("{Blind}2")
	}
}

^3:: {
	switch {
	case Rider.IsActive:    Rider.Debug()
	case VsCode.IsActive:   VsCode.Debug()
	case Obsidian.IsActive: Obsidian.ShowOutline()
	default: SendInput("{Blind}3")
	}
}

^4:: {
	switch {
	case Rider.IsActive:  Rider.Database()
	default: SendInput("{Blind}4")
	}
}

^5:: {
	switch {
	case Rider.IsActive: Rider.UnitTests()
	default: SendInput("{Blind}5")
	}
}

^6:: {
	switch {
	case Rider.IsActive:  Rider.Commit()
	case VsCode.IsActive: VsCode.ToggleSourceControl()
	default: SendInput("{Blind}6")
	}
}

^7:: {
	switch {
	case Rider.IsActive:   Rider.Structure()
	case OperaGX.IsActive: OperaGX.ToMainWorkspace()
	default: SendInput("{Blind}7")
	}
}

^8:: {
	switch {
	case Rider.IsActive:   Rider.ILViewer()
	case OperaGX.IsActive: OperaGX.ToChillWorkspace()
	default: SendInput("{Blind}8")
	}
}

