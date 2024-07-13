#HotIf Mode.IsMouse

*F13::Mode.SetNormal()

*F14::Mode.SetInsert()

F3:: {
	switch {
	case Rider.IsActive:  Rider.StopDebugger()
	case VsCode.IsActive: VsCode.StopDebugger()
	}
}

F4:: {
	switch {
	case Rider.IsActive:  Rider.RerunDebugger()
	case VsCode.IsActive: VsCode.RestartDebugger()
	}
}

; F5:: {
; 	; start debugging
; }

F6:: {
	switch {
	case Rider.IsActive:  Rider.StepOut()
	case VsCode.IsActive: VsCode.StepOut()
	}
}

F7:: {
	switch {
	case Rider.IsActive: Rider.StepOver()
	case VsCode.IsActive: VsCode.StepOver()
	}
}

F8:: {
	switch {
	case Rider.IsActive:  Rider.StepInto()
	case VsCode.IsActive: VsCode.StepInto()
	}
}

#HotIf