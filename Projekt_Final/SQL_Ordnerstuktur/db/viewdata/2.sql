cl scr
REM @&pfad\db\viewdata\2.sql
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Hosts
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT
SELECT *
  FROM t_host
  ORDER BY Hostname;


PROMPT (0) Back?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

cl scr
@&pfad.\db\viewdata\submen1.sql
<<<<<<< HEAD
cl scr
=======
cl scr
>>>>>>> 23f8172c53e7d8a6c2fab21c3ab8ff8f32d8b93e
