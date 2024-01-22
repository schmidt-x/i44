#HotIf Terminal.IsActive

Enter:: {
	Terminal.Execute(&err)
	
	if err {
		Display(err)
	}
}

Esc:: {
	Terminal.Close()
}

#HotIf