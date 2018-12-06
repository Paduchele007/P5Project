clc;
clear;
load('already_shifted_vectors.mat')
l=length(dataLL)
delay=8
[Separated,shiftedL]=is_it_final_code_probs_not(delay, dataLL, dataRL,l);

 