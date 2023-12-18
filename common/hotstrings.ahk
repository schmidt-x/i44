; O  - remove the ending character
; b0 - don't delete the typed text
; *  - trigger immediately
; ?  - search everywhere (trigger even if the start is not separated from the previous text)


:?::gr:: { 
	ClipSend("go run main.go")
}

:?::dw:: {
	ClipSend("dotnet watch --no-hot-reload")
}

:?O::dusi::dotnet user-secrets init
:?O::duss::dotnet user-secrets set "" ""{left 4}

:?::dr:: {
	ClipSend("dotnet run")
}

:?::dbr:: { 
	ClipSend("dotnet build -c Release")
}

:?O::cg::<font color=gray></font>{left}^{left}{left 2}
:?O::wl::Console.WriteLine();{left 2}
:?O::pl::fmt.Println(){left}

:?::rk:: {
	ClipSend("Console.ReadKey();")
}

:?::dw:: {
	ClipSend("dotnet watch --no-hot-reload")
}

; --- Github ---

:?::grs:: {
	ClipSend("git reset --soft ")
}

:?::grh:: {
	ClipSend("git reset --hard ")
}

:?::-rs:: {
	ClipSend("--recurse-submodules")
}

; --- ---


; --- Youtube ---

:?::yt:: {
	ClipSend("https://www.youtube.com/")
}

:?::ywl:: {
	ClipSend("https://www.youtube.com/playlist?list=WL")
}

:?::yhis:: {
	ClipSend("https://www.youtube.com/feed/history")
}

; --- ---

:?::maps:: {
	ClipSend("https://www.google.com/maps/@32.8047169,51.095706,15508839m/data=!3m1!1e3?entry=ttu")
}

:?::gm:: {
	ClipSend("https://mail.google.com/mail/u/0/#all")
}

:?O::aaa:: {
	SendInput("// Arrange{Enter 3}// Act{Enter 3}// Assert{Enter}{Up 6}")
}

; personal account
; login - haa1
:?O::psopas::{raw}W211231#g55

:?::bl:: {
	switch {
	case Obsidian.IsActive: Obsidian.SendBoldLink()
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
	case Obsidian.IsActive: Obsidian.SendSpoilerBlock()
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