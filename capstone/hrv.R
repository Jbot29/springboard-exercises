require("ggplot2") 
require("dplyr") 
require(smooth)

#load hrv csv into a data frame
hrv_data = read.csv("/Users/jeremyschwartz/Dropbox/code/springboard/capstone/hrv.csv")

#convert date strings into date column
hrv_data$Date = as.Date(hrv_data$Date, format = "%m/%d/%y")

#bring result hrv into previous days row to make regression easier.
hrv_data$hrv_result = c(tail(hrv_data$HRV, -1),NA)
hrv_data$sleep_result = c(tail(hrv_data$Sleep.m., -1),NA)


summary(hrv_data$HRV)
#show lower variance 
sd(hrv_data$HRV)

first_week <- head(hrv_data, n=7)
summary(first_week$HRV)

ggplot(data=hrv_data, aes(x=Date, y=HRV,group=1)) +     geom_line()



ggplot(hrv_data, aes(x=Date, y=HRV)) +
      geom_point(shape=1) +  geom_smooth(method=lm) 


getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(hrv_data$HRV)
#mean,median


#moving average
sma(hrv_data$HRV)

#look into sleep
ggplot(hrv_data, aes(x=Sleep.m., y=HRV)) +
  geom_point(shape=1) 

hrv.sleep.mod <- lm(HRV ~ Sleep.m.,data=hrv_data) 
summary(hrv.sleep.mod)

#look at deep sleep
hrv_data_deep_sleep <- hrv_data[!is.na(hrv_data$Deepsleep),]

ggplot(hrv_data_deep_sleep, aes(x=Deepsleep, y=HRV)) +
  geom_point(shape=1) 

hrv.deepsleep.mod <- lm(HRV ~ Deepsleep,data=hrv_data_deep_sleep) 
summary(hrv.deepsleep.mod)



#pollen
hrv.pollen.mod <- lm(hrv_result ~ Pollen,data=hrv_data) 
summary(hrv.pollen.mod)

#caffeine
hrv.caffeine.mod <- lm(hrv_result ~ Caffeine,data=hrv_data) 
summary(hrv.caffeine.mod)

#Green Smoothie
hrv.smoothie.mod <- lm(hrv_result ~ Green.Smoothie,data=hrv_data)
summary(hrv.smoothie.mod)

#Night of drinking
hrv.drinking.mod <- lm(hrv_result ~ Drink,data=hrv_data)
summary(hrv.drinking.mod)

#muay thai
hrv.mt.mod <- lm(hrv_result ~ MT,data=hrv_data)
summary(hrv.mt.mod)


hrv.mod <- lm(hrv_result ~ Meditation,data=hrv_data)
summary(hrv.mod)

#Low Carb
hrv.lc.mod <- lm(hrv_result ~ Low.Carb,data=hrv_data)
summary(hrv.lc.mod)

#blackout
hrv.blackout.mod <- lm(hrv_result ~ Blackout,data=hrv_data)
summary(hrv.blackout.mod)

hrv.mod <- lm(hrv_result ~ Drink*Green.Smoothie+Low.Carb+Blackout+MT+Caffeine,data=hrv_data)
summary(hrv.mod)

hrv.mod <- lm(hrv_result ~ Drink*Green.Smoothie+Blackout+MT,data=hrv_data)
summary(hrv.mod)






drink <- subset(hrv_data, Drink == 1)

no_drink_random <- sample_n(subset(hrv_data, Drink == 0))

t.test(drink$hrv_result, no_drink_random$hrv_result) 

drink_no_smoothie <- subset(hrv_data, Drink == 1 & Green.Smoothie == 0)
drink_no_smoothie

drink_smoothie <- subset(hrv_data, Drink == 1 & Green.Smoothie == 1)
drink_smoothie

smoothie <- subset(hrv_data, Green.Smoothie == 1)
smoothie

no_smoothie_random <- sample_n(subset(hrv_data, Green.Smoothie == 0),nrow(smoothie))
no_smoothie_random

t.test(smoothie$hrv_result, no_smoothie_random$hrv_result) 


