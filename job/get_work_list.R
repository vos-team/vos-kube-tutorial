library(RPostgreSQL)

database = "postgres"
hostname = "postgres"
port = "5432"
user = "postgres"
pwd = Sys.getenv('POSTGRES_PASSWORD')
if (nchar(pwd)==0) {pwd = 'password'}

drv = dbDriver("PostgreSQL")
con = dbConnect(drv, 
    dbname = database,
    host = hostname, 
    port = port,
    user = user, 
    password = pwd
)

get_work_list = function(con, worker_id) {
    set_worker_id_first = paste("update work_list
        set worker_id='", worker_id, "'
        where id = (select min(id) from work_list where worker_id isnull and result isnull);"
    )
    dbSendQuery(con, set_worker_id_first)

    get_item_with_worker_id_second = paste("select * from work_list where worker_id='", worker_id, "';")
    df = dbGetQuery(con, get_item_with_worker_id_second)

    if (nrows(df)==1) {
        return(df)
    } else {
        return(NULL)
    }
}


# set_worker_id_first = paste("update work_list set worker_id='", worker_id, "' where id = (select min(id) from work_list where worker_id isnull and result isnull);", sep='')
# dbSendQuery(con, set_worker_id_first)
worker_id = '1'

get_item_with_worker_id_second = paste("select * from work_list where id=", worker_id, ";")
print(get_item_with_worker_id_second)
df = dbGetQuery(con, get_item_with_worker_id_second)

print(df)