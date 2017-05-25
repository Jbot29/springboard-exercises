require("ggplot2") 
require("dplyr") 
require(smooth)

#load hrv csv into a data frame
hrv_data = read.csv("/Users/jeremyschwartz/Dropbox/code/springboard/capstone/hrv.csv")

#convert date strings into date column
hrv_data$Date = as.Date(hrv_data$Date, format = "%m/%d/%y")

#bring result hrv into previous days row to make regression easier.
hrv_data$hrv_result = c(tail(hrv_data$HRV, -1),NA)

#see summary statistics
summary(hrv_data$HRV)
sd(hrv_data$HRV)

#Graphs for improvement over time
#moving average
sma(hrv_data$HRV)

#Plot of hrv and date
ggplot(data=hrv_data, aes(x=Date, y=HRV,group=1)) +     geom_line()

#plot of hrv and date with lm 
ggplot(hrv_data, aes(x=Date, y=HRV)) +
      geom_point(shape=1) +  geom_smooth(method=lm) 

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
ggplot(hrv_data, aes(x=Pollen, y=HRV)) +
  geom_point(shape=1) 

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

#blackout
hrv.blackout.mod <- lm(hrv_result ~ Blackout,data=hrv_data)
summary(hrv.blackout.mod)

#Final model
hrv.mod <- lm(hrv_result ~ Drink*Green.Smoothie+Blackout+MT,data=hrv_data)
summary(hrv.mod)

#t-test for drinking against random non-drinking
drink <- subset(hrv_data, Drink == 1)
no_drink_random <- sample_n(subset(hrv_data, Drink == 0),nrow(drink))
t.test(drink$hrv_result, no_drink_random$hrv_result) 

#test difference in number of sleep minutes between blackout and non blackout days.
blackout_days <- subset(hrv_data, Blackout == 1)
non_blackout_days <- sample_n(subset(hrv_data, Blackout == 0),nrow(blackout_days))
t.test(non_blackout_days$Sleep.m., blackout_days$Sleep.m.) 
