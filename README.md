# Sequential-Decision-Making-for-F1-Racing

## Authors: Pranay Mohanty and Pragadish Karthik Ravivenkatesh

## Introduction 
We have simulated the race of formula 1 car which is taking multiple laps to finish a race. We have a fixed number of laps which the car will traverse to finish the race. Our objective is to optimize the time of completion of the race based on below mentioned decisions, which we will make throughout the race with constant time between the decisions. We will have Pit Stops at beginning of every lap in which we will change our tire, should we decide to stop in the Pit Stop.
We will make two decisions which are namely, whether to stop or not in the Pit Stop (based on the
instantaneous tire quality going below a threshold) and which tire to replace our current tire with, which
will be based on the instantaneous temperature of the environment. Our temperature in the environment
will be a random distribution. Soft tire and Hard tire have their own performance levels based on the
current temperature and we will choose the best suited tire for that. Soft tire works well on lower
temperature and has a lower time/lap and vice versa for hard tire. The time/lap increases as the quality of
tire decreases and once we fit a new tire, the time/lap increases again and starts decreasing after.

## State Variables 
The state variables are: Temperature (𝑇𝑡), Tire Quality (𝐷𝑡), Type of tyre being used (𝐶𝑡).
𝑆𝑡 = (𝑇𝑡, 𝐷𝑡, 𝐶𝑡) :
𝑤ℎ𝑒𝑟𝑒 𝑇𝑡 ~ 𝑁(𝑎, 𝑏), 𝐷𝑡 ~ 𝑈(𝑐, 𝑑), 𝐶𝑡 = 𝑍𝑡−1

## Decision and Constraints 
Our decision will be (𝑋𝑡): Whether to pit for tyre change or not (𝑈𝑡), If we pit, the which tyre to
choose (𝑍𝑡).
            𝑋𝑡 = (𝑈𝑡, 𝑍𝑡)
𝑈𝑡 = {1 𝑖𝑓 𝑠𝑡𝑜𝑝 
     {0 𝑖𝑓 𝑦𝑜𝑢 𝑐𝑜𝑛𝑡𝑖𝑛𝑢𝑒
𝑍𝑡 = {1 𝑖𝑓 𝑠𝑜𝑓𝑡 𝑐𝑜𝑚𝑝𝑜𝑢𝑛𝑑 𝑡𝑦𝑟𝑒
     {0 𝑖𝑓 ℎ𝑎𝑟𝑑 𝑐𝑜𝑚𝑝𝑜𝑢𝑛𝑑 𝑡𝑦𝑟𝑒
Our constraints will be: We have to Pit at least once and have each of the two tires at least once in our
race.
        𝑋𝑡 𝟙{𝑈𝑡 = 1} ≥ 1 𝑋𝑡 𝟙{𝑍𝑡 = 1} ≥ 1 𝑋𝑡 𝟙{𝑍𝑡 = 0} ≥ 1
        
![alt-text](https://github.com/Pm1995/Sequential-Decision-Making-for-F1-Racing/blob/master/plot1.png)

        
## Exogenous Information 
𝑇𝑡+1 = 𝑇𝑡 + et+1 for temperature, 𝐷𝑡+1 = 𝐷𝑡+1 + et+1 for tire quality
For tire quality: et+1= U(c, d), For temperature: et+1=N(a, b)

## Transition Function 
𝑇𝑡+1 = 𝑇𝑡 + et+1, 𝐷𝑡+1 = 𝐷𝑡+1 + et+1, 𝐶𝑡=𝑍𝑡−1

## Contribution 
The total time taken in all the laps which will be modelled as an indicator of temperature. Soft tire has a time/lap of 1.38 minutes which increases as tire quality decreases and is good when temperature is less than 42 degree Celsius.
  𝐶𝑡(𝑆𝑡 , 𝑋𝑡)= (1.38+1.38/𝐷𝑡) 𝟙{𝑇𝑡 <42} + (1.58+1.58/𝐷𝑡) 𝟙{𝑇𝑡 >42}
  
## Objective Function 
𝑀𝑎𝑥 𝜋∈Π=𝐸[Σ( 𝑐𝑡,(𝑠𝑡,𝜋𝑡(𝑠𝑡)))𝑇𝑡=0]

## Methodology 
The methodology consists of three heuristic policies that we tested using several Matlab simulation functions. The first two polices were devised to determine when to Pit and which tire to change if we Pit and the third policy was devised to improve our time of completion. We ran 20 laps for 10000 runs in our simulation code.
A. Policy 1
This policy focusses on when we should Pit based on the quality of our tire. Our quality is modeled as a uniformly degrading function. At the start of every lap, we see the quality of our tire and if our tire’s quality has fallen below a certain constant threshold, we decide to Pit the car and replace the tire with a different tire of the same type or a different type. Once we replace our tire, the quality rejuvenates and starts decreasing again until the threshold is reached and we pit.

B. Policy 2:
This policy helps us determine which tire to choose, once we decide to pit. We decide to change to soft tire from hard/ soft tire if the temperature is lesser than 42 degree Celsius and change to hard tire from hard/soft tire if temperature is greater than 42 degree Celsius. Our policy is substantiated on the fact that soft tire is thinner and would work best when the temperature is low and hard tire is thicker and more susceptible to higher temperature ranges.

C. Policy 3:
Policy 3 is unique from policies 1 and 2 because it is used to optimize the time of completion of our race. The idea is that during the race, we make the decision of the choice of tire based on the temperature but in the last few laps, we just have to pull through without thinking about the cost of quality to the tire. So, we decide to switch to soft tire during the last five laps because soft tire has a lower time/lap as compared to the hard tire. With the soft tire in the last few laps, we noticed a completion time of 32.6 minutes as compared to our previous completion time of 33.62 minutes.

![alt-text](https://github.com/Pm1995/Sequential-Decision-Making-for-F1-Racing/blob/master/image.png)

## Conclusion and Recommendation ##
In conclusion, the policy 1 and 2 combined gave a completion time of 33.62 minutes whereas policy 3 in sync with policy 1 and 2 resulted in a completion time of 32.6 minutes. In our optimal policy, we start with a soft tire and continue with up to lap 4 and then switch to hard tire. In the final 5 laps, we switch back again to soft tire. The two graphs are shown with each having a run of 10000 iterations and clearly the policy 3 wins the game. Recommendation to the game is not be concerned about the damage to the quality of tire in the final number of laps if the benefit is to switch to a lighter tire and get a better completion time. The tire might be damaged more but the objective is to win the race.


