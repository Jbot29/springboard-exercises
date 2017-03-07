library(tidyr)
library(stringdist)
library(hashmap)

#Hashmap to map product codes to short names
h <- hashmap(c("p","x","v","q"),c("Smartphone","TV", "Laptop" ,"Tablet"))

#Helper to correct incorrect spelling into standard spellings.
#Picks the closest spelling to correct, by using the stringdist lib.
getFixedName <- function(currentName) {
  fixedNames <- c('van houten','philips','akzo','unilever')

  df <- data.frame(fixedNames,sapply(fixedNames,function(x) {stringsim(x,as.character(currentName))}),stringsAsFactors = FALSE)
  df <- df[order(df[2],decreasing=T),]
  return(df[1,1])
  
}

#load data
mydata = read.csv("refine_original.csv")

#correct company names
mydata$company <- sapply(mydata$company,function (x) {getFixedName(x)})

#Split up product code-number into two new columns
mydata <- separate(mydata,Product.code...number,c('product_code','product_number'),sep='-')

#using the new product code, add new product category
mydata$product_cat <- unlist(lapply(mydata$product_code,function (x) {h[[x]]}))

#Create one address field
mydata <- unite(mydata,full_address,address,city,country,sep=',')

#create four new binary columns for matching companies
mydata$company_philips <- sapply(mydata$company,function (x) {as.integer(x == "philips")})
mydata$company_akzo <- sapply(mydata$company,function (x) {as.integer(x == "akzo")})
mydata$company_van_houten <- sapply(mydata$company,function (x) {as.integer(x == "van houten")})
mydata$company_unilever <- sapply(mydata$company,function (x) {as.integer(x == "unilever")})

#create four new binary columns product_smartphone, product_tv, product_laptop and product_tablet
mydata$product_smartphone <- sapply(mydata$product_code,function (x) {as.integer(x == "p")})
mydata$product_tv <- sapply(mydata$product_code,function (x) {as.integer(x == "x")})
mydata$product_laptop <- sapply(mydata$product_code,function (x) {as.integer(x == "v")})
mydata$product_tablet <- sapply(mydata$product_code,function (x) {as.integer(x == "q")})

#write cleanedup dataframe
write.csv(mydata, file = "refine_clean.csv")
