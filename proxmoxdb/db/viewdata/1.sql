REM @&pfad\db\viewdata\1.sql

cl scr


PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Clients
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT
PROMPT


SELECT clientname
  FROM t_client
  ORDER BY clientname;



PROMPT (0) Back?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

cl scr
@&pfad.\db\viewdata\submen1.sql
