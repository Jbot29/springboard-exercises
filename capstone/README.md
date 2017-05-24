# Springboard Capstone

## The Problem: Understand the factors that affect my personal health in order to improve it.

After a long time of traveling, poor diet, and little exercise, I was not the picture of health. Not only did I want to improve my health but understand the factors in doing so. The more we learn about health and human biology, it seems the factors that affect people are somewhat unique. 

The challenge is finding objective measurements beyond just personal feel.

Enter Heart Rate Variability (HRV).

## HRV

Heart Rate Variability measures the variation of time between heart beats. HRV allows us insight into the Autonomic Nervous System which contains two parts. In general, the Sympathetic Nervous System tells the heart to speed up, and Parasympathetic Nervous System tells the heart to slow and rest.

So somewhat counterintuitively, the more variation, the better. That means the heart can relax, be more efficient as the Parasympathetic Nervous System is engaged. When the intervals between heart beats are similar, that can mean your body is under some stressor, and Sympathetic Nervous System is activated. 

[Source Elite-HRV](https://elitehrv.com/what-is-heart-rate-variability)

Many athletes take an HRV reading every morning to see how hard they should or shouldn't train for the day. A low HRV means to lower the intensity of training or just rest. A higher HRV means you can train harder.

There have also been studies done showing relationships in particular groups linking low HRV and all-cause mortality. 

[Source](https://www.ncbi.nlm.nih.gov/pubmed/20844904)
[Source](http://www.tandfonline.com/doi/pdf/10.1080/22201181.2016.1202605)

## Method

So for over 50 days, I recorded not only my morning HRV but a bunch of other factors to find out what if anything moves the needle on my HRV. The basic principle was not to add in too many new factors at once.

## Equipment

For HRV:

Polar H7 Bluetooth heart rate sensor.

Elite-HRV App.

For sleep:

Fitbit Charge2

## Plot of HRV.


![HRV](https://github.com/Jbot29/springboard-exercises/blob/master/capstone/hrv_date.png)

So what are we looking for in HRV? Elite-HRV takes a few days to generate a baseline and then can give recommendations on training activity. It adjusts as you go. 

So for me, anything below 55 means training is off for the day. Anything above is a green light. You can go too high, but that is rare and only happened once during the recording. 

So the goal was to improve on average my daily HRV scores and to see if I can raise it. 

The moving average shows a slight uptick in the average.

![Moving Average](https://github.com/Jbot29/springboard-exercises/blob/master/capstone/hrv_moving_average.png)


Graphing HRV to days and fitting a line to it also shows an upward trend.

![Plot with lm](https://github.com/Jbot29/springboard-exercises/blob/master/capstone/hrv_data_lm.png)


Both the median and the mean were above 55 and 60.00 and 59.33 respectively by the end. Not as drastic as I would have liked but an improvement. 

Also, my mean is close to what Elite-HRV has observed for my age range out of 8,873 males.

https://elitehrv.com/normal-heart-rate-variability-age-gender

So goal one was accomplished, now to look into what factors play a role in my daily HRV score.


## Sleep

Using the Fitbit, I recorded the number of minutes slept every night.

![sleep](https://github.com/Jbot29/springboard-exercises/blob/master/capstone/hrv_sleep.png)

There is a cluster, where above the 400 minute that seems to correlate with a good HRV. Although, it doesn't appear to be a linear predictor of HRV as there is a wide range of outcomes for the same amount of sleep.

Now there is more to sleep than just time; there is also sleep quality.
The latest version of the Fitbit app now has a breakdown of the different sleep phases, but this update came late in my recording so didn't have the breakdowns for the entire time.  I looked at the amount of deep sleep compared to HRV after the update, but it suffers from the same problem that just minutes have. 

Sleep is important, but as of yet, I do not know if there is a good linear predictor.

