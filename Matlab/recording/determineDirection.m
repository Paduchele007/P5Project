%% CLEANUP

close all;
clc;
clear;

%% IMPORT SIGNALS

signal1 = ['D:\GitHub\P5Project\Adobe Audition\19NovAfterTheMeeting\19NovAfterTheMeeting_Recorded\Left_Both_80_deg.wav'];
[a,Freq1] = audioread(signal1);
w = (1:length(a)) / Freq1;

signal2 = ['D:\GitHub\P5Project\Adobe Audition\19NovAfterTheMeeting\19NovAfterTheMeeting_Recorded\Right_Both_80_deg.wav'];
[b,Freq2] = audioread(signal2);
x = (1:length(b)) / Freq2;

%% SPLIT SIGNALS
% a1 = a(1:500000);
% a2 = a(750000:1100000);
% a3 = a(1400000:1800000);
% a4 = a(2000000:2400000);
% a5 = a(2600000:2900000);
% 
% b1 = b(1:500000);
% b2 = b(750000:1100000);
% b3 = b(1400000:1800000);
% b4 = b(2000000:2400000);
% b5 = b(2600000:2900000);


%% GET MAXIMUM VALUES
maximumA = max(a);
j = 1;
for i = 1:length(a)
    if maximumA == a(i)
        maxVectorA(j) = i;
        j = j + 1;
    end
end

maximumB = max(b);
k = 1;
for i = 1:length(b)
    if maximumB == b(i)
        maxVectorB(k) = i;
        k = k + 1;
    end
end

%% GET SAMPLE DELAY
r = 1;
if j > k
    for p = 1:length(maxVectorB)
        delay(r) = maxVectorB(p) - maxVectorA(p);
        r = r + 1;
    end
else
    for p = 1:length(maxVectorA)
        delay(r) = maxVectorA(p) - maxVectorB(p);
        r = r + 1;
    end
end

%% SHIFT ALL SIGNALS

shiftedB = zeros(size(b));
 if delay(1) >0
   shiftedB(delay(1)+1:end) = b(1:end-delay(1));
 elseif delay(1) <0
   shiftedB(1:end+delay(1)) = b(-delay(1)+1:end);
 end

% shiftedB1 = zeros(size(b1));
% if delay(1) >0
%   shiftedB1(delay(1)+1:end) = b1(1:end-delay(1));
% elseif delay(1) <0
%   shiftedB1(1:end+delay(1)) = b1(-delay(1)+1:end);
% end
% 
% shiftedB2 = zeros(size(b2));
% if delay(1) >0
%   shiftedB2(delay(1)+1:end) = b2(1:end-delay(1));
% elseif delay(1) <0
%   shiftedB2(1:end+delay(1)) = b2(-delay(1)+1:end);
% end
% 
% shiftedB3 = zeros(size(b3));
% if delay(1) >0
%   shiftedB3(delay(1)+1:end) = b3(1:end-delay(1));
% elseif delay(1) <0
%   shiftedB3(1:end+delay(1)) = b3(-delay(1)+1:end);
% end
% 
% shiftedB4 = zeros(size(b4));
% if delay(1) >0
%   shiftedB4(delay(1)+1:end) = b4(1:end-delay(1));
% elseif delay(1) <0
%   shiftedB4(1:end+delay(1)) = b4(-delay(1)+1:end);
% end
% 
% shiftedB5 = zeros(size(b5));
% if delay(1) >0
%   shiftedB5(delay(1)+1:end) = b5(1:end-delay(1));
% elseif delay(1) <0
%   shiftedB5(1:end+delay(1)) = b5(-delay(1)+1:end);
% end

%% 