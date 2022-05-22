library(RPostgreSQL)

get_train_data = function(sido_cd) {
    print(paste('getting data with sido_cd:', sido_cd))

    Sys.sleep(3) # 데이터 가져오기
    train_data = data.frame(
        pnu=paste(rep(sido_cd, 3), c("68010600109450010","68010600109450010","68010600109450010"), sep=''),
        landuse=c('일반상업지역','준주거지역','제2종일반주거지역'),
        price=c(100, NA ,70),
        stringsAsFactors = FALSE)

    return(train_data)
}

preprocess_train_data = function(train_data) {
    Sys.sleep(5) # 데이터 전처리
    preprocessed_train_data = na.omit(train_data)
    
    omitted_cnt = nrow(train_data) - nrow(preprocessed_train_data)
    print(paste(omitted_cnt, 'rows omitted'))
    return(preprocessed_train_data)
}
