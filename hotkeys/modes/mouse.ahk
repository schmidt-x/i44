#HotIf Mode.IsMouse

F3:: {
	switch {
	case Rider.IsActive: Rider.StopDebugger()
	}
}

F4:: {
	switch {
	case Rider.IsActive: Rider.RerunDebugger()
	}
}

; F5:: {
; 	; start debugging
; }

F6:: {
	switch {
	case Rider.IsActive: Rider.StepOut()
	}
}

F7:: {
	switch {
	case Rider.IsActive: Rider.StepOver()
	}
}

F8:: {
	switch {
	case Rider.IsActive: Rider.StepInto()
	}
}

#HotIf