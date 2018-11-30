%% Function gives ratio and delay, which can be used to realisticaly delay and add realistic gain to the signals
%  Input: angle of the source(degrees), 
%  angle is possitive in clockwise direction and 
%  0 is right in the center, 90 is all the way to the right
%  -90 would be all the way to the left
%
%  and a gap between microphones in meters
%
%
%  Output:
%  Ratio (r) will give a gain by how much we should multiply source,
%  captured by Right microphone in relation to Left microphone
%  
%  Delay will give delay at which source, going to the Right microphone
%  should be shifted in relation to Left microphone
% 
%
%
%  inspiration: 
%  http://www.sengpielaudio.com/calculator-gainloss.htm
%  http://www.sengpielaudio.com/calculator-distance.htm

function [r, d] = ratioNsamples(theta,gap)
v=343.22;
thetaRad = deg2rad(theta);
%% Distances to left and right mics
[distL,distR] = dDifference(thetaRad, gap); % First source distances
%% Ratio to multiply Right microphone
r=distL/distR;
%% Delay in samples
d = round(((distL/v)-(distR/v))*48000);
end

