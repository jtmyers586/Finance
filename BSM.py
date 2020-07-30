# -*- coding: utf-8 -*-
"""
@name: Johnathan Myers
@date: Thu Apr  9 08:53:00 2020
@class: CS170-Q
"""
        

import scipy.stats as sp
import numpy as np
import matplotlib.pyplot as plt
import math



# Let us define the Black Scholes model
class BsmModel:
    def __init__(self, option_type, price, strike, interest_rate, expiry, volatility, dividend_yield):
        self.s = price # Underlying asset price
        self.k = strike # Option strike K
        self.r = interest_rate # Continuous risk fee rate
        self.q = dividend_yield # Dividend continuous rate
        self.T = expiry # time to expiry (year)
        self.sigma = volatility # Underlying volatility
        self.type = option_type # option type "p" put option "c" call option
        
    def n(self, d):
        # cumulative probability distribution function of standard normal distribution
        return sp.norm.cdf(d)
    def dn(self, d):
        # the first order derivative of n(d)
        return sp.norm.pdf(d)
    def d1(self):
        d1 = (math.log(self.s / self.k) + (self.r - self.q + self.sigma ** 2 * 0.5) * self.T) / (self.sigma * math.sqrt(self.T))
        return d1
    def d2(self):
        d2 = (math.log(self.s / self.k) + (self.r - self.q - self.sigma ** 2 * 0.5) * self.T) / (self.sigma * math.sqrt(self.T))
        return d2
    def bsm_price(self):
        d1 = self.d1()
        d2 = d1 - self.sigma * math.sqrt(self.T)
        if self.type == 'c':
          price = math.exp(-self.r*self.T) * (self.s * math.exp((self.r - self.q)*self.T) * self.n(d1) - self.k * self.n(d2))
          return price
        elif self.type == 'p':
          price = math.exp(-self.r*self.T) * (self.k * self.n(-d2) - (self.s * math.exp((self.r - self.q)*self.T) * self.n(-d1)))
          return price
        else:
          print("option type can only be c or p")

mu = 0
variance = 1
x = np.linspace(mu-3*variance,mu+3*variance, 100)
y = [sp.norm.pdf(i) for i in x]
plt.plot(x,y)
d = [-1]
plt.plot(d*100,np.linspace(0,sp.norm.pdf(d), 100))

def PricingModel():
  opt = str(input("Pick a call or put option: "))
  price = float(input("Pick a stock price: "))
  strike = float(input("Pick a strike price: "))
  intr = float(input("Pick an interest rate: "))
  expir = float(input("Pick an time to expiry (in years): "))
  vola = float(input("Pick a volatility: "))
  div_y = float(input("Pick a dividend yield: "))
  if opt = "c":
    z = "call"
  else:
    z = "put"
  a = BsmModel(opt, price, strike, intr, expir, vola, div_y)
  print("The value of the " + str(z) + " option is: ")
  print(a.bsm_price())
  
PricingModel()