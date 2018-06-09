repeatValue_login <- TRUE

while ( repeatValue_login ) {
  
  loginType <- read_line("Would you like to login as admin or spectator: ")
  
  if ( loginType == "admin" ) {
  
    source('config/getPassword.R')
    loginValue <- 'admin'
    repeatValue_login <- FALSE  
    
  } else if ( loginType == 'spectator' ) {
    
    loginValue <- 'spectator'
    repeatValue_login <- FALSE
    
  } else {
    
    print("Please enter only \"admin\" or \"spectator\"")
    repeatValue_login <- TRUE
    
  }

}