source('work_list.R')
source('data.R')

worker_id = Sys.getenv('HOSTNAME')

repeat {
    Sys.sleep(10)
    tryCatch({
        item = get_work_item(worker_id)
        # print(item)
        sido_cd = item[1, 'sido_cd']

        if (is.null(item)) {
            print('work_list empty')
            break
        }
        
        train_data = get_train_data(sido_cd)
        print(train_data)

        preprocessed_train_data = preprocess_train_data(train_data)
        print(preprocessed_train_data)

        item_id = item[1, 'id']
        set_work_done(item_id)
    }, error= function(e) {
        print(e)
    })
}
