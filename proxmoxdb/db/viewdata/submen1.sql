REM View Database

REM \db\viewdata\submen1.sql

cl scr
PROMPT View Database
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
PROMPT (1) Clients
PROMPT
PROMPT (2) Hosts
PROMPT
PROMPT (3) HDDs
PROMPT
PROMPT (4) Subnet
PROMPT
PROMPT (0) Back
PROMPT
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "



@&pfad.\db\viewdata\&eingabe..sql
