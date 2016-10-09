# quiz 4

# question 1

u1 <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
d1 <- read.csv(u1)
nms <- names(d1)
split2 <- function(x) {
  return (strsplit(x, split="wgtp"))
              
}
nms_split <- sapply(nms, split2)
nms_split[123]

#question 2
u2 <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
d2 <- read.csv(u2, skip=4, nrows=190)
gdp <- as.numeric(gsub(",", "", d2$X.4))
mean(gdp)

# question 3

countryNames <- d2$X.3
grep("^United",countryNames)

# question 4

u3 <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
u4 <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

d3 <- read.csv(u3, skip=4, nrows=190)
d4 <- read.csv(u4)

d5 <- merge(x=d3, y=d4, by.x = "X", by.y = "CountryCode") 

length(grep("Fiscal year end: June 30", d5$Special.Notes))

# quention 5

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

# How many values were collected in 2012? 
dts <- amzn[,0]
sum(year(dts) == 2012)

# How many values were collected on Mondays in 2012?
library(lubridate)
sum(wday(dts, label=T) == "Mon" & year(dts) == 2012)


