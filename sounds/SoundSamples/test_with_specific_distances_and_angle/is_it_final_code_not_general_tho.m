clc;
clear;
load('RecordSession15thNov.mat')
l  = length(dataRB)
delay=6
for i=1:l-delay
    shiftedLB(i)=dataLB(i+delay);
end
shiftedLB=transpose(shiftedLB);

for i=1:l-delay
    shiftedLB(i)=dataLB(i+delay);
end
shiftedLB=transpose(shiftedLB);

for i=1:l-delay
    noiseDataB(i)=(2*shiftedLB(i)-dataRB(i)-dataLB(i))/2;
end

 noiseDataB=transpose(noiseDataB);
 
for i=1:l-delay
    newDataB(i)=dataLB(i)-noiseDataB(i); 
end

newDataB=transpose(newDataB);

 