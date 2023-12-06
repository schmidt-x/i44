#HotIf Telegram.IsActive

Enter:: {
	Telegram.StartNewLine()
}

+Enter:: {
	Telegram.SendMessage()
}

#HotIf


#HotIf Terminal.IsActive

Enter:: {
	Terminal.ExecuteAndHide()
}

Escape:: {
	Terminal.ClearAndHide()
}

#HotIf


#HotIf Explorer.IsActive

^Enter:: {
	VsCode.OpenSelected()
}

#HotIf