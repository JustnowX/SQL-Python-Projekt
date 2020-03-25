REM mainmenu.sql
REM @&pfad.\proxmoxdb\mainmenu.sql
REM Hauptmenue
REM

CL SCR

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
PROMPT (3) Search
PROMPT
PROMPT (4) Delete Data
PROMPT
PROMPT (5) Select
PROMPT
<<<<<<< HEAD
PROMPT (6) Reset Data
=======
PROMPT (6) Reset Tables
>>>>>>> 1ed5a67a31d0a10848a3a0c9226e4eeaaef4ce58
PROMPT
PROMPT (0) Close
PROMPT
PROMPT++++++++++++++++++++++++++++++++++++++
PROMPT
ACCEPT eingabe PROMPT "Ihre Auswahl: "

@&pfad.\db\mainmenu\&eingabe..sql
