#HotIf Terminal.IsActive

Enter:: {
	Terminal.Execute(&err)
	
	if err {
		Helper.Display(err)
	}
}

Esc:: {
	Terminal.Close()
}

^Bs:: {
	SendInput("{Ctrl Down}{Left}{Del}{Ctrl Up}")
}

#HotIf