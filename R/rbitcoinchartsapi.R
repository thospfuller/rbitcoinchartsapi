###
### install.packages("RCurl", dependencies = TRUE)
###
#.onLoad <- function (libname, pkgname) {
#    library("RCurl")
#    library("RJSONIO")
#}

.onUnload <- function (libpath) {
}

### Bitcoincharts offers weighted prices for several currencies at
### http://api.bitcoincharts.com/v1/weighted_prices.json. You can use this to
### price goods and services in Bitcoins. This will yield much lower
### fluctuations than using a single market's latest price.
### Weighted prices are calculated for the last 24 hours, 7 days and 30 days.
### If there are no trades during an interval (like no trade within 24 hours)
### no value will be returned.
###
### For example:
###
### weightedPrices <- GetWeightedPrices ()
###
GetWeightedPrices <- function () {
    data <- getURL("http://api.bitcoincharts.com/v1/weighted_prices.json")
    dataFrame <- RJSONIO::fromJSON(data)
    return (dataFrame)
}

### You can access general market data at
### http://api.bitcoincharts.com/v1/markets.json. This will return an array
### with elements for each market.
###
### For example:
###
### params <- list (currency="USD")
###
### usd <- GetMarketData (params)
###
GetMarketData <- function (params) {
    data <- getForm("http://api.bitcoincharts.com/v1/markets.json", .params=params)
    dataFrame <- RJSONIO::fromJSON(data)
    return (dataFrame)
}

### Trade data is available as CSV, delayed by approx. 15 minutes. It will
### return the 2000 most recent trades.
###
### For example:
###
### params <- list (symbol="btceUSD")
###
### historicData <- GetHistoricTradeData (params)
###
### Pick one of the symbols from here:
###
### http://bitcoincharts.com/markets/
###
### Note that calling this function with invalid parameters will result in an
### empty data frame.
###
GetHistoricTradeData <- function (params) {

    #
    # http://api.bitcoincharts.com/v1/trades.csv?symbol=btceUSD
    #

    data <- getForm("http://api.bitcoincharts.com/v1/trades.csv", .params=params)

    tempCsvFile <- tempfile(pattern = "historicTradeData", tmpdir = tempdir(), fileext = ".csv")

    writtenResult <- write (data, file=tempCsvFile, append=FALSE)

    results <- read.csv (tempCsvFile, header = FALSE)

    unlink (tempCsvFile)

    colnames (results) <- c("unixtime", "price", "amount")

    return (results)
}
