library ("rbitcoinchartsapi")
weightedPrices <- GetWeightedPrices ()
params <- list (currency="USD")
usd <- GetMarketData (params)
weightedPrices$ILS
usd[[1]]$latest_trade