# Sequential-Decision-Making-for-F1-Racing

## Introduction 
We have simulated the race of formula 1 car which is taking multiple laps to finish a race. We have a fixed number of laps which the car will traverse to finish the race. Our objective is to optimize the time of completion of the race based on below mentioned decisions, which we will make throughout the race with constant time between the decisions. We will have Pit Stops at beginning of every lap in which we will change our tire, should we decide to stop in the Pit Stop.
We will make two decisions which are namely, whether to stop or not in the Pit Stop (based on the
instantaneous tire quality going below a threshold) and which tire to replace our current tire with, which
will be based on the instantaneous temperature of the environment. Our temperature in the environment
will be a random distribution. Soft tire and Hard tire have their own performance levels based on the
current temperature and we will choose the best suited tire for that. Soft tire works well on lower
temperature and has a lower time/lap and vice versa for hard tire. The time/lap increases as the quality of
tire decreases and once we fit a new tire, the time/lap increases again and starts decreasing after.
