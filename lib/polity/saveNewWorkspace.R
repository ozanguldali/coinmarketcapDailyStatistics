rm(list = grep("coins_df", ls(), value = TRUE, invert = TRUE))
adminProcess <- "update"

libDirNew <- toString(getwd())
libDirNew <- paste(libDirNew, "lib", sep = "/")

currentDate <- Sys.Date()
currentDateString <- gsub("-", "", currentDate)

newWorkspaceFolder <- paste(paste("20180227", currentDateString, sep = "-"), "coins_df.RData", sep = "_")
newWorkspaceName <- paste(libDirNew, newWorkspaceFolder, sep = "/")

save.image(toString(newWorkspaceName))

listFiles <- list.files(path = libDirNew, pattern = "\\.RData", all.files = FALSE,
                        full.names = FALSE, recursive = FALSE,
                        ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

listFiles <- listFiles[!grepl(newWorkspaceFolder, listFiles)]

for ( i in ( 1 : length(listFiles) ) ) {
  if ( file.exists( paste(libDirNew, listFiles[i], sep = "/") ) )
    file.remove( paste(libDirNew, listFiles[i], sep = "/") )
}