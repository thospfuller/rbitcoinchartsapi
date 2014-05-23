#' @import RJSONIO RCurl
#'
NULL

#' Function returns the weighted prices. 
#'
#' \href{http://www.bitcoincharts.com}{Bitcoincharts} offers weighted prices
#' for several currencies that can be used, for example, to price goods and
#' services in Bitcoins -- this will yield much lower fluctuations than using
#' a single market's latest price.
#'
#' @return Weighted prices are calculated for the last 24 hours, 7 days and 30
#'  days; if there are no trades during an interval, such as no trade within 24
#'  hours, then no value will be returned.
#'
#' @examples
#'  weightedPrices <- GetWeightedPrices ()
#'
#' @export
#'
GetWeightedPrices <- function () {
    data <- getURL("http://api.bitcoincharts.com/v1/weighted_prices.json")
    dataFrame <- RJSONIO::fromJSON(data)
    return (dataFrame)
}

#' General market data can be accessed \href{http://api.bitcoincharts.com/v1/markets.json}{here}.
#' This function will return an array with elements for each market.
#'
#' @param params Any parameter accepted by this web service call -- see \href{http://bitcoincharts.com/about/markets-api/}{here}
#'
#' @examples
#'  params <- list (currency="USD")
#'  usd <- GetMarketData (params)
#'
#' @export
#'
GetMarketData <- function (params) {
    data <- getForm("http://api.bitcoincharts.com/v1/markets.json", .params=params)
    dataFrame <- RJSONIO::fromJSON(data)
    return (dataFrame)
}

#' This function will return the 2000 most recent trades which are delayed by
#' approximately 15 minutes. 
#'
#' The symbols that are available can be found \href{http://bitcoincharts.com/markets/}{here}.
#'
#' Note that calling this function with invalid parameters will result in an
#' empty data frame.
#'
#' @param params Any parameter accepted by this web service call -- see
#' \href{http://bitcoincharts.com/about/markets-api/}{here}.
#'
#' @examples
#'  params <- list (symbol="btceUSD")
#'  historicData <- GetHistoricTradeData (params)
#'
#' @export
#'
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
