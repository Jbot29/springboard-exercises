# Springboard Capstone

## The Problem: Understand what affects my personal health and try to improve it.

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


## Hrv Moving Average

![Moving Average](https://github.com/Jbot29/springboard-exercises/blob/master/capstone/hrv_moving_average.png)


## HRV and date with linear model

![Plot with lm](https://github.com/Jbot29/springboard-exercises/blob/master/capstone/hrv_data_lm.png)