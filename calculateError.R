calculateError <- function(userID, testRatings, userPreds){
    testRatings <- testRatings[testRatings[,1] == userID,]
    sumErr <- 0
    for(i in 1:nrow(testRatings)){
        sumErr <- sumErr + ((userPreds[toString(testRatings[i, 2]),2] - testRatings[i, 3]) ^ 2)
    }
    sumErr <- sqrt(sumErr / nrow(testRatings))
    sumErr
}