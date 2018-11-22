%% Function gives 2 ratios, which can be used as gain to signals
%  Input: angle of first source(degrees), 
%  angle of second source (degrees) 
%  angle is possitive in clockwise direction and 
%  0 is right in the center, 90 is all the way to the right
%  -90 would be all the way to the left
%  and a gap between microphones in meters

%  Output:
%  First ratio (r1) will give a gain by how much we should multiply source 1,
%  captured by Right microphone in relation to Left microphone
% 
%  Second ratio (r2) will give a gain by how much we should multiply source 2,
%  captured by Right microphone in relation to Left microphone
%
%  First delay will give delay at which source 1 , going to Right microphone
%  should be shifted in relation to Left microphone
% 
%  Second delay will give delay at which source 2 , going to Right microphone
%  should be shifted in relation to Left microphone

%  inspiration: 
%  http://www.sengpielaudio.com/calculator-gainloss.htm
%  http://www.sengpielaudio.com/calculator-distance.htm

function [r1, r2, d1, d2] = ratioNsamples(theta1,theta2,gap)
v=343.22;

thetaRad1 = deg2rad(theta1);
thetaRad2 = deg2rad(theta2);
%% Distances to left and right mics
[fdistL,fdistR] = dDifference(thetaRad1, gap); % First source distances
[sdistL,sdistR] = dDifference(thetaRad2, gap); % Second source distances
%% Ratio to multiply Right microphone
r1=fdistL/fdistR;
r2=sdistL/sdistR;
%% Delay in samples
d1 = round(((fdistL/v)-(fdistR/v))*48000);
d2 = round(((sdistL/v)-(sdistR/v))*48000);
end

