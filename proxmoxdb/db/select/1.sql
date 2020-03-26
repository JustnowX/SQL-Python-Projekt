REM @&pfad\db\select\1.sql

cl scr

PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Clients with same OS_type
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT

SELECT OS_Type, count(Clientname) as Anzahl
  FROM t_client
  GROUP BY OS_Type;





PROMPT
PROMPT
PROMPT (0) Back?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

cl scr
@&pfad.\db\select\submen2.sql
