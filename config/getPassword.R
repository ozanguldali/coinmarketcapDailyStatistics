password <- 'admin'
repeatValue_password <- TRUE
repeatedIteration_password <- 0

while ( repeatValue_password & repeatedIteration_password < 3 ) {
  
  enteredPassw <- read_line("Please enter the password for admin user: ")
  
  if ( enteredPassw == password ) {
    
    repeatedIteration_password <- 0
    print("Logined Successfully !")
    repeatValue_password <- FALSE
    
  } else {

    repeatedIteration_password <- repeatedIteration_password + 1
    printf("You have %d tries left\n", 3 - repeatedIteration_password)
    repeatValue_password <- TRUE
    
  }
  
} 

if (repeatedIteration_password >= 3 ) {
  
  print("Login has been locked. Bye...")
  quit(save = "no", status = 0, runLast = TRUE)
  
}