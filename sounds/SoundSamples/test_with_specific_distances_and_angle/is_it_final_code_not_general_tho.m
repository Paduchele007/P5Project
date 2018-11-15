clc;
clear;
load('RecordSession15thNov.mat')
l  = length(dataRB)
delay=8
for i=1:l-delay
    shiftedRB(i)=dataRB(i+delay);
end
shiftedRB=transpose(shiftedRB);

for i=1:l-delay
    noiseDataB(i)=shiftedRB(i)-dataLB(i); 
end

 noiseDataB=transpose(noiseDataB);
 
for i=1:l-delay
    newDataB(i)=dataLB(i)-noiseDataB(i); 
end

newDataB=transpose(newDataB);

 