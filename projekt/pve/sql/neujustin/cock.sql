REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\neujustin\cock.sql

conn ora1/ora1

REM Wie viele CLients mit gleichem OS_type gibt es.

SELECT OS_Type, count(Clientname) as Anzahl
  FROM t_client
  GROUP BY OS_Type;

REM Gib systeme aus die mehr als 3 kerne haben
REM und mehr arbeits speicher als 2000 mb habven

SELECT VMID, Clientname
  FROM t_client
  WHERE cores > 3
  AND RAM > 2000;

REM In welchem Subnet sind die Debian clients

SELECT Clientname, SubnetID
  FROM t_client c JOIN t_clientSubnet cs
    ON (c.VMID = cs.VMID)
  WHERE OS_type = 'debian';

REM Welches Subnet hat die Meinsten Clients
SELECT  SubnetID, count(*) AS anzahl
  FROM  t_client JOIN t_clientSubnet USING (VMID)
  GROUP BY SubnetID
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  t_clientSubnet
                       GROUP BY SubnetID
                    )
;
