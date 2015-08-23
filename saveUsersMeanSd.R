saveUsersMeanSd <- function(usersItems){
    uIRM <- rowMeans(usersItems, na.rm = T)
    uIRSD <- apply(usersItems, 1, sd, na.rm = T)
    data.frame(UserID = rownames(usersItems), Mean = uIRM, SD = uIRSD, stringsAsFactors = F)
}