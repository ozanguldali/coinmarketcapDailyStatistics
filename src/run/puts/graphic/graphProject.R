xRange <- get(coin_df_name)$RecordDates
xLabel <- "Record Dates (days)"

if ( columnName == 'Price' ) {
  yRange <- get(coin_df_name)$Price  
  yLabel <- "Price (dollar)"
} else {
  yRange <- get(coin_df_name)$MarketCap  
  yLabel <- "MarketCap (dollar)"
}


par(pch=19, col="blue")

plot(xRange, yRange, xlab = xLabel, ylab = yLabel, type = "o" )

lines(xRange, yRange, type = "o")

while ( repeatValue_graphAgain ) {
  source('src/run/puts/graphic/runGraphsOnceAgain.R')
}