; O  - remove the ending character
; b0 - don't delete the typed text
; *  - trigger immediately
; ?  - search everywhere (trigger even if the start is not separated from the previous text)


; --- dotnet ---

:?::dw:: {
	ClipSend("dotnet watch --no-hot-reload")
}

:?O::dusi:: {
	ClipSend("dotnet user-secrets init")
}

:?O::duss::dotnet user-secrets set "" ""{left 4}

:?::dr:: {
	ClipSend("dotnet run")
}

:?::dbr:: { 
	ClipSend("dotnet build -c Release")
}

; --- ---


; --- C# ---

:?O::wl::Console.WriteLine();{left 2}

:?::rk:: {
	ClipSend("Console.ReadKey();")
}

:?::dw:: {
	ClipSend("dotnet watch --no-hot-reload")
}

:?::rk:: {
	ClipSend("Console.ReadKey();")
}

:?::dw:: {
	ClipSend("dotnet watch --no-hot-reload")
}

:?O::nie:: {
	ClipSend("throw new NotImplementedException();")
}

; --- ---


; --- Rust ---

:?O::pl::println{!}("");{left 3}

; --- ---


; --- git/github ---

:?::grs:: {
	ClipSend("git reset --soft ")
}

:?::grh:: {
	ClipSend("git reset --hard ")
}

:?::-rs:: {
	ClipSend("--recurse-submodules")
}

:?O::ghm:: { ; me
	ClipSend("https://github.com/schmidt-x")
}

:?O::ghr:: { ; repos
	ClipSend("https://github.com/schmidt-x?tab=repositories")
}

; --- ---


; --- Youtube ---

:?::yt:: {
	ClipSend("https://www.youtube.com/")
}

:?::ytwl:: { ; watch later
	ClipSend("https://www.youtube.com/playlist?list=WL")
}

:?::ythis:: { ; history
	ClipSend("https://www.youtube.com/feed/history")
}

:?::ytp:: { ; playlist
	ClipSend("https://www.youtube.com/playlist?list=PLKRJNM-FYYn5cVrzOf7PKa4IPZSC8_v9y")
}

:?::yts:: { ; search
	ClipSend("https://www.youtube.com/results?search_query=")
}

; --- ---


; --- Qmk ---

:?O::qmk:: { ; docs
	ClipSend("https://docs.qmk.fm/#/")
}

:?O::qmkcp:: { ; compile
	ClipSend("qmk compile -kb ergohaven/k02 -km schmidt-x")
}

:?O::qmkmods:: { ; modifiers.h
	ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/modifiers.h")
}

:?O::qmkkc:: { ; keycodes.h
	ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/keycodes.h")
}

:?O::qmkqkc:: { ; quantum_keycodes.h
	ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/quantum_keycodes.h")
}

; --- ---


; --- misc ---

:?O::cg::<font color=gray></font>{left}^{left}{left 2}

:?::maps:: {
	ClipSend("https://www.google.com/maps/@32.8047169,51.095706,15508839m/data=!3m1!1e3?entry=ttu")
}

:?::gm:: {
	ClipSend("https://mail.google.com/mail/u/0/#all")
}

:?O::aaa:: {
	SendInput("// Arrange{Enter 3}// Act{Enter 3}// Assert{Enter}{Up 6}")
}

:?::bl:: {
	switch {
	case Obsidian.IsActive: Obsidian.PasteBoldLink()
	}
}

:?::gt:: {
	ClipSend(FormatTime(, "hh:mm:ss tt")) ; get time
}

:?::gd:: {
	ClipSend(FormatTime(, "MM.dd.yyyy")) ; get date
}

:?::gdt:: {
	ClipSend(FormatTime(, "dd.MM:yyyy hh:mm:ss tt")) ; get date-time
}

:?::sb:: {
	switch {
	case Obsidian.IsActive: Obsidian.PasteSpoilerBlock()
	}
}

:?::@:: {
	Sleep(100)
	
	_menu := Menu()
	_menu.Add("aboba228bibov@outlook.com", Sender)
	_menu.Add("schmidtsigma@gmail.com", Sender)
	_menu.Add("ukrainenko95@gmail.com", Sender)

	_menu.Show()
	
	Sender(item, *) {
		ClipSend(item)
		_menu := ""
	}
}

:?::tz:: {
	ClipSend("https://www.timeanddate.com/time/zone/")
}

:?::urb:: {
	ClipSend("https://www.urbandictionary.com/")
}