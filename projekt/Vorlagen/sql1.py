import cx_Oracle
db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

cursor = con.cursor()

cursor.execute("""
    DROP TABLE test
""")

cursor.execute("""
CREATE TABLE test
(
familie varchar2(20),
name varchar2(20) PRIMARY KEY,
blub number(10),
bla number(10)
)
""")
con.commit()

#REM print("Database version:", con.version)
con.close()
