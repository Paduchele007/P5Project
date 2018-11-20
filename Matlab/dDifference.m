function [dist1, dist2] = dDifference(thetaRad,gap)
v=343.22; %speed of sound
d1=sin(thetaRad)+gap/2; %from y to 1'st mic
d2=sin(thetaRad)-gap/2; %from y to 2'nd mic
h=cos(thetaRad); 
dist1=sqrt(d1^2+h^2);
dist2=sqrt(d2^2+h^2);
end

