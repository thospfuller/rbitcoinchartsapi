[![LinkedIn](https://raw.githubusercontent.com/thospfuller/awesome-backlinks/master/images/linkedin_32.png)](https://www.linkedin.com/in/thomasfuller/) [![Twitter](https://raw.githubusercontent.com/thospfuller/awesome-backlinks/master/images/twitter_32.png)](https://twitter.com/ThosPFuller) [![GitHub](https://raw.githubusercontent.com/thospfuller/awesome-backlinks/master/images/github_32.png)](https://github.com/thospfuller) [![Email](https://raw.githubusercontent.com/thospfuller/awesome-backlinks/master/images/email_32.png)](http://eepurl.com/b5jPPj) [![Coherent Logic Limited](https://github.com/thospfuller/awesome-backlinks/blob/master/images/CLSocialIconDarkBlue.png?raw=true)](https://coherentlogic.com?utm_source=rbitcoinchartsapi_on_gh)  [<img src="https://github.com/thospfuller/awesome-backlinks/blob/master/images/meetupcom_social_media_circled_network_64x64.png" height="32" width="32">](https://www.meetup.com/Washington-DC-CTO-Meetup-Group/)

# rbitcoinchartsapi: An R Package for the Bitcoincharts.com API

## Example 1: Introduction to the GetHistoricTradeData function

This function will return the 2000 most recent trades which are delayed by approximately 15 minutes. The [symbols that are available can be found here](http://bitcoincharts.com/markets/).

Calling this function with invalid parameters will result in an empty data frame.

    library(rbitcoinchartsapi)
    params <- list (symbol="bitstampUSD")
    historicTradeData <- GetHistoricTradeData (params)
    with(historicTradeData, plot(unixtime, price))
    head(historicTradeData)

![The rbitcoinchartsapi GetHistoricTradeData function in action!](https://github.com/thospfuller/rbitcoinchartsapi/blob/master/images/rproject-rbitcoinchartsapi-package-gethistorictradedata-example.png?raw=true "The rbitcoinchartsapi GetHistoricTradeData function in action")