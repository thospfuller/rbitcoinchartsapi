\name{GetHistoricTradeData}
\alias{GetHistoricTradeData}
\title{GetHistoricTradeData}
\description{
    Trade data is available as CSV, delayed by approx. 15 minutes. It will
    return the 2000 most recent trades.
}
\arguments{
    See http://bitcoincharts.com/about/markets-api/ for a list of available
    parameters.
}
\usage{
    historicTradeDataParams <- list (symbol="btceUSD")
    historicTradeData <- GetHistoricTradeData (historicTradeDataParams)
}