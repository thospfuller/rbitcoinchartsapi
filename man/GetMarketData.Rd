\name{GetMarketData}
\alias{GetMarketData}
\title{GetMarketData}
\description{
    You can access general market data at http://api.bitcoincharts.com/v1/markets.json. This will return an array with elements for each market.
}
\arguments{
    params See http://bitcoincharts.com/about/markets-api/ for a list of available parameters.
}
\usage{
    params <- list (currency="USD")
    usd <- GetMarketData (params)
    usd[[1]]$latest_trade
}