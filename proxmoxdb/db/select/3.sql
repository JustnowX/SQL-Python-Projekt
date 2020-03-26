REM @&pfad\db\select\3.sql

cl scr

PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Debian clients in Subnets
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT

SELECT Clientname, SubnetID
  FROM t_client c JOIN t_clientSubnet cs
    ON (c.VMID = cs.VMID)
  WHERE OS_type = 'debian';





PROMPT
PROMPT
PROMPT (0) Back?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

cl scr
@&pfad.\db\select\submen5.sql
