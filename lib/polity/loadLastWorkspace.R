libDirectory <- toString(getwd())
libDirectory <- paste(libDirectory, "lib", sep = "/")

lastWorkspaceFolder <- list.files(path = libDirectory, pattern = "\\.RData", all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

if ( length(lastWorkspaceFolder) > 0 ) {

  lastWorkspaceFolder <- toString(max(lastWorkspaceFolder))
  
  lastWorspaceName <- paste(libDirectory, lastWorkspaceFolder, sep = "/")
  
  load(toString(lastWorspaceName))
  
} else {
  
  print("FATAL ERROR!")
  print("Your database does not include any workspace...")
  quit(save = "no", status = 0, runLast = TRUE)
  
}