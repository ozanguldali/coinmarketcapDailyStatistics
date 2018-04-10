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
  
} else {
  
  source('lib/polity/loadLastWorkspace.R')
  
}