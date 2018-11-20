clc;
clear;
load('nov19.mat')
l  = length(a)
delay=153
[new,noise,shiftedL]=is_it_final_code_probs_not(delay, bShifted, a,l);

 