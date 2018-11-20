%% Function gives 2 ratios, which can be used as gain to signals
%  Needed inputs: angle of first source(degrees), 
%  angle of second source (degrees) 
%  angle is possitive in clockwise direction and 
%  0 is right in the center, 90 is all the way to the right
%  and gap between microphones in meters
%
%  first ratio will give a gain by how much we should multiply source 1,
%  captured by second microphone in relation to first microphone
% 
%  second ratio will give a gain by how much we should multiply source 2,
%  captured by second microphone in relation to first microphone
% inspiration: http://www.sengpielaudio.com/calculator-gainloss.htm
% http://www.sengpielaudio.com/calculator-gainloss.htm
% http://www.sengpielaudio.com/calculator-distance.htm

function [r1, r2] =ratio(theta1,theta2,gap)
thetaRad1 = deg2rad(theta1);
thetaRad2 = deg2rad(theta2);

[fdist1,fdist2] = dDifference(thetaRad1, gap)
[sdist1,sdist2] = dDifference(thetaRad2, gap)
 
r1=fdist1/fdist2;
r2=sdist1/sdist2;

end

