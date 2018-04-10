libDirectory <- toString(getwd())
libDirectory <- paste(libDirectory, "lib", sep = "/")

lastWorkspaceFolder <- list.files(path = libDirectory, pattern = "\\.RData", all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

lastWorkspaceFolder <- toString(lastWorkspaceFolder)

lastWorspaceName <- paste(libDirectory, lastWorkspaceFolder, sep = "/")

load(toString(lastWorspaceName))