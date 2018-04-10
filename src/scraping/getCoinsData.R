library('rvest')
#library('ggplot2')

url <- 'https://coinmarketcap.com/'
webpage <- read_html(url)
name_data_html <- html_nodes(webpage, '.currency-name-container')
name_data <- html_text(name_data_html)

marketcap_data_html <- html_nodes(webpage, '.no-wrap.market-cap.text-right')
marketcap_data <- html_text(marketcap_data_html)
marketcap_data <- gsub("\n", "", marketcap_data)
marketcap_data <- gsub(",", "", marketcap_data)
marketcap_data <- gsub("\\$", "", marketcap_data)
marketcap_data <- as.numeric(marketcap_data)

price_data_html <- html_nodes(webpage, '.price')
price_data <- html_text(price_data_html)
price_data <- gsub("\n", "", price_data)
price_data <- gsub(",", "", price_data)
price_data <- gsub("\\$", "", price_data)
price_data <- as.numeric(price_data)

volume24_data_html <- html_nodes(webpage, '.volume')
volume24_data <- html_text(volume24_data_html)
volume24_data <- gsub("\n", "", volume24_data)
volume24_data <- gsub(",", "", volume24_data)
volume24_data <- gsub("\\$", "", volume24_data)
volume24_data <- as.numeric(volume24_data)

currentDate <- Sys.Date()
currentDateString <- gsub("-", "", currentDate)

dfName <- paste(currentDateString, "coins_df", sep="-")

coins_df <- data.frame(CoinName = name_data, MarketCap = marketcap_data, Price = price_data, Volume24h = volume24_data)
assign(dfName, coins_df)
daily_coins_df <- get(dfName)

rm(coins_df)

# str(daily_coins_df)
# daily_coins_df