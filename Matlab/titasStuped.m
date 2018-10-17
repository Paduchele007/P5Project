clc;
clear;

v=343.22;   %speed of sound
dist = 1;
theta=90; 
samplT=1/48000;
delay=1;
gap=0.0152;
while (delay>samplT)
    thetaRad = degtorad(theta);
    s1=sqrt((dist*cos(thetaRad))^2+(dist*sin(thetaRad)+gap/2)^2);
    s2=sqrt((dist*cos(thetaRad))^2+(dist*sin(thetaRad)-gap/2)^2);
    
    t1=s1/v;
    t2=s2/v;
    
    delay=abs(t1-t2)
    theta
    theta=theta-1;
end
