function[pitt_time,time_taken,tyre_change,pit_or,D,C,T]=policy12(D,C,T)
threshold=80;
if D<=threshold 
    pit_or=1;
    if T<42
        tyre_change=1; %CHANGE TO SOFT
        D=117;
        C=1;
        time_taken=1.38;
        pitt_time=0.12;
        
    else
        tyre_change=0; %change to hard
        C=0;
        D=122;
        time_taken=1.56;
        pitt_time=0.12;
    end
else
    pit_or=0;%we dont pit
    tyre_change=C;
    
    if C==1
       time_taken=1.38;
       pitt_time=0;
    else
       time_taken=1.56;
       pitt_time=0;
        
    end

end
end
