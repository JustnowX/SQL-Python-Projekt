REM @&pfad\db\select\2.sql

cl scr

PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Systems with more than 3 cores
PROMPT and 2000mb RAM
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT

SELECT VMID, Clientname
  FROM t_client
  WHERE cores > 3
  AND RAM > 2000;




PROMPT
PROMPT
PROMPT (0) Back?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

cl scr
@&pfad.\db\select\submen2.sql
