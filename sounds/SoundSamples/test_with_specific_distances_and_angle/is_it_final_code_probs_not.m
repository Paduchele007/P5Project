function [separated,shifted] = separation_of_real_samples(delay, Right, Left,l)
%% delay so the phase matches

for i=1:l-delay
    shifted(i)=Left(i+delay);
end
shifted=transpose(shifted);
%% substract signals from each other = get noise
for i=1:l-delay
    separated(i)=shifted(i)-Right(i);
end
 separated=transpose(separated);
