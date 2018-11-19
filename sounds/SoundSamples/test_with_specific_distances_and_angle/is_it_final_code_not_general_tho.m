clc;
clear;
load('RecordSession15thNov.mat')
l  = length(dataRB)
delay=6
[newB,noiseB,shiftedLB]=is_it_final_code_probs_not(delay, dataRB, dataLB,l);

 