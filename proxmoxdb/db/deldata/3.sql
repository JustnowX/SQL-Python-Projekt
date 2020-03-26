REM @C:\Users\thema\Desktop\proxmoxdb\db\insdata\3.sql

cl scr

PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Delete Subnet
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT




SELECT Subnet
  FROM t_subnet
  ORDER BY t_subnet;



ACCEPT del PROMPT "Welches Subnet loeschen?(0 = keinen)  "
DELETE FROM t_subnet
  WHERE t_subnet = '&del';
cl scr

COMMIT;




PROMPT
PROMPT
PROMPT (0) Back?
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "
cl scr

@&pfad.\db\deldata\submen4.sql
