
#load original
td = read.csv("titanic_original.csv")

#set any empty embarked values to S
td$embarked[td$embarked == ""] = "S"

#Calc mean of age, and set all NA values to that
td$age[is.na(td$age)] <- mean(td$age,na.rm = TRUE)

#Set all empty boar fields to NA
td$boat[td$boat == ""] = NA

#create new binary column if the row has cabin info
td$has_cabin_number <- sapply(td$cabin,function (x) {x != ""})

#write out updated data frame
write.csv(td, file = "titanic_clean.csv")