#SuspendExempt True ; allow hotkeys to be hit even if it's suspended

<+^0:: {
	Suspend()
	Mode.SetDefault()
}

~Escape::Mode.SetDefault()

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

^1:: {
	switch {
	case Rider.IsActive:    Rider.Explorer()
	case Goland.IsActive:   Goland.Project()
	case VsCode.IsActive:   VsCode.ShowExplorer()
	case Obsidian.IsActive: Obsidian.ExplorerFocus()
	case OperaGX.IsActive:  OperaGX.ToMainWorkspace()
	}
}

^2:: {
	switch {
	case Rider.IsActive:   Rider.Terminal()
	case Goland.IsActive:  Goland.Terminal()
	case VsCode.IsActive:  VsCode.Terminal()
	case OperaGX.IsActive: OperaGX.ToChillWorkspace()
	}
}

^3:: {
	switch {
	case Rider.IsActive:    Rider.Debug()
	case Goland.IsActive:   Goland.Debug()
	case VsCode.IsActive:   VsCode.Debug()
	case Obsidian.IsActive: Obsidian.ShowOutline()
	}
}

^4:: {
	switch {
	case Rider.IsActive:  Rider.Database()
	case Goland.IsActive: Goland.Database()
	}
}

^5:: {
	switch {
	case Rider.IsActive: Rider.UnitTests()
	}
}

^6:: {
	switch {
	case Rider.IsActive:  Rider.Commit()
	case Goland.IsActive: Goland.Commit()
	case VsCode.IsActive: VsCode.ToggleSourceControl()
	}
}

^7:: {
	switch {
	case Rider.IsActive:  Rider.Structure()
	case Goland.IsActive: Goland.Structure()
	}
}

^8:: {
	switch {
	case Rider.IsActive: Rider.ILViewer()
	}
}

