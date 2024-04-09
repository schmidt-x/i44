#HotIf Mode.IsNormal

*F13::return

*F14::Mode.SetInsert()

*F15::Mode.SetSymbol()

*F16::Mode.SetMouse()

*F17::Mode.SetSelect()

b:: {
	switch {
	case Rider.IsActive:  Rider.GoToDeclarationOrUsages()
	case VsCode.IsActive:	VsCode.GoToDefinition()
	}
}

+b:: {
	switch {
	case Rider.IsActive:  Rider.GoToImplementation()
	case VsCode.IsActive: VsCode.GoToImplementation()
	}
}

c:: {
	switch {
	case OperaGX.IsActive:  OperaGX.FocusOnAddressBar()
	case Chrome.IsActive:   Chrome.FocusOnAddressBar()
	case Explorer.IsActive: Explorer.FocusOnAddressBar()
	}
}

+c:: {
	switch {
	case Rider.IsActive:   Rider.DuplicateLineOrSelection()
	case VsCode.IsActive:  VsCode.CopyLineDown()
	case OperaGX.IsActive: OperaGX.DuplicateTab()
	}
}

+d:: {
	switch {
	case OperaGX.IsActive: OperaGX.ForceDarkPage()
	}
}

g::Terminal.Open()

h:: {
	switch {
	case Rider.IsActive:    Rider.Expand()
	case VsCode.IsActive:   VsCode.Unfold()
	case Obsidian.IsActive: Obsidian.FoldLess()
	}
}

+h:: {
	switch {
	case Rider.IsActive:    Rider.ExpandAll()
	case VsCode.IsActive:   VsCode.UnfoldAll()
	case Obsidian.IsActive: Obsidian.UnfoldAllHeadingsAndLists()
	}
}

k:: {
	switch {
	case Rider.IsActive:  Rider.MoveCaretToMatchingBrace()
	case VsCode.IsActive: VsCode.GotoBracket()
	}
}

^k:: {
	switch {
	case Rider.IsActive:  Rider.ToggleBreakpoint()
	case VsCode.IsActive: VsCode.ToggleBreakpoint()
	default: SendInput("{Blind}k")
	}
}

l:: {
	switch {
	case Rider.IsActive:  Rider.QuickDocumentation()
	case VsCode.IsActive: VsCode.ShowOrFocusHover()
	}
}

p:: {
	switch {
	case Rider.IsActive:    Rider.ErrorDescription()
	case Obsidian.IsActive: Obsidian.ToggleReadingView()
	case OperaGX.IsActive:  OperaGX.ReloadTab()
	case Chrome.IsActive:   Chrome.ReloadTab()
	case Discord.IsActive:  Discord.ReplyToMessage()
	}
}

+p:: {
	switch {
	case OperaGX.IsActive: OperaGX.ReloadWithoutCache()
	}
}

v::return

w:: {
	switch {
	case Rider.IsActive:    Rider.CloseTab()
	case VsCode.IsActive:   VsCode.CloseEditor()
	case Obsidian.IsActive: Obsidian.CloseCurrentTab()
	case OperaGX.IsActive:  OperaGX.CloseTab()
	case Chrome.IsActive:   Chrome.CloseTab()
	case Explorer.IsActive: Explorer.CloseTab()
	}
}

+w:: {
	switch {
	case Rider.IsActive:   Rider.ReopenLastClosedTab()
	case OperaGX.IsActive: OperaGX.ReopenLastClosedTabOrWindow()
	case VsCode.IsActive:  VsCode.ReopenLastClosedTab()
	}
}

x:: {
	switch {
	case Rider.IsActive:    Rider.Collapse()
	case VsCode.IsActive:   VsCode.Fold()
	case Obsidian.IsActive: Obsidian.FoldMore()
	case OperaGX.IsActive:  OperaGX.NewTab()
	case Chrome.IsActive:   Chrome.NewTab()
	case Explorer.IsActive: Explorer.NewTab()
	}
}

+x:: {
	switch {
	case Rider.IsActive:    Rider.CollapseAll()
	case VsCode.IsActive:   VsCode.FoldAll()
	case Obsidian.IsActive: Obsidian.FoldAllHeadingsAndLists()
	}
}

y:: {
	switch {
	case Rider.IsActive:   Rider.ParameterInfo()
	case VsCode.IsActive:  VsCode.ParameterHints()
	case OperaGX.IsActive: OperaGX.SpeedDial()
	case Discord.IsActive: Discord.EditMessage()
	}
}

':: {
	switch {
	case Rider.IsActive:  Rider.CommentLine()
	case VsCode.IsActive: VsCode.CommentLine()
	}
}

.:: {
	switch {
	case Rider.IsActive:  Rider.ContextActions()
	case VsCode.IsActive: VsCode.QuickFix()
	}
}

+Up::OS.ScrollUp()

+Down::OS.ScrollDown()

!Up:: {
	switch {
	case Rider.IsActive:  Rider.ScrollTerminalUp()
	case VsCode.IsActive: VsCode.ScrollTerminalUpByLine()
	default: OS.SendBlindUp()
	}
}

!Down:: {
	switch {
	case Rider.IsActive:  Rider.ScrollTerminalDown()
	case VsCode.IsActive: VsCode.ScrollTerminalDownByLine()
	default: OS.SendBlindDown()
	}
}

+!Up:: {
	switch {
	case VsCode.IsActive: VsCode.ScrollTerminalUpByPage()
	default: OS.SendBlindUp()
	}
}

+!Down:: {
	switch {
	case VsCode.IsActive: VsCode.ScrollTerminalDownByPage()
	default: OS.SendBlindDown()
	}
}

^Up:: {
	switch {
	case Rider.IsActive:    Rider.MoveLineUp()
	case VsCode.IsActive:   VsCode.MoveLineUp()
	case Obsidian.IsActive: Obsidian.MoveLineUp()
	default: OS.SendBlindUp()
	}
}

^Down:: {
	switch {
	case Rider.IsActive:    Rider.MoveLineDown()
	case VsCode.IsActive:   VsCode.MoveLineDown()
	case Obsidian.IsActive: Obsidian.MoveLineDown()
	default: OS.SendBlindDown()
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
	case Rider.IsActive:    Rider.Back()
	case VsCode.IsActive:   VsCode.GoBack()
	case OperaGX.IsActive:  OperaGX.Back()
	case Discord.IsActive:  Discord.Backward()
	case Chrome.IsActive:   Chrome.Back()
	case Obsidian.IsActive: Obsidian.NavigateBack()
	}
}

+!Right:: {
	switch {
	case Rider.IsActive:    Rider.Forward()
	case VsCode.IsActive:   VsCode.GoForward()
	case OperaGX.IsActive:  OperaGX.Forward()
	case Discord.IsActive:  Discord.Forward()
	case Chrome.IsActive:   Chrome.Forward()
	case Obsidian.IsActive: Obsidian.NavigateForward()
	}
}

^Home:: {
	switch {
	case Rider.IsActive:    Rider.PreviousTab()
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
	case VsCode.IsActive:   VsCode.NextTab()
	case Obsidian.IsActive: Obsidian.NextTab()
	case OperaGX.IsActive:  OperaGX.NextTab()
	case Chrome.IsActive:   Chrome.NextTab()
	case Explorer.IsActive: Explorer.NextTab()
	}
}

<!Home:: {
	switch {
	case Discord.IsActive: Discord.PreviousSection()
	default: SendInput("{Blind}{Home}")
	}
}

<!End:: {
	switch {
	case Discord.IsActive: Discord.NextSection()
	default: SendInput("{Blind}{End}")
	}
}

^PgUp::OS.MoveCursorToFileBeginning()

^PgDn::OS.MoveCursorToFileEnd()

#HotIf