source('config/formatControl.R')

repeatValue_date <- TRUE

while ( repeatValue_date ) {
  
  strWhich <- readline(prompt = "Would you like to get the all data set or in a specific date interval data set (all / specific): ")

  if ( strWhich == "all" ) {
    printf <- function(...) cat(sprintf(...))
    
    libDir_date <- toString(getwd())
    libDir_date <- paste(libDir_date, "lib", sep = "/")
    
    workspaceFolder_date <- list.files(path = libDir_date, pattern = "\\.RData", all.files = FALSE,
                                      full.names = FALSE, recursive = FALSE,
                                      ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
    workspaceFolder_date <- gsub("_coins_df.RData", "", gsub("20180227-", "", workspaceFolder_date))

    startDate <- "2018-02-27"
    endDate <- paste( substring(paste(substring(workspaceFolder_date, c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
    
    repeatValue_date <- FALSE
    
  } else if ( strWhich == "specific" ) {
    printf <- function(...) cat(sprintf(...))
    
    startDate_limit <- "2018-02-27"
    endDate_limit <- Sys.Date()
    
    isDateBoolean_start <- FALSE
    isGreaterThen_start <- FALSE
    isValidInterval <- FALSE
    
    while ( !isDateBoolean_start || !isGreaterThen_start || !isValidInterval) {
      strStart <- readline(prompt = "Please enter the start date in the format (yyyy-mm-dd): ")
      isDateBoolean_start <- IsDate( strStart )
      isGreaterThen_start <- startDate_limit <= strStart
      isValidInterval <- strStart <= endDate_limit
      if ( isDateBoolean_start ) {
        if ( isGreaterThen_start ) {
          if ( isValidInterval ) {
            startDate <- strStart
          } else {
            printf("Start date must be smaller today %s\n", endDate_limit)
          }
        } else {
          printf("Start date must be greater than or equal to %s, since my database create on this date :)\n", startDate_limit)
        }
      }
    }
    
    isDateBoolean_end <- FALSE
    isLessThen_end <- FALSE
    isValidInterval <- FALSE
    
    while ( !isDateBoolean_end || !isLessThen_end || !isValidInterval ) {
      strEnd <- readline(prompt = "Please enter the end date in the format (yyyy-mm-dd): ")
      isDateBoolean_end <- IsDate( strEnd )
      isLessThen_end <- strEnd <= endDate_limit
      isValidInterval <- startDate < strEnd
      if ( isDateBoolean_end ) {
        if (isLessThen_end) {
          if ( isValidInterval ) {
            endDate <- strEnd
          } else {
            printf("End date must be greater than start date %s\n", startDate)
          }
        } else {
          printf("End date must be smaller than or equal to %s, since I am not a fortune teller :)\n", endDate_limit)
        }
      }
    }
    
    repeatValue_date <- FALSE
    
  } else {
    print("Please enter only \"all\" or \"specific\"")

    repeatValue_date <- TRUE
    
  }
  
}
