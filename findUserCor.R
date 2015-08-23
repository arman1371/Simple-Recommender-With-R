findUserCor <- function(userID, usersItems){
    
    usersItems <- as.matrix(usersItems) #to increase speed
    
    userCors <- data.frame(UserID = rownames(usersItems), Cor = rep(NA, nrow(usersItems)), stringsAsFactors = F)
    for(i in 1:nrow(usersItems)){
        sharingNums <- !is.na(usersItems[userID,]) & !is.na(usersItems[i,])
        if(length(sharingNums[sharingNums]) > 30){
            userCors[i, 2] <- cor(usersItems[userID,], usersItems[i,], use = "na.or.complete")
            if(userCors[i, 2] < 0){
                userCors[i, 2] <- NA
            }
        }else{
            userCors[i, 2] <- NA
        }    
    }
    userCors
}