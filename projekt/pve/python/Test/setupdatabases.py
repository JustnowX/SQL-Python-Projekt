import cx_Oracle

db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

#zeiger auf db_connection_string
cursor = con.cursor()

cursor.execute(f"""
    DROP TABLE t_client
    """)

cursor.execute(f"""
    DROP TABLE t_host
    """)

cursor.execute(f"""
    CREATE TABLE t_host
        (
            hid     VARCHAR2(30)     CONSTRAINT conhostid_thost PRIMARY KEY,
            fqdn    VARCHAR2(30)  CONSTRAINT nn_confqdn NOT NULL
                                    CONSTRAINT uni_confqdn UNIQUE
        )
""")

cursor.execute(f"""
    CREATE TABLE t_client
        (
            cid          VARCHAR2(30)        CONSTRAINT conclientid_tclient PRIMARY KEY,
            cHostname    VARCHAR2(30)        CONSTRAINT confqdn_nn_tclient NOT NULL
                                             CONSTRAINT confqdn_uniq_tclient UNIQUE,
            ip           VARCHAR2(30)        CONSTRAINT conip_tclient UNIQUE,
            sysart       VARCHAR2(30)        CONSTRAINT consysart_nn_tclient NOT NULL,
            hid          VARCHAR2(30),
            CONSTRAINT hostid_thost_tclient FOREIGN KEY (hid) REFERENCES t_host (hid)
        )
""")
cursor.execute(f"""
    INSERT
        INTO t_host
        VALUES (111, 'test.host.xxx')
""")
