if ( ifGraph == 'yes' ) {

  xRange <- get(coin_df_name)$RecordDates
  xLabel <- "Record Dates (days)"
  
  if ( columnName == 'Price' ) {
    yRange <- get(coin_df_name)$Price  
    yLabel <- "Price (dollar)"
    title = "Price / Record Dates Plot"
  } else {
    yRange <- get(coin_df_name)$MarketCap  
    yLabel <- "MarketCap (dollar)"
    title = "MarketCap / Record Dates Plot"
  }
  
  par(cex.axis = 0.75)
  par(pch=19, col="blue")

  # xSeq <- seq(as.Date(levels(xRange)[1]), as.Date(levels(xRange)[length(xRange)]), 7)
  # ySeq <- c(min(as.integer(yRange)), max(as.integer(yRange)), 250)
  
  plot(xRange,
       yRange,
       # xlim = c(as.Date(min(levels(xRange)[xRange])), as.Date(max(levels(xRange)[xRange]))),
       # ylim = c(min(yRange), max(yRange)),
       xlab = xLabel,
       ylab = yLabel,
       type = "l",
       main = title)
  
  # axis(side = 1, at = xSeq)
  # axis(side = 2, at = ySeq)

  lines(xRange, yRange, type = "o")
  
  grid(nx = length(xRange), ny = 10, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = TRUE)
  
  while ( repeatValue_graphAgain ) {
    source('src/run/puts/graphic/runGraphsOnceAgain.R')
  }
  
} else {
  
  print("Bye...")
  
}