libDirOld <- toString(getwd())
libDirOld <- paste(libDirOld, "lib", sep = "/")

listFiles <- list.files(path = libDirOld, pattern = "\\.RData", all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

listFiles <- toString(listFiles)

previousDate <- Sys.Date() - 1
previousDateString <- gsub("-", "", previousDate)

oldWorkspaceFolder <- paste(paste("20180227", previousDateString, sep = "-"), "coins_df.RData", sep = "_")

if ( oldWorkspaceFolder %in% listFiles ) {
  
  oldWorkspaceName <- paste(libDirOld, oldWorkspaceFolder, sep = "/")
  load(toString(oldWorkspaceName))
  keepGoing <- TRUE
  
} else {
  
  print("The workspace is already up-to-date!")
  keepGoing <- FALSE
  
}

