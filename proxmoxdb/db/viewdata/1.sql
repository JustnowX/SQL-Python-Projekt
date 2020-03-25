REM @&pfad\db\viewdata\1.sql

cl scr


PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Clients
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT
<<<<<<< HEAD



SELECT clientname
  FROM t_client
  ORDER BY clientname;





PROMPT
PROMPT

=======
>>>>>>> e028fc4e770221d63e43a59c612a8d6bff9beaf8
PROMPT (0) Back?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

cl scr
@&pfad.\db\viewdata\submen1.sql
