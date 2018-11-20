clc;
clear;
v=343.22 %speed of sound
gap =0.6; % distance between mics
t=1/48000; %1/sampling freq 
delay=1; %just so while works
theta=80; %starts at 90deg, for biggest delay and gets smaller
%while (t<delay) 
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
   o  x  o  y
   |<--->|
     gap

%}

d1=sin(thetaRad)+gap/2; %from y to 1'st mic
d2=sin(thetaRad)-gap/2; %from y to 2'nd mic
h=cos(thetaRad);        %from o to y
delay=abs((sqrt(d1^2+h^2)/v)-(sqrt(d2^2+h^2)/v))
% t1=(sqrt((sin(thetaRad)+gap/2)^2+(cos(thetaRad))^2))/v; %o1 to o
% t2=(sqrt((sin(thetaRad)-gap/2)^2+(cos(thetaRad))^2))/v; %o2 to o
% 
% delay=abs(t1-t2)
theta
% theta=theta-1;
% end