#' 
#' @title R Bitcoin Charts API Package
#' 
#' @details This package provides functions for acquiring data directly from \href{http://www.bitcoincharts.com}{Bitcoincharts}. 
#'
#' @description This package provides functions for acquiring data directly from \href{http://www.bitcoincharts.com}{Bitcoincharts}.
#'
#' @import RJSONIO RCurl logging
#' @importFrom("utils", "read.csv")
#'
#' @name rbitcoinchartsapi
#'
#' @docType package
#'
NULL

#' This function returns the weighted prices. 
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
#'  tryCatch(
#'      weightedPrices <- GetWeightedPrices (),
#'      error =
#'          function (e) {    
#'              print (
#'                  paste (
#'                      "An exception was thrown -- details follow: ",
#'                      e,
#'                      sep=""
#'                  )
#'              )
#'          }
#'      )
#'
#' @export
#'
GetWeightedPrices <- function () {
  
    logging::logdebug("GetWeightedPrices: function begins.")
  
    data <- getURL("http://api.bitcoincharts.com/v1/weighted_prices.json")
    dataFrame <- RJSONIO::fromJSON(data)
    
    logging::logdebug("GetWeightedPrices: function ends.")
    
    return (dataFrame)
}

#' This function will return an array with elements for each market.
#'
#' General market data can be accessed \href{http://api.bitcoincharts.com/v1/markets.json}{here}.
#'
#' @param params Any parameter accepted by this web service call -- see \href{http://bitcoincharts.com/about/markets-api/}{here}
#'
#' @examples
#'  params <- list (currency="USD")
#'  tryCatch(
#'      usd <- GetMarketData (params),
#'      error =
#'          function (e) {    
#'              print (
#'                  paste (
#'                      "An exception was thrown -- details follow: ",
#'                      e,
#'                      sep=""
#'                  )
#'              )
#'          }
#'      )
#'
#' @export
#'
GetMarketData <- function (params) {
  
    logging::logdebug("GetMarketData: function begins.")
  
    data <- getForm("http://api.bitcoincharts.com/v1/markets.json", .params=params)
    dataFrame <- RJSONIO::fromJSON(data)
    
    logging::logdebug("GetMarketData: function ends.")
    
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
#'  params <- list (symbol="bitstampUSD")
#'  tryCatch(
#'      historicTradeData <- GetHistoricTradeData (params),
#'      error =
#'          function (e) {    
#'              print (
#'                  paste (
#'                      "An exception was thrown -- details follow: ",
#'                      e,
#'                      sep=""
#'                  )
#'              )
#'          }
#'      )
#'
#' @export
#'
GetHistoricTradeData <- function (params) {

    logging::logdebug("GetHistoricTradeData: function begins.")
  
    #
    # http://api.bitcoincharts.com/v1/trades.csv?symbol=bitstampUSD
    #
    # params <- list (symbol="krakenEUR", start=1303100000)
    # historicTradeData <- GetHistoricTradeData (params)
    #

    data <- getForm("http://api.bitcoincharts.com/v1/trades.csv", .params=params)

    tempCsvFile <- tempfile(pattern = "historicTradeData", tmpdir = tempdir(), fileext = ".csv")

    writtenResult <- write (data, file=tempCsvFile, append=FALSE)

    results <- utils::read.csv (tempCsvFile, header = FALSE)

    unlink (tempCsvFile)

    colnames (results) <- c("unixtime", "price", "amount")

    logging::logdebug("GetHistoricTradeData: function ends")
    
    return (results)
}
