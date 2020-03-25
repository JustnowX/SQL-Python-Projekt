REM @C:\Users\thema\Desktop\proxmoxdb\db\insdata\submen4.sql

REM search


PROMPT Delete Data
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT (1) Delete Table
PROMPT
PROMPT (2) Delete Dataset
PROMPT
PROMPT
PROMPT
PROMPT (0) Back
PROMPT
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "

@&pfad.\db\deldata\&eingabe..sql
