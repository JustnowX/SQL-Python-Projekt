
REM @C:\Users\thema\Desktop\proxmoxdb\db\insdata\1.sql

cl scr

PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Delete Client
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT




SELECT clientname, VMID
  FROM t_client
  ORDER BY clientname;



ACCEPT del PROMPT "Welchen Client loeschen:(0 = keinen)  "
ACCEPT id PROMPT  "VMID des Clients:  "
DELETE FROM t_client
  WHERE clientname = '&del';

DELETE FROM t_clientSubnet
  WHERE VMID = id

COMMIT;

PROMPT
PROMPT
PROMPT (0) Back?
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "
cl scr

@&pfad.\db\deldata\submen4.sql
