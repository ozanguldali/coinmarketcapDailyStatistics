xRange <- get(coin_df_name)$RecordDates
priceRange <- get(coin_df_name)$Price
marketRange <- get(coin_df_name)$MarketCap

par(pch=19, col="blue")

plot(xrange, priceRange, xlab = "Record Dates (days)", ylab = "Price (dollar)", type = "o" )

lines(xrange, priceRange, type = "o")
