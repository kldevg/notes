﻿; AutoHotkey is a scripting language for Microsoft Windows which provides
; keyboard shortcuts that allows users to automate repetitive tasks.
;
; Hotkey Modifier Symbols
; https://www.autohotkey.com/docs/Hotkeys.htm#Symbols
;
; 1. Install it with Chocolatey: cinst autohotkey -y
; 2. Copy this file (AutoHotkey.ahk) to %UserProfile%\Documents
; 3. Create a shortcut to AutoHotkey in shell:startup
; 4. Run AutoHotkey
;
; --- Web pages ---------------------------------------------------------------

; Ctrl+Alt+C = opens Google Calendar in a new window of Chrome
; Ctrl+Alt+D = opens Google Drive in a new window of Chrome
; Ctrl+Alt+G = opens Gmail in a new window of Chrome
; Ctrl+Alt+M = opens Google Maps in a new window of Chrome
; Ctrl+Alt+T = opens Google Translate in a new window of Chrome

^!c::Run Chrome.exe "https://calendar.google.com/" " --new-window "
^!d::Run Chrome.exe "https://drive.google.com/" " --new-window "
^!g::Run Chrome.exe "https://mail.google.com/" " --new-window   "
^!m::Run Chrome.exe "https://www.google.ee/maps/" " --new-window "
^!j::Run Chrome.exe "https://keep.google.com/" " --new-window "
^!t::Run Chrome.exe "https://translate.google.com/" " --new-window "

; --- Local apps --------------------------------------------------------------

; Ctrl+Alt+K = launches or brings to front KeePass
^!k::
IfWinExist, KeePass
WinActivate
else
Run "C:\Program Files\KeePass Password Safe 2\KeePass.exe"
return

; --- File Explorer -----------------------------------------------------------

; F4 = sets view to details and all columns to fit width

F4::
send,{LCtrl down}{LShift down}6{LCtrl up}{LShift up}
send,{LCtrl down}{NumpadAdd}{LCtrl up}
return

; --- Acronyms ----------------------------------------------------------------

::bbl::be back later
::brb::be right back
::btw::by the way

; --- SQL ---------------------------------------------------------------------

::sfr::SELECT * FROM
:o:slk::LIKE '%%'{Left 2}

; --- Markdown --------------------------------------------------------------------

:o:mkc::````{Left 1}
:o:mkbc::```````n`n`````` {Up 1}

; --- System ------------------------------------------------------------------

; Win+F12 = Puts the computer to sleep
^#F12::
    ; Sleep/Suspend:
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    ; Hibernate:
    ;DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
    Return

; --- Typography ------------------------------------------------------------------

; Don't work with nordic layouts
; See https://stackoverflow.com/questions/71635253/how-to-send-tilde-or-backtick-in-autohotkey-using-a-nordic-keyboard-layout
<^>!,:: Send, ~
<^>!.:: Send, ``

; Produces a long dash — (in some keyboard layouts)
<^>!-:: Send, {U+2014}
