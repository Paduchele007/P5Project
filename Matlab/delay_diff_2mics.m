clc;
clear;
v=343.22 %speed of sound
gap =0.0152; %between mics
dist=1; %whatever
t=1/48000; %1/sampling freq 
delay=1; %just so while works
theta=90; %starts at 90deg, for biggest delay and gets smaller
while (t<delay) 
%dist = input('Enter distance from microphones to source: ');
%theta = input('Enter angle of source: ');
thetaRad = degtorad(theta);
%{

      |theta
      |     o
      |    /|
      |   / |
      |  /  |
      | /   |
   1  |/ 2  |
   o  x  o  |
   |<--->|
     gap

%}


s1=sqrt((dist*sin(thetaRad)+gap/2)^2+(dist*cos(thetaRad))^2); %o1 to o
s2=sqrt((dist*sin(thetaRad)-gap/2)^2+(dist*cos(thetaRad))^2); %o2 to o


t1=s1/v;
t2=s2/v;
delay=abs(t1-t2)
theta
theta=theta-1;
end