; O  - remove the ending character
; b0 - don't delete the typed text
; *  - trigger immediately
; ?  - search everywhere (trigger even if the start is not separated from the previous text)


; --- dotnet ---

:?::dw:: {
	Helper.ClipSend("dotnet watch --no-hot-reload")
}

:?::dusi:: {
	Helper.ClipSend("dotnet user-secrets init")
}

:?O::duss::dotnet user-secrets set "" ""{left 4}

:?::dr:: {
	Helper.ClipSend("dotnet run")
}

:?::dbr:: { 
	Helper.ClipSend("dotnet build -c Release")
}

; --- ---

; --- C# ---

:?O::wl::Console.WriteLine();{left 2}

:?::rk:: {
	Helper.ClipSend("Console.ReadKey();")
}

:?::dw:: {
	Helper.ClipSend("dotnet watch --no-hot-reload")
}

:?::nie:: {
	Helper.ClipSend("throw new NotImplementedException();")
}

; --- ---


; --- Rust ---

:?O::pl::println{!}("");{left 3}

:?::cr:: {
	Helper.ClipSend("cargo run")
}

:?::cch:: {
	Helper.ClipSend("cargo check")
}

; --- ---


; --- git/github ---

:?::grsh:: {
	Helper.ClipSend("git reset --soft HEAD~")
}

:?::grs:: {
	Helper.ClipSend("git reset --soft ")
}

:?::grhh:: {
	Helper.ClipSend("git reset --hard HEAD~")
}

:?::grh:: {
	Helper.ClipSend("git reset --hard ")
}

:?::-rs:: {
	Helper.ClipSend("--recurse-submodules")
}

:?::ghm:: { ; me
	Helper.ClipSend("https://github.com/schmidt-x")
}

:?::ghr:: { ; my repos
	Helper.ClipSend("https://github.com/schmidt-x?tab=repositories")
}

:?::gcm:: {
	SendInput("git cm `"`"{left}")
}

:?::ghqmki44:: {
	Helper.ClipSend("https://github.com/schmidt-x/qmk_firmware/tree/schmidt-x/keyboards/ergohaven/imperial44")
}

; --- ---


; --- Youtube ---

:?::yt:: {
	Helper.ClipSend("https://www.youtube.com/")
}

:?::ytwl:: { ; watch later
	Helper.ClipSend("https://www.youtube.com/playlist?list=WL")
}

:?::ythis:: { ; watch history
	Helper.ClipSend("https://www.youtube.com/feed/history")
}

:?::ytp:: { ; «435» playlist
	Helper.ClipSend("https://www.youtube.com/playlist?list=PLKRJNM-FYYn5cVrzOf7PKa4IPZSC8_v9y")
}

; --- ---


; --- Qmk ---

:?::qmk:: { ; docs
	Helper.ClipSend("https://docusaurus.qmk.fm/")
	; Helper.ClipSend("https://docs.qmk.fm/#/") ; deprecated?
}

:?::cpi44:: {
	Helper.ClipSend("qmk compile -kb ergohaven/imperial44 -km schmidt-x")
}

:?::cpk02:: {
	Helper.ClipSend("qmk compile -kb ergohaven/k02 -km schmidt-x")
}

:?::qmkmods:: {
	Helper.ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/modifiers.h")
}

:?::qmkkc:: {
	Helper.ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/keycodes.h")
}

:?::qmkqkc:: {
	Helper.ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/quantum_keycodes.h")
}

; --- ---


; --- Twitch ---

:?::twch:: {
	Helper.ClipSend("https://www.twitch.tv/directory/category/just-chatting")
}

:?::twtr:: {
	Helper.ClipSend("https://www.twitch.tv/directory/category/escape-from-tarkov")
}

; --- --- 


; --- misc ---

:?::gxsh:: {
	Helper.ClipSend("opera://settings/keyboardShortcuts")
}

:?::cg:: {
	switch {
	case Obsidian.IsActive: SendInput("<font color=gray></font>{left}^{left}{left 2}")
	}
}



:?::maps:: {
	Helper.ClipSend("https://www.google.com/maps/@32.8047169,51.095706,15508839m/data=!3m1!1e3?entry=ttu")
}

:?::gm:: {
	Helper.ClipSend("https://mail.google.com/mail/u/0/#all")
}

:?::aaa:: {
	SendInput("// Arrange{Enter 3}// Act{Enter 3}// Assert{Enter}{Up 6}")
}

:?::bl:: {
	switch {
	case Obsidian.IsActive: Obsidian.PasteBoldLink()
	}
}

:?::gt:: {
	Helper.ClipSend(FormatTime(, "hh:mm:ss tt")) ; get time
}

:?::gd:: {
	Helper.ClipSend(FormatTime(, "dd.MM.yyyy")) ; get date
}

:?::gdt:: {
	Helper.ClipSend(FormatTime(, "dd.MM.yyyy hh:mm:ss tt")) ; get date-time
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
		Helper.ClipSend(item)
		_menu := ""
	}
}

:?::tz:: {
	Helper.ClipSend("https://www.timeanddate.com/time/zone/")
}

:?::urb:: {
	Helper.ClipSend("https://www.urbandictionary.com/")
}