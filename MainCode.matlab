  %n_sims is the number of iterations
time=zeros(1,1);
el=zeros(20,1);
pit_or_not=zeros(20,1);
tyre_to_change=zeros(20,1);
tyre_type=zeros(20,1);
deg=zeros(20,1);
temp=zeros(20,1);
laps=20;
lr=zeros(20,1);

for n=1:10000 %n_sims=10,000
    D=117; %initial quality of tyre
    C=1;  %initially start with soft tyre
    T=40; %initially temperature is 50
    total_time=0;   %initially lap starts with 0s
    S_t=0;
    
    for t=1:20 %for 10 laps
        [pitt_time,time_taken,tyre_change,pit_or,D,C] =policy3(D,C,T,deg,t,lr);%calling the policy 
         lr(t)=laps-t+1; %laps remaining
         deg(t)=D; %tyre quality at lap t
         D=D-unifrnd(10,20);
         tyre_to_change(t)=tyre_change;
         pit_or_not(t)=pit_or; %pittstop decision for lat t
         tyre_type(t)=C; %type of tyre at lap t
         temp(t)= T; %temperature at lap t
         T=T+normrnd(1,1); %transition of temperature
        el(t)=time_taken; %time take to complet lap t
        total_time=total_time + time_taken; %time taken till lap t
        S_t=S_t+pitt_time; %time take at the pitstops
    end
    time(n)=total_time+S_t; %time taken to finish race
end
mtime=mean(el)
tyre_to_change
pit_or_not
D
tyre_type


%Plots for the Model
% Pit or Continue
plot(1:20,pit_or_not,'-mo');
pause(0.05);
xlabel('Lap');
ylabel('pit or not');

%Type of tyre at every lap 
plot(1:20,tyre_type,'-mo');
pause(0.05);
xlabel('Lap');
ylabel('Type of Tyre');

%Temperature at every lap 
plot(1:20,temp,'-mo');
pause(0.05);
xlabel('Lap');
ylabel('Track Temperature');

%Quality at every lap
plot(1:20,deg,'-mo');
pause(0.05);
xlabel('Lap');
ylabel('Quality');
