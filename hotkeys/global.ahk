#SuspendExempt True ; allow hotkeys to be hit even if it's suspended

^0:: {
	Suspend()
}

*~Esc:: {
	Mode.SetDefault()
}

#SuspendExempt False

^+s:: {
	switch {
	case Rider.IsActive:    Rider.OpenSettings()
	case Goland.IsActive:   Goland.OpenSettings()
	case VsCode.IsActive:   VsCode.OpenSettings()
	case Obsidian.IsActive: Obsidian.OpenSettings()
	case OperaGX.IsActive:  OperaGX.OpenSettings()
	}
}

^g:: {
	Terminal.Show()
}

^p:: {
	switch {
	case Rider.IsActive:  Rider.SearchEverywhere()
	case VsCode.IsActive: VsCode.GotoFile()
	}
}

^1:: {
	switch {
	case Rider.IsActive:    Rider.ToggleExplorer()
	case Goland.IsActive:   Goland.ToggleExplorer()
	case VsCode.IsActive:   VsCode.ToggleExplorerFocus()
	case Obsidian.IsActive: Obsidian.ExplorerFocus()
	case OperaGX.IsActive:  OperaGX.ToMainWorkspace()
	}
}

^2:: {
	switch {
	case Rider.IsActive:  Rider.ToggleTerminal()
	case Goland.IsActive: Goland.ToggleTerminal()
	case VsCode.IsActive: VsCode.OpenTerminal()
	case OperaGX.IsActive : OperaGX.ToChillWorkspace()
	}
}

^3:: {
	switch {
	case Rider.IsActive:    Rider.ToggleDebug()
	case Goland.IsActive:   Goland.ToggleDebug()
	case Obsidian.IsActive: Obsidian.ShowOutline()
	}
}

^4:: {
	switch {
	case Rider.IsActive:  Rider.ToggleDbExplorer()
	case Goland.IsActive: Goland.ToggleDbExplorer()
	}
}

^5:: {
	switch {
	case Rider.IsActive: Rider.ToggleUnitTests()
	}
}

^6:: {
	switch {
	case VsCode.IsActive: VsCode.ToggleSourceControl()
	}
}

^7:: {
	switch {
	case Rider.IsActive: Rider.ToggleServices()
	}
}

^8:: {
	switch {
	case Rider.IsActive: Rider.ILViewer()
	}
}