print("Hello admin !")

source('scripts/interfaces/admin/adminDecision.R')

if ( adminProcess == "update" ) {
  
  source('lib/polity/loadOldWorkspace.R')
 
  if ( keepGoing ) {
  
    source('src/scraping/getCoinsData.R')
    source('lib/polity/saveNewWorkspace.R')
    source('scripts/interfaces/admin/adminInvestigation.R')
    
  } else {
    
    source('scripts/interfaces/admin/adminInvestigation.R')
    source('lib/polity/loadLastWorkspace.R')
    
  }
  
} else if ( adminProcess == "investigate" ){

    source('scripts/interfaces/admin/adminInvestigation.R')
    source('lib/polity/loadLastWorkspace.R')
  
} else {
  
  print("Please check if the application has been loaded successfully!..")
  quit(save = "no", status = 0, runLast = TRUE)
  
}