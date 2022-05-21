[![LinkedIn](https://raw.githubusercontent.com/thospfuller/awesome-backlinks/master/images/linkedin_32.png)](https://www.linkedin.com/in/thomasfuller/) [![Twitter](https://raw.githubusercontent.com/thospfuller/awesome-backlinks/master/images/twitter_32.png)](https://twitter.com/ThosPFuller) [![GitHub](https://raw.githubusercontent.com/thospfuller/awesome-backlinks/master/images/github_32.png)](https://github.com/thospfuller) [![Email](https://raw.githubusercontent.com/thospfuller/awesome-backlinks/master/images/email_32.png)](http://eepurl.com/b5jPPj) [![Coherent Logic Limited](https://github.com/thospfuller/awesome-backlinks/blob/master/images/CLSocialIconDarkBlue.png?raw=true)](https://coherentlogic.com?utm_source=rbitcoinchartsapi_on_gh)  [<img src="https://github.com/thospfuller/awesome-backlinks/blob/master/images/meetupcom_social_media_circled_network_64x64.png" height="32" width="32">](https://www.meetup.com/Washington-DC-CTO-Meetup-Group/)

# rbitcoinchartsapi: An R Package for the Bitcoincharts.com API

## Example 1: Introduction to the GetHistoricTradeData function

The GetHistoricTradeData function will return the 2000 most recent trades which are delayed by approximately 15 minutes.

The [symbols that are available can be found here](http://bitcoincharts.com/markets/).

Calling this function with invalid parameters will result in an empty data frame.

    library(rbitcoinchartsapi)
    params <- list (symbol="bitstampUSD")
    historicTradeData <- GetHistoricTradeData (params)
    with(historicTradeData, plot(unixtime, price))
    head(historicTradeData)

![The rbitcoinchartsapi GetHistoricTradeData function in action!](https://github.com/thospfuller/rbitcoinchartsapi/blob/master/images/rproject-rbitcoinchartsapi-package-gethistorictradedata-example.png?raw=true "The rbitcoinchartsapi GetHistoricTradeData function in action")

## Example 2: Introduction to the GetWeightedPrices function

The GetWeightedPrices function returns the weighted prices. 

[Bitcoincharts.com](http://www.bitcoincharts.com) offers weighted prices for several currencies that can be used, for example, to price goods and services in Bitcoins -- this will yield much lower fluctuations than using a single market's latest price.

Weighted prices are calculated for the last 24 hours, 7 days and 30 days; if there are no trades during an interval, such as no trade within 24 hours, then no value will be returned.

    weightedPrices <- GetWeightedPrices ()
    head(weightedPrices)

![The rbitcoinchartsapi GetWeightedPrices function in action!](https://github.com/thospfuller/rbitcoinchartsapi/blob/master/images/rproject-rbitcoinchartsapi-package-getweightedprices-example.png?raw=true "The rbitcoinchartsapi GetWeightedPrices function in action")

## Example 3: Introduction to the GetMarketData function

The GetMarketData function will return an array with elements for each market.

The [symbols that are available can be found here](http://bitcoincharts.com/markets/).

    params <- list (currency="USD")
    usd <- GetMarketData (params)
    head(usd)

![The rbitcoinchartsapi GetMarketData function in action!](https://github.com/thospfuller/rbitcoinchartsapi/blob/master/images/rproject-rbitcoinchartsapi-package-getmarketdata-example.png?raw=true "The rbitcoinchartsapi GetMarketData function in action")