%% SHIFT FUNCTION 
% this function shifts the signal by the amount samples and returns a shifted signal
% input the signal the the delay in samples, negative or positive

function[shifted] = shiftFunction(samples, signal)
shifted = zeros(size(signal));
if samples > 0
   shifted(samples+1:end) = signal(1:end - samples);
 elseif samples < 0
   shifted(1:end + samples) = signal(-samples + 1:end);
 end
end