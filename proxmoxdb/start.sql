REM Skript: start
REM @C:\Users\thema\Desktop\proxmoxdb\start.sql
REM Aufrufe des Hauptmenues: mainmenu.sql

SET ECHO OFF
CL SCR


REM Anmelden

ACCEPT benutzername PROMPT "Benutzername: " DEFAULT ora1

ACCEPT passwort PROMPT "Passwort: " DEFAULT ora1 HIDE

CONNECT &benutzername/&passwort

REM Eingabe des Projektpfades

ACCEPT pfad PROMPT "Eingabe des Projektpfades (z.b. C:\User\proxmoxdb): " DEFAULT C:\User\proxmoxdb


@&pfad.\mainmenu.sql
