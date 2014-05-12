library ("rbitcoinchartsapi")
weightedPrices <- GetWeightedPrices ()
marketDataParams <- list (currency="USD")
usd <- GetMarketData (marketDataParams)
weightedPrices$ILS
usd[[1]]$latest_trade
historicDataParams <- list (symbol="btceUSD")
historicData <- GetHistoricTradeData (historicDataParams)