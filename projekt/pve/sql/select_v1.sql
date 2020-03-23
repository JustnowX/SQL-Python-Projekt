REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\select_v1.sql

set NULL 'N/A'
set linesize 200
set echo on
cl scr

conn ora1/ora1

SELECT fqdn, cid, sysart
  FROM t_client
  ORDER BY cid;

SELECT cfqdn, sysart, hfqdn
  FROM t_host h  JOIN t_client c     ON h.hid   = c.hid
 ;
