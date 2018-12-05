clc;
clear;
load('already_shifted_vectors.mat')
l=length(dataLL)
delay=9
[new,noise,shiftedL]=is_it_final_code_probs_not(delay, dataRL, dataLL,l);
audiowrite('mufi.flac',new,48000);
audiowrite('noiseMufi.flac',noise,48000);
audiowrite('mufiShifted.flac',shiftedL,48000);