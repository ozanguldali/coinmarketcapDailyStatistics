if ( ifGraph == 'yes' ) {

  xRange <- as.Date(as.character(get(coin_df_name)$RecordDates))
  xLabel <- "Record Dates (days)"
  dateInterval <- as.numeric(xRange[length(xRange)] - xRange[1])
  
  if ( columnName == 'Price' ) {
    yRange <- get(coin_df_name)$Price  
    yLabel <- "Price (dollar)"
    titlePlot = "Price / Record Dates Plot"
    byValue <- (max(yRange) - min(yRange)) / dateInterval
    if (byValue > 1000)
      byValue <- 1000
  } else {
    yRange <- get(coin_df_name)$MarketCap  
    yLabel <- "MarketCap (dollar)"
    titlePlot = "MarketCap / Record Dates Plot"
    byValue <- (max(yRange) - min(yRange)) / dateInterval
    if (byValue > 10000000000)
      byValue <- 10000000000
  }
  
  plot.new()
  
  par(cex.axis = 0.75)
  par(pch=19, col="blue")

  xSeqWeek <- seq(xRange[1],xRange[length(xRange)]+7, by = 7)
  xSeqMonth <- seq(xRange[1],xRange[length(xRange)]+7, by = 7)
  
  ySeq <- seq(min(yRange)-byValue, max(yRange)+byValue, by = byValue)
  
  xlimStart <-xRange[1]
  if(xRange[length(xRange)] < 7)
    xlimEnd <- xRange[length(xRange)] + xRange[length(xRange)]
  else
    xlimEnd <- xRange[length(xRange)]+7
  
  ylimStart <- min(yRange) - byValue
  if(ylimStart < 0)
    ylimStart <- 0
  ylimEnd <- max(yRange)+byValue
  
  plot.window(
         xlim = c(xlimStart,xlimEnd), xaxs = "i",
         ylim = c(ylimStart, ylimEnd), yaxs = "i"
    )
  
  abline( v = xSeqMonth, col = "gray")
  abline( h = ySeq, col = "gray")
  
  axis.Date(side = 1, at = xSeqWeek)
  axis(side = 2, at = ySeq)
  
  lines(xRange, yRange, lty = "solid", lwd = 2, type = "o")
  
  title(
        main = titlePlot,
        xlab = xLabel,
        ylab = yLabel
        )
  
  while ( repeatValue_graphAgain ) {
    source('src/run/puts/graphic/runGraphsOnceAgain.R')
  }
  
} else {
  
  print("Bye...")
  
}