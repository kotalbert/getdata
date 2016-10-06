# quiz 2

# question 4

htm <- 'http://biostat.jhsph.edu/~jleek/contact.html' 
htm.lines <- readLines(htm)
nchar(htm.lines[c(10,20,30,100)])

# question 5
u <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(u, "dat.for")
head(readLines("dat.for"))

# szerokości danych do wczytania z pliku fwf
w <- c(12, 7, 4, 9, 4, 9, 4, 9, 4)

# wczytanie pliku w formacie fwf
d <- read.fwf("dat.for", skip=4, widths=w)

out <- sum(d$V4+d$V9)
print(out)
