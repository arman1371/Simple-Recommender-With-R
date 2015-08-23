createUsersItemsMatrix <- function(users, items, ratings){
    usersItems <- matrix(nrow = nrow(users), ncol = nrow(items))
    colnames(usersItems) <- items[,1]
    rownames(usersItems) <- users[,1]
    
    for(i in 1:nrow(ratings)){
        usersItems[toString(ratings[i, 1]), toString(ratings[i, 2])] <- ratings[i, 3]
    }
    as.data.frame(usersItems)
}