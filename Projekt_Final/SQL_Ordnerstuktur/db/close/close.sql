REM @&pfad.\db\close.sql
REM Auswahl
PROMPT
PROMPT
PROMPT
PROMPT (1) SQL wirklich beenden?
PROMPT (2) Zurueck zum Hauptmenue?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

@&pfad.\db\close\&eingabe..sql
