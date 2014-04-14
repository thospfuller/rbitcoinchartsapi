###
### install.packages("RCurl", dependencies = TRUE)
###
.onLoad <- function (libname, pkgname) {
    library("RCurl")
    library("RJSONIO")
}

.onUnload <- function (libpath) {
}

GetWeightedPrices <- function () {
    data <- getURL("http://api.bitcoincharts.com/v1/weighted_prices.json")
    dataFrame <- RJSONIO::fromJSON(data)
    return (dataFrame)
}

###
### jpy <- getForm("http://api.bitcoincharts.com/v1/markets.json", .params=list(currency="USD"))
###
GetMarketData <- function (params) {
    data <- getForm("http://api.bitcoincharts.com/v1/markets.json", .params=params)
    dataFrame <- RJSONIO::fromJSON(data)
    return (dataFrame)
}

GetHistoricTradeData <- function () {
    stop ("This function has not been implemented.")
}