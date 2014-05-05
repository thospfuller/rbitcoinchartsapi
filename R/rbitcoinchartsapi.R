###
### install.packages("RCurl", dependencies = TRUE)
###
.onLoad <- function (libname, pkgname) {
    library("RCurl")
    library("RJSONIO")
}

.onUnload <- function (libpath) {
}

###
### weightedPrices <- GetWeightedPrices ()
###
GetWeightedPrices <- function () {
    data <- getURL("http://api.bitcoincharts.com/v1/weighted_prices.json")
    dataFrame <- RJSONIO::fromJSON(data)
    return (dataFrame)
}

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
    ###
    ### http://api.bitcoincharts.com/v1/trades.csv?symbol=btceUSD
    ###
    ### params <- list (symbol="btceUSD")
    ###
    ### WORKS: read.csv (url ("http://api.bitcoincharts.com/v1/trades.csv?symbol=btceUSD"))
    ###
    data <- getForm("http://api.bitcoincharts.com/v1/trades.csv", .params=params)

    tempCsvFile <- tempfile(pattern = "historicTradeData", tmpdir = tempdir(), fileext = ".csv")

    writtenResult <- write (data, file=tempCsvFile, append=FALSE)

    result <- read.csv (tempCsvFile)

    unlink (tempCsvFile)

    return (result)
}
