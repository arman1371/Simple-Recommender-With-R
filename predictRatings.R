predictRatings <- function(userCors, usersItems, userMean, userSd){
    pred <- data.frame(ItemID = colnames(usersItems), Predict = rep(NA, ncol(usersItems)), stringsAsFactors = F)
    for(i in 1:ncol(usersItems)){
        sharingNums <- !is.na(usersItems[,i]) & !is.na(userCors[,2])
        pred[i, 2] <- sum(usersItems[sharingNums,i] * userCors[sharingNums,2], na.rm = T) / sum(userCors[sharingNums,2], na.rm = T)
    }
    pred[,2] <- (pred[,2] * userSd) + userMean
    pred
}