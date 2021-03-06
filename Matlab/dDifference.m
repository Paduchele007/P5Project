% Gives distance for the signal to travel to each microphones 
% 1st microphone is left 
% 2nd microphone is right
function [dist1, dist2] = dDifference(thetaRad,gap)
d1=sin(thetaRad)+gap/2; %from y to 1'st mic           |theta
d2=sin(thetaRad)-gap/2; %from y to 2'nd mic           |     o
h=cos(thetaRad);       %                              |    /|
dist1=sqrt(d1^2+h^2);  %                              |   / |
dist2=sqrt(d2^2+h^2);  %                              |  /  |
end                    %                              | /   |
                       %                           1  |/ 2  |
                       %                           o  x  o  y
                       %                           |<--->|
                       %                             gap
