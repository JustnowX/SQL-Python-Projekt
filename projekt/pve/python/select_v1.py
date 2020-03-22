# C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\insertmanuel_V0_1.py
import cx_Oracle
db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

cursor = con.cursor()


cursor.execute("SELECT * FROM t_client")
rows = cursor.fetchall()
for row in rows:
    print(row)




# con.commit()
# config.close()
