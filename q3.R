# quiz 3

# question 1

u <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
d <- read.csv(u)

# ACR == 3: House on ten or more acres
# AGS == 6: $10000+ 

agricultureLogical <- d$ACR == 3 & d$AGS == 6
head(d[which(agricultureLogical),])

# question 2

install.packages("jpeg")
library(jpeg)

u2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(u2, 'jeff.jpg')
jeff <- readJPEG("jeff.jpg", native = TRUE)
quantile(jeff, c(0.3, 0.8))

# question 3
u3 <- url('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv')
u4 <- url('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv')

gdp <- read.csv(u3, skip = 4, nrows = 190)
edu <- read.csv(u4)
colnames(edu)


mrg <- merge(gdp, edu, by.x = "X", by.y = "CountryCode")
mrg_df <- mrg %>% tbl_df() 

mrg_df

mrg_df %>% arrange(desc(X.1)) %>%
  View()

# question 4
View(mrg_df)
mrg_df %>% group_by(Income.Group) %>% summarize(avg_gdp = mean(X.1))

gdp_grp <- group_by(mrg_df, Income.Group)

# question 5
