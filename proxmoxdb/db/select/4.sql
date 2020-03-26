REM @&pfad\db\select\4.sql

cl scr

PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT Biggest Subnet
PROMPT
PROMPT+++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT

SELECT  SubnetID, count(*) AS anzahl
  FROM  t_client JOIN t_clientSubnet USING (VMID)
  GROUP BY SubnetID
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  t_clientSubnet
                       GROUP BY SubnetID
                    )
;




PROMPT
PROMPT
PROMPT (0) Back?
ACCEPT eingabe PROMPT "Ihre Auswahl: "

cl scr
@&pfad.\db\select\submen2.sql
