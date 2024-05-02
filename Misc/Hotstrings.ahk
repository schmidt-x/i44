; O  - remove the ending character
; b0 - don't delete the typed text
; *  - trigger immediately
; ?  - search everywhere (trigger even if the start is not separated from the previous text)


; --- dotnet ---

:?::dw:: {
	ClipSend("dotnet watch --no-hot-reload")
}

:?::dusi:: {
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

:?::nie:: {
	ClipSend("throw new NotImplementedException();")
}

; --- ---


; --- Rust ---

:?O::pl::println{!}("");{left 3}

:?::cr:: {
	ClipSend("cargo run")
}

:?::cch:: {
	ClipSend("cargo check")
}

; --- ---


; --- git/github ---

:?::grsh:: {
	ClipSend("git reset --soft HEAD~")
}

:?::grs:: {
	ClipSend("git reset --soft ")
}

:?::grhh:: {
	ClipSend("git reset --hard HEAD~")
}

:?::grh:: {
	ClipSend("git reset --hard ")
}

:?::-rs:: {
	ClipSend("--recurse-submodules")
}

:?::ghm:: { ; me
	ClipSend("https://github.com/schmidt-x")
}

:?::ghr:: { ; my repos
	ClipSend("https://github.com/schmidt-x?tab=repositories")
}

:?::gcm:: {
	SendInput("git cm `"`"{left}")
}

:?::ghqmki44:: {
	ClipSend("https://github.com/schmidt-x/qmk_firmware/tree/schmidt-x/keyboards/ergohaven/imperial44")
}

:?::ghahk:: {
	ClipSend("https://github.com/AutoHotkey/AutoHotkey")
}

; --- ---


; --- Youtube ---

:?::yt:: {
	ClipSend("https://www.youtube.com/")
}

:?::ytwl:: { ; watch later
	ClipSend("https://www.youtube.com/playlist?list=WL")
}

:?::ythis:: { ; watch history
	ClipSend("https://www.youtube.com/feed/history")
}

:?::ytp:: { ; «435» playlist
	ClipSend("https://www.youtube.com/playlist?list=PLKRJNM-FYYn5cVrzOf7PKa4IPZSC8_v9y")
}

; --- ---


; --- Qmk ---

:?::qmk:: { ; docs
	ClipSend("https://docusaurus.qmk.fm/")
	; ClipSend("https://docs.qmk.fm/#/") ; deprecated?
}

:?::cpi44:: {
	ClipSend("qmk compile -kb ergohaven/imperial44 -km schmidt-x")
}

:?::cpk02:: {
	ClipSend("qmk compile -kb ergohaven/k02 -km schmidt-x")
}

:?::qmkmods:: {
	ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/modifiers.h")
}

:?::qmkkc:: {
	ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/keycodes.h")
}

:?::qmkqkc:: {
	ClipSend("https://github.com/qmk/qmk_firmware/blob/master/quantum/quantum_keycodes.h")
}

; --- ---


; --- Twitch ---

:?::twch:: {
	ClipSend("https://www.twitch.tv/directory/category/just-chatting")
}

:?::twtr:: {
	ClipSend("https://www.twitch.tv/directory/category/escape-from-tarkov")
}

; --- --- 


; --- misc ---

:?O::dll::DllCall(""){Left 2}

:?::gxsh:: {
	ClipSend("opera://settings/keyboardShortcuts")
}

:?::cg:: {
	switch {
	case Obsidian.IsActive: SendInput("<font color=gray></font>{left}^{left}{left 2}")
	}
}

:?::maps:: {
	ClipSend("https://www.google.com/maps/@32.8047169,51.095706,15508839m/data=!3m1!1e3?entry=ttu")
}

:?::gm:: {
	ClipSend("https://mail.google.com/mail/u/0/#all")
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
	ClipSend(FormatTime(, "hh:mm:ss tt")) ; get time
}

:?::gd:: {
	ClipSend(FormatTime(, "dd.MM.yyyy")) ; get date
}

:?::gdt:: {
	ClipSend(FormatTime(, "dd.MM.yyyy hh:mm:ss tt")) ; get date-time
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