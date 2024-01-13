#HotIf Mode.IsNormal

F13::return

*F14::Mode.SetInsert()

*F15::Mode.SetSymbol()

*F16::Mode.SetMouse()

a:: {
	switch {
	case OperaGX.IsActive:  OperaGX.FocusOnAddressBar()
	case Explorer.IsActive: Explorer.FocusOnAddressBar()
	}
}

b:: {
	switch {
	case Rider.IsActive:  Rider.MoveCaretToMatchingBrace()
	case VsCode.IsActive: VsCode.GotoBracket()
	case Goland.IsActive: Goland.MoveCaretToMatchingBrace()
	}
}

^b:: {
	switch {
	case Rider.IsActive:  Rider.ToggleBreakpoint()
	case Goland.IsActive: Goland.ToggleBreakpoint()
	case VsCode.IsActive: VsCode.ToggleBreakpoint()
	}
}

c::return

+c:: {
	switch {
	case Rider.IsActive:   Rider.DuplicateLineOrSelection()
	case VsCode.IsActive:  VsCode.CopyLineDown()
	case Goland.IsActive:  Goland.DuplicateLineOrSelection()
	case OperaGX.IsActive: OperaGX.DuplicateTab()
	}
}

d::return

e:: {
	switch {
	case Rider.IsActive:   Rider.ParameterInfo()
	case Goland.IsActive:  Goland.ParameterInfo()
	case VsCode.IsActive:  VsCode.ParameterHints()
	case OperaGX.IsActive: OperaGX.SpeedDial()
	case Discord.IsActive: Discord.EditMessage()
	}
}

g::Terminal.Show()

m:: {
	switch {
	case Rider.IsActive:    Rider.Expand()
	case Goland.IsActive:   Goland.Expand()
	case VsCode.IsActive:   VsCode.Unfold()
	case Obsidian.IsActive: Obsidian.FoldLess()
	}
}

+m:: {
	switch {
	case Rider.IsActive:    Rider.ExpandAll()
	case Goland.IsActive:   Goland.ExpandAll()
	case VsCode.IsActive:   VsCode.UnfoldAll()
	case Obsidian.IsActive: Obsidian.UnfoldAllHeadingsAndLists()
	}
}

n:: {
	switch {
	case Rider.IsActive:    Rider.Collapse()
	case Goland.IsActive:   Goland.Collapse()
	case VsCode.IsActive:   VsCode.Fold()
	case Obsidian.IsActive: Obsidian.FoldMore()
	case OperaGX.IsActive:  OperaGX.NewTab()
	case Chrome.IsActive:   Chrome.NewTab()
	case Explorer.IsActive: Explorer.NewTab()
	}
}

+n:: {
	switch {
	case Rider.IsActive:    Rider.CollapseAll()
	case Goland.IsActive:   Goland.CollapseAll()
	case VsCode.IsActive:   VsCode.FoldAll()
	case Obsidian.IsActive: Obsidian.FoldAllHeadingsAndLists()
	}
}

q:: {
	switch {
	case Rider.IsActive:    Rider.CloseTab()
	case Goland.IsActive:   Goland.CloseTab()
	case VsCode.IsActive:   VsCode.CloseEditor()
	case Obsidian.IsActive: Obsidian.CloseCurrentTab()
	case OperaGX.IsActive:  OperaGX.CloseTab()
	case Chrome.IsActive:   Chrome.CloseTab()
	case Explorer.IsActive: Explorer.CloseTab()
	}
}

+q:: {
	switch {
	case Rider.IsActive:   Rider.ReopenLastClosedTab()
	case OperaGX.IsActive: OperaGX.ReopenLastClosedTabOrWindow()
	case Goland.IsActive:  Goland.ReopenLastClosedTab()
	case VsCode.IsActive:  VsCode.ReopenLastClosedTab()
	}
}

r:: {
	switch {
	case Rider.IsActive:    Rider.ErrorDescription()
	case Goland.IsActive:   Goland.ErrorDescription()
	case Obsidian.IsActive: Obsidian.ToggleReadingView()
	case OperaGX.IsActive:  OperaGX.ReloadTab()
	case Chrome.IsActive:   Chrome.ReloadTab()
	case Discord.IsActive:  Discord.ReplyToMessage()
	}
}

s::Mode.SetSelect()

t:: {
	switch {
	case Rider.IsActive:  Rider.GoToDeclarationOrUsages()
	case Goland.IsActive:	Goland.GoToDeclarationOrUsages()
	case VsCode.IsActive:	VsCode.GoToDefinition()
	}
}

+t:: {
	switch {
	case Rider.IsActive:  Rider.GoToImplementation()
	case Goland.IsActive: Goland.GoToImplementation()
	case VsCode.IsActive: VsCode.GoToImplementation()
	}
}

v::OS.OpenClipboard()

w:: {
	switch {
	case Rider.IsActive:  Rider.QuickDocumentation()
	case Goland.IsActive: Goland.QuickDocumentation()
	case VsCode.IsActive: VsCode.ShowOrFocusHover()
	}
}

x::OS.Redo()

z::OS.Undo()

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
	case VsCode.IsActive: VsCode.QuickFix()
	}
}

+Up::OS.ScrollUp()

+Down::OS.ScrollDown()

^Up:: {
	switch {
	case Rider.IsActive:  Rider.MoveLineUp()
	case VsCode.IsActive: VsCode.MoveLineUp()
	}
}

^Down:: {
	switch {
	case Rider.IsActive:  Rider.MoveLineDown()
	case VsCode.IsActive: VsCode.MoveLineDown()
	}
}

+Left:: { ; inverted ^Left
	switch {
	case OperaGX.IsActive:  OperaGX.FindPrevious()
	case Obsidian.IsActive: Obsidian.FindPrevious()
	}
}

+Right:: { ; inverted ^Right
	switch {
	case OperaGX.IsActive:  OperaGX.FindNext()
	case Obsidian.IsActive: Obsidian.FindNext()
	}
}

+!Left:: {
	switch {
	case Rider.IsActive:   Rider.Back()
	case VsCode.IsActive:  VsCode.GoBack()
	case OperaGX.IsActive: OperaGX.Back()
	case Discord.IsActive: Discord.Backward()
	case Chrome.IsActive:  Chrome.Back()
	}
}

+!Right:: {
	switch {
	case Rider.IsActive:   Rider.Forward()
	case VsCode.IsActive:  VsCode.GoForward()
	case OperaGX.IsActive: OperaGX.Forward()
	case Discord.IsActive: Discord.Forward()
	case Chrome.IsActive:  Chrome.Forward()
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

!Home:: {
	switch {
	case Discord.IsActive: Discord.PreviousSection()
	default: SendInput("{Blind}{Home}")
	}
}

!End:: {
	switch {
	case Discord.IsActive: Discord.NextSection()
	default: SendInput("{Blind}{End}")
	}
}

^PgUp::OS.MoveCursorToFileBeginning()

^PgDn::OS.MoveCursorToFileEnd()

#HotIf