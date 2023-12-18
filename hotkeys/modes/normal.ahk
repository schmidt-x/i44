#HotIf Mode.IsNormal

*F14::Mode.SetInsert()

*F15::Mode.SetSymbol()

*F16::Mode.SetMouse()

a:: {
	switch {
	case OperaGX.IsActive:  OperaGX.FocusOnAddressBar()
	case Explorer.IsActive: Explorer.FocusOnAddressBar()
	; case Chrome.IsActive:   Chrome.FocusOnAddressBar()
	}
}

b:: {
	switch {
	case Rider.IsActive:  Rider.MoveCaretToMatchingBrace()
	case VsCode.IsActive: VsCode.GotoBracket()
	}
}

c::return

d::return

e:: {
	switch {
	case Rider.IsActive:   Rider.ParameterInfo()
	case Goland.IsActive:  Goland.ParameterInfo()
	case VsCode.IsActive:  VsCode.ParameterHints()
	case OperaGX.IsActive: OperaGX.SpeedDial()
	}
}

g::return

m:: {
	switch {
	case Rider.IsActive:    Rider.UnfoldBlockOfCode()
	case Goland.IsActive:   Goland.UnfoldBlockOfCode()
	case VsCode.IsActive:   VsCode.UnfoldBlockOfCode()
	case Obsidian.IsActive: Obsidian.UnfoldBlockOfCode()
	}
}

n:: {
	switch {
	case Rider.IsActive:    Rider.FoldBlockOfCode()
	case Goland.IsActive:   Goland.FoldBlockOfCode()
	case VsCode.IsActive:   VsCode.FoldBlockOfCode()
	case Obsidian.IsActive: Obsidian.FoldBlockOfCode()
	case OperaGX.IsActive:  OperaGX.NewTab()
	case Chrome.IsActive:   Chrome.NewTab()
	case Explorer.IsActive: Explorer.NewTab()
	}
}

q:: {
	switch {
	case Rider.IsActive:    Rider.CloseTab()
	case Goland.IsActive:   Goland.CloseTab()
	case VsCode.IsActive:   VsCode.CloseTab()
	case Obsidian.IsActive: Obsidian.CloseTab()
	case OperaGX.IsActive:  OperaGX.CloseTab()
	case Chrome.IsActive:   Chrome.CloseTab()
	case Explorer.IsActive: Explorer.CloseTab()
	}
}

r:: {
	switch {
	case Rider.IsActive:    Rider.ErrorDescription()
	case Goland.IsActive:   Goland.ErrorDescription()
	case Obsidian.IsActive: Obsidian.ToggleReadingMode()
	case OperaGX.IsActive:  OperaGX.ReloadTab()
	case Chrome.IsActive:   Chrome.ReloadTab()
	}
}

s:: {
	Mode.SetSelect()
}

t:: {
	switch {
	case Rider.IsActive:  Rider.GoToDeclarationOrUsages()
	case Goland.IsActive:	Goland.GoToDeclaration()
	case VsCode.IsActive:	VsCode.GoToDeclaration()
	}
}

v:: {
	Windows.OpenClipboard()
}

w:: {
	switch {
	case Rider.IsActive:  Rider.QuickDocumentation()
	case Goland.IsActive: Goland.QuickDocumentation()
	case VsCode.IsActive: VsCode.ShowHover()
	}
}

x:: {
	switch {
	case Goland.IsActive: Goland.Redo()
	default:              Windows.Redo()
	}
}

z:: {
	Windows.Undo()
}

':: {
	switch {
	case Rider.IsActive:  Rider.CommentLine()
	case Goland.IsActive: Goland.CommentLine()
	case VsCode.IsActive: VsCode.CommentLine()
	}
}

.:: {
	switch {
	case Rider.IsActive:  Rider.ContextActions()
	case Goland.IsActive: Goland.ContextActions()
	}
}

^b:: {
	switch {
	case Rider.IsActive:  Rider.ToggleBreakpoint()
	case Goland.IsActive: Goland.ToggleBreakpoint()
	case VsCode.IsActive: VsCode.ToggleBreakpoint()
	}
}

^End:: {
	switch {
	case Rider.IsActive:    Rider.NextTab()
	case Goland.IsActive:   Goland.NextTab()
	case VsCode.IsActive:   VsCode.NextTab()
	case Obsidian.IsActive: Obsidian.NextTab()
	case OperaGX.IsActive:  OperaGX.NextTab()
	case Chrome.IsActive:   Chrome.NextTab()
	case Explorer.IsActive: Explorer.NextTab()
	}
}

^Home:: {
	switch {
	case Rider.IsActive:    Rider.PreviousTab()
	case Goland.IsActive:   Goland.PreviousTab()
	case VsCode.IsActive:   VsCode.PreviousTab()
	case Obsidian.IsActive: Obsidian.PreviousTab()
	case OperaGX.IsActive:  OperaGX.PreviousTab()
	case Chrome.IsActive:   Chrome.PreviousTab()
	case Explorer.IsActive: Explorer.PreviousTab()
	}
}

^Up:: {
	switch {
	case Rider.IsActive:    Rider.MoveLineUp()
	case Goland.IsActive:   Goland.MoveLineUp()
	case VsCode.IsActive:   VsCode.MoveLineUp()
	case Obsidian.IsActive: Obsidian.MoveLineUp()
	}
}

^Down:: {
	switch {
	case Rider.IsActive:    Rider.MoveLineDown()
	case Goland.IsActive:   Goland.MoveLineDown()
	case VsCode.IsActive:   VsCode.MoveLineDown()
	case Obsidian.IsActive: Obsidian.MoveLineDown()
	}
}

^PgDn:: {
	Windows.MoveToWholeEnd()
}

^PgUp:: {
	Windows.MoveToWholeBeginning()
}

^,:: {
	switch {
	case VsCode.IsActive:  VsCode.MoveEditorLeft()
	case OperaGX.IsActive: OperaGX.MoveTabLeft()
	case Chrome.IsActive:  Chrome.MoveTabLeft()
	}
}

^.:: {
	switch {
	case VsCode.IsActive:  VsCode.MoveEditorRight()
	case OperaGX.IsActive: OperaGX.MoveTabRight()
	case Chrome.IsActive:  Chrome.MoveTabRight()
	}
}

+Up:: {
	Windows.ScrollUp()
}

+Down:: {
	Windows.ScrollDown()
}

+Left:: { ; inverted ^Left
	switch {
	case Rider.IsActive:    Rider.PreviousMethod()
	case VsCode.IsActive:   VsCode.GotoPrevMember()
	case OperaGX.IsActive:  OperaGX.FindPrevious()
	case Obsidian.IsActive: Obsidian.FindPrevious()
	}
}

+Right:: { ; inverted ^Right
	switch {
	case Rider.IsActive:    Rider.NextMethod()
	case VsCode.IsActive:   VsCode.GotoNextMember()
	case OperaGX.IsActive:  OperaGX.FindNext()
	case Obsidian.IsActive: Obsidian.FindNext()
	}
}

+c:: {
	switch {
	case OperaGX.IsActive: OperaGX.DuplicateTab()
	}
}

+m:: {
	switch {
	case Rider.IsActive:    Rider.UnfoldAll()
	case Goland.IsActive:   Goland.UnfoldAll()
	case VsCode.IsActive:   VsCode.UnfoldAll()
	case Obsidian.IsActive: Obsidian.UnfoldAll()
	}
}

+n:: {
	switch {
	case Rider.IsActive:    Rider.FoldAll()
	case Goland.IsActive:   Goland.FoldAll()
	case VsCode.IsActive:   VsCode.FoldAll()
	case Obsidian.IsActive: Obsidian.FoldAll()
	}
}

+q:: {
	switch {
	case Rider.IsActive:   Rider.ReopenLastClosedTab()
	case OperaGX.IsActive: OperaGX.ReopenLastClosedTab()
	case Goland.IsActive:  Goland.ReopenLastClosedTab()
	case VsCode.IsActive:  VsCode.ReopenLastClosedTab()
	}
}

+t:: {
	switch {
	case Rider.IsActive:  Rider.GoToImplementation()
	case Goland.IsActive: Goland.GoToImplementation()
	}
}

#HotIf