REM @&pfad\db\deldata\submen4.sql

cl scr


PROMPT Delete Data
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT (1) Delete Client
PROMPT
PROMPT (2) Delete Host
PROMPT
PROMPT (3) Delete Subnet
PROMPT
PROMPT (4) Delete Hdd
PROMPT
PROMPT (0) Back
PROMPT
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "

@&pfad.\db\deldata\&eingabe..sql
