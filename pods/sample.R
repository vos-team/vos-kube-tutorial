library(RPostgreSQL)

database = "postgres"
hostname = "postgres"
port = "5432"
user = "postgres"
pwd = "1234"

drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, 
                 dbname = database,
                 host = hostname, 
                 port = port,
                 user = user, 
                 password = pwd)
print("Database Connected!")

dbSendQuery(con, "DROP TABLE IF EXISTS work_list;")
dbSendQuery(con, "CREATE TABLE work_list(id numeric, sido_cd text);")
dbSendQuery(con, "INSERT INTO work_list VALUES(1,'11')")
dbSendQuery(con, "INSERT INTO work_list VALUES(2,'28')")
dbSendQuery(con, "INSERT INTO work_list VALUES(3,'41')")

df <- dbGetQuery(connec, "SELECT * FROM work_list")
df
