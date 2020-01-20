# Algo Trading from Reddit Wiki: https://www.reddit.com/r/algotrading/wiki/index
# Going in order of research tab
# Resource 1: "Big-Intro to quantstrat and trading systems"

# Goals: 
# ---
# Manage Data
  # Connect to Database
  # Download historical database
  # clean and align data
  # Graph prices and indicator

install.packages(c("quantmod","indexing","RTAQ","xts"))

# Evaluate Data
  # Calculate indicators
  # Transform prices
  # Estimate Volatility
  # Calculate trailing volume

install.packages(c("TTR", "signalextraction","urca"))

# Determine Trades
  # Estimate pre-trading pricing
  # Forecast return
  # Forecast risk
  # Evaluate rules
  # Generate signals

install.packages(c("quantstrat", "quantmod"))

# Size Trades
  # Optimize portfolio
  # Budget risk
  # Calculate target position
  # Calculate trade size
  # Evaluate trading costs

install.packages(c("LSPM", "PortfolioAnalytics","parma"))

# Calculate performance
  # Specify contract spects
  # Capture trades
  # Calculate positions
  # Calculate P&L
  # Aggregate portfolio

install.packages(c("plotter", "FinancialInstrument"))

# Analyze performance
  # Calculate returns and risk  
  # Compare benchmarks
  # Provide attribution 
  # Analyze risk

install.packages("PerformanceAnalytics")

# Quantstrat: used for indicators, signals, and rules
# Indicators: 
  # Quantitative value derived from market data
  # Applied in a vectorized or streaming fashion
  # Presumed to be able to be calculated in pathindependent fashion
  # No knowledge of current position or trades
  # Examples: moving averages, volatility bands, RSI, MACD, channels, any 'technical analysis indicators'
  # Designed and used for "real" quant strategies at all frequencies.

# Signals:
  # Describe interaction between market data and indicators
  # Describe the possible desire for an action, but may not be actionable
  # Applied in a vectorized or streaming fashion Used to inform rule decisions.
  # Examples: Crossovers, Thresholds, Multiples
  # Strategies may be constructed from all open source components.

# Rules:
  # Evaluated in a path-dependent fashion
  # Have available all market data prior to current observation
  # Are aware of current position at time of evaluation
  # Generate entry, exit, and risk management orders
  # May enter new orders or modify existing orders
  # Types: Entry, Exit, Risk, Rebalance, Chain
  # Prop strategies add custom indicators, signal functions, and order sizing logic.

### An easy, introductory trading strategy: Luxor Strategy.
### Common trading strategy using momentum as a signal to enter or exit a position.
### Read more here: http://rstudio-pubs-static.s3.amazonaws.com/283990_1d72c4f95c024ab19da6ef16ac0c4233.html

# For this example, looking at GBPUSD 30 min OHLC (open high low close), and 2 SMA (simple moving averages):
# SMA n=10 implies fast, n=30 implies slow.
# Here is our logic:
  # Long: stop-limit at high of SMA crossing bar.
  # Short: stop-limit at low of SMA crossing bar. 

library(quantmod)   # Quantitative financial strategies
library(dplyr)      # Data manipulation
library(lubridate)  # Date and time processing
library(knitr)      # Dynamic report generation

library("FinancialInstrument")
library("quantstrat")
require("FinancialInstrument")
currency(c("GBP", "USD"))
exchange_rate(primary_id='GBPUSD', tick_size=0.0001)

data.dir<-na.omit(getSymbols("GBPUSD=x",src='yahoo',auto.assign=FALSE))
.from <- '2002-10-21'
.to <- '2008-07-4'

getSymbols.FI(
  Symbols='GBPUSD',
  dir=system.file('extdata',package='quantstrat'),
  from=.from, to=.to
)