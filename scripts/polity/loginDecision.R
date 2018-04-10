if ( loginValue == 'admin' ) {
  
  source('scripts/interfaces/admin/adminApp.R')
  comingFrom <- 'admin'
  
} else {
  
  source('scripts/interfaces/spectator/spectatorApp.R')
  comingFrom <- 'spectator'
  
}