# tidyquant-- good for getting constituent data.
install.packages("xts")
install.packages("PerformanceAnalytics")
install.packages("quantmod")
install.packages("TTR")
install.packages("FinancialInstrument", repos = "http://R-Forge.R-project.org")
install.packages("blotter", repos = "http://R-Forge.R-project.org")
install.packages("quantstrat", repos = "http://R-Forge.R-project.org")


library(TTR)
library(devtools)
library(PerformanceAnalytics)
library(FinancialInstrument)
library(blotter)
require(quantstrat)
library(quantmod)
require(devtools)
require(DStrading)
require(IKTrading)
require(quantmod)
library(tidyquant)
library(dplyr)
library(fs)
library(plotly)
library(finreportr)


#Quantmod -- good for plotting charts.
## 

getSymbols("AAPL",src="yahoo")
barChart(AAPL)
candleChart(AAPL,multi.col=TRUE,theme="white")

getSymbols("XPT/USD",src="oanda") #xpt is platinum
##  OANDA 
chartSeries(XPTUSD,type = c("auto", "candlesticks", "matchsticks", "bars","line"),name="Platinum (.oz) in $USD")
