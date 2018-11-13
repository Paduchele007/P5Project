clc;
clear;
load('already_shifted_vectors.mat')
l  = length(dataRR)
delay=9
for i=1:l-delay
    shiftedLR(i)=dataLR(i+delay);
end
shiftedLR=transpose(shiftedLR);

for i=1:l-delay
    noiseDataR(i)=shiftedLR(i)-dataRR(i); 
end

 noiseDataR=transpose(noiseDataR);
 
for i=1:l-delay
    newDataR(i)=dataRR(i)-noiseDataR(i); 
end

newDataR=transpose(newDataR);

 