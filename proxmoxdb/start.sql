REM Start
REM @&pfad.\proxmoxdb\start.sql
REM Aufrufe des Hauptmenues: mainmenu.sql

SET ECHO OFF
CL SCR

conn ora1/ora1
REM Anmelden

REM ACCEPT benutzername PROMPT "Benutzername: " DEFAULT ora1

REM ACCEPT passwort PROMPT "Passwort: " DEFAULT ora1 HIDE

REM CONNECT &benutzername/&passwort

REM Eingabe des Projektpfades

ACCEPT pfad PROMPT "Eingabe des Projektpfades (z.b. C:\User\proxmoxdb): " DEFAULT C:\User\proxmoxdb


@&pfad.\mainmenu.sql
