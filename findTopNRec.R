findTopNRec <- function(userID, usersItems, userPreds, n = 5){
    userNotRates <- usersItems[toString(userID), is.na(usersItems[toString(userID), ])]
    userPreds <- userPreds[as.character(colnames(userNotRates)),]
    topN <- head(userPreds[order(userPreds[,2], decreasing = T),], n = n)
    topN
}