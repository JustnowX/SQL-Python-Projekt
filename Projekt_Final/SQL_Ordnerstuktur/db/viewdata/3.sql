cl scr
REM @&pfad\db\viewdata\3.sql


PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT HDDs
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT


SELECT *
  FROM t_HDDs
  ORDER BY HDD_ID;
POMPPT
PROMPT
PROMPT (0) Back?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

cl scr
@&pfad.\db\viewdata\submen1.sql
