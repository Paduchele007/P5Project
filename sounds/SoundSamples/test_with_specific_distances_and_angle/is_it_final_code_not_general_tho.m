clc;
clear;
load('already_shifted_vectors.mat')
l=length(dataLL)
delay=8
[Separated,shiftedL]=separation_of_real_samples(delay, dataLL, dataRL,l);

 