
REM @&pfad\db\deldata\2.sql

cl scr

PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Delete Host
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT





SELECT Hostname
  FROM t_host
  ORDER BY Hostname;



ACCEPT del PROMPT "Welchen Host loeschen?(0 = keinen)  "
DELETE FROM t_host
  WHERE hostname = '&del';
cl scr

COMMIT;



PROMPT
PROMPT
PROMPT
PROMPT (0) Back?
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "
cl scr

@&pfad.\db\deldata\submen4.sql
