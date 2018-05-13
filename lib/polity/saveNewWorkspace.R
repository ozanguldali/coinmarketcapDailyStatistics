rm(list = grep("coins_df", ls(), value = TRUE, invert = TRUE))
adminProcess <- "update"

libDirNew <- toString(getwd())
libDirNew <- paste(libDirNew, "lib", sep = "/")

previousDate <- Sys.Date() - 1
previousDateString <- gsub("-", "", previousDate)

currentDate <- Sys.Date()
currentDateString <- gsub("-", "", currentDate)

oldWorkspaceFolder <- paste(paste("20180227", previousDateString, sep = "-"), "coins_df.RData", sep = "_")
oldWorkspaceName <- paste(libDirNew, oldWorkspaceFolder, sep = "/")

newWorkspaceFolder <- paste(paste("20180227", currentDateString, sep = "-"), "coins_df.RData", sep = "_")
newWorkspaceName <- paste(libDirNew, newWorkspaceFolder, sep = "/")

save.image(toString(newWorkspaceName))

if (file.exists(oldWorkspaceName))
  file.remove(oldWorkspaceName)