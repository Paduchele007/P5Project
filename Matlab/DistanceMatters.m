clear;
clc;
theta = deg2rad(30);
distance = 0.25;
gap = 0.15;

AR=(sin(theta)*distance)-(gap/2);
AL=(sin(theta)*distance)+(gap/2);
h=cos(theta)*distance;

SR = sqrt(AR^2+h^2);
SL = sqrt(AL^2+h^2);


delay=SL-SR;
timeDelay=delay/350;
sampleDelay=timeDelay*48000