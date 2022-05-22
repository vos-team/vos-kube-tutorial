dsn_database = "postgres"
dsn_hostname = "postgres"
dsn_port = "5432"
dsn_uid = "postgres"
dsn_pwd = "1234"

library(RPostgreSQL)
drv <- dbDriver("PostgreSQL")
print("Connecting to Database…")
con <- dbConnect(drv, 
                 dbname = dsn_database,
                 host = dsn_hostname, 
                 port = dsn_port,
                 user = dsn_uid, 
                 password = dsn_pwd)
print("Database Connected!")

dbSendQuery(con, "DROP TABLE IF EXISTS work_queue;")
dbSendQuery(con, "CREATE TABLE work_queue(id numeric, sido_cd text);")
dbSendQuery(con, "INSERT INTO work_queue VALUES(1,'11')")
dbSendQuery(con, "INSERT INTO work_queue VALUES(2,'28')")
dbSendQuery(con, "INSERT INTO work_queue VALUES(3,'41')")

df <- dbGetQuery(connec, "SELECT * FROM work_queue")
df
