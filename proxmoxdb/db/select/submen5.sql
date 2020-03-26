REM @&pfad\db\select\submen5.sql

REM search

cl scr
PROMPT Select
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
PROMPT (1) Clients with same OS_type
PROMPT
PROMPT (2) Systems with more than 3 cores
PROMPT     and 2000mb RAM
PROMPT
PROMPT (3) Debian clients in Subnets
PROMPT
PROMPT (4) Biggest Subnet
PROMPT
PROMPT
PROMPT (0) Back
PROMPT
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "

@&pfad.\db\select\&eingabe..sql
