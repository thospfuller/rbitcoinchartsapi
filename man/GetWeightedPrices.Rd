\name{GetWeightedPrices}
\alias{GetWeightedPrices}
\title{GetWeightedPrices}
\description{
    Bitcoincharts offers weighted prices for several currencies at http://api.bitcoincharts.com/v1/weighted_prices.json. You can use this to price goods and services in Bitcoins. This will yield much lower fluctuations than using a single market's latest price. Weighted prices are calculated for the last 24 hours, 7 days and 30 days. If there are no trades during an interval (like no trade within 24 hours) no value will be returned.
}
\arguments{
    None
}
\value{
    A data frame containing the weighted prices.
}
\examples{
    library ("rbitcoinchartsapi")
    weightedPrices <- GetWeightedPrices ()
}