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

get_work_item = function(worker_id) {
    tryCatch({
        first_set_worker_id = paste("update work_list
            set worker_id='", worker_id, "'
            where id = (select 
                            min(id)
                        from work_list 
                        where worker_id isnull 
                            and not done);")
        
        dbSendQuery(con, first_set_worker_id)

        second_get_item_with_worker_id = paste("select * from work_list 
                                                where worker_id='", worker_id, "' 
                                                    and not done
                                                limit 1;")
        df = dbGetQuery(con, second_get_item_with_worker_id)

        if (nrow(df)==1) {
            return(df)
        } else {
            return(NULL)
        }
    }, error= function(e) {
        print(e)
    })
}

set_work_done = function(item_id) {
    tryCatch({
        make_done_true_with_item_id = paste("update work_list
        set done=true
        where id=", item_id, ";")

        dbSendQuery(con, make_done_true_with_item_id)
    }, error= function(e) {
        print(e)
    })
}
