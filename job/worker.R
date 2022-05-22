worker_id = Sys.getenv('HOSTNAME')

while (T) {
    Sys.sleep(3)
    tryCatch({
        print('hi')
    }, error= function(e) {
        print(e)
    })
}
