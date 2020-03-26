REM mainmenu.sql
REM @&pfad.\proxmoxdb\mainmenu.sql
REM Hauptmenue
REM
conn ora1/ora1
define pfad = 'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\proxmoxdb'


cl scr
PROMPT ProxmoxDB
PROMPT
PROMPT ProxmoxDB Menue
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
PROMPT
PROMPT (1) View Database
PROMPT
PROMPT (2) Insert new Data
PROMPT
PROMPT (3) Search (Do not Click)
PROMPT
PROMPT (4) Delete Data
PROMPT
PROMPT (5) Select
PROMPT
PROMPT (0) Close
PROMPT
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "

@&pfad.\db\mainmenu\&eingabe..sql
