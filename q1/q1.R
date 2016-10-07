# First quiz for the course

# question 1

# download the file
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'  
download.file(fileUrl, destfile='./file.csv')

# import file to object
my.data  <- read.csv('file.csv')

library('dplyr')

# summarize data

md2  <- tbl_df(my.data) 
head(md2)
colnames(md2)
nrow(filter(select(md2, VAL), VAL == 24))

# question 2

table(select(md2, FES))

# question 3
fileUrl <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
download.file(fileUrl, destfile='NGAP2.xlsx')

library(xlsx)
ri <- 18:23
ci <- 7:15
dat <- read.xlsx('NGAP.xlsx', sheetIndex=1, colIndex = ci, rowIndex = ri)

sum(dat$Zip*dat$Ext,na.rm=T)

# question 4
fileUrl <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'

library(XML)

doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE)
root.node <- xmlRoot(doc)
zips <- xpathSApply(root.node, '//row/zipcode',xmlValue)
length(zips[zips == '21231'])


# question 5


