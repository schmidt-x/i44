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
	Terminal.Execute()
}

Esc:: {
	Terminal.Close()
}

#HotIf


#HotIf Explorer.IsActive

^Enter:: {
	VsCode.OpenSelected()
}

#HotIf