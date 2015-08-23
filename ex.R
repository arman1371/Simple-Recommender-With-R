###############################
userID <- 768  # Set user id for recommend
NRec <- 5   # Set number of recommends
###############################

library(caret)

source("readFile.R")
source("createUsersItemsMatrix.R")
source("findUserCor.R")
source("predictRatings.R")
source("saveUsersMeanSd.R")
source("findTopNRec.R")
source("calculateError.R")

ratings <- readFile(fileDir = "ml-100k/u.data",colNames = c("User", "Item", "Rate"), wantCols = 1:3, sep = "")
users <- readFile(fileDir = "ml-100k/u.user", colNames = c("UserID"), wantCols = 1)
items <- readFile(fileDir = "ml-100k/u.item", colNames = c("ItemID", "ItemName"), wantCols = 1:2, stAsF = F)

trainSetIndex <- createDataPartition(ratings[,1], p = 0.9, list = F)
trainRatings <- ratings[trainSetIndex,]
testRatings <- ratings[-trainSetIndex,]

usersItems <- createUsersItemsMatrix(users, items, trainRatings)

usersMeanSd <- saveUsersMeanSd(usersItems)

usersItems <- (usersItems - usersMeanSd[,"Mean"]) / usersMeanSd[,"SD"]

userCors <- findUserCor(userID, usersItems)

userPreds <- predictRatings(userCors, usersItems, usersMeanSd[usersMeanSd[,1] == userID,2], usersMeanSd[usersMeanSd[,1] == userID, 3])

sumErr <- calculateError(userID, testRatings, userPreds)

topNRec <- findTopNRec(userID, usersItems, userPreds, NRec)

topNRec[,3] <- items[as.character(topNRec[,1]), 2]

print(paste0("Top N recommend for user ", userID, " is:"))
print(topNRec)

print(paste0("RMSE for this user is: ", sumErr))
