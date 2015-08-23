readFile <- function(fileDir, colNames, wantCols, sep = "|", quote = "", stAsF = T){
    rFile <- read.table(fileDir, sep = sep, quote = quote, stringsAsFactors = stAsF)
    rFile <- as.data.frame(rFile[,wantCols])
    colnames(rFile) <- colNames
    rFile
}