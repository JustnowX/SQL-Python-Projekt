REM @&pfad\db\insdata\submen2.sql

REM insdata
cl scr

PROMPT Insert new Dataset
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
PROMPT (1) Insert Client
PROMPT
PROMPT (2) Insert Host
PROMPT
PROMPT (3) Insert HDD
PROMPT
PROMPT (4) Insert Subnet
PROMPT
PROMPT (5) Insert whole Dataset
PROMPT
PROMPT (0) Back
PROMPT
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "

@&pfad.\db\insdata\&eingabe..sql
