function [new,noise,shifted] = is_it_final_code_probs_not(delay, Right, Left,l)
%% delay so the phase matches

for i=1+delay:l
    shifted(i)=Left(i-delay);
end
shifted=transpose(shifted);
%% substract signals from each other = get noise
for i=1:l-delay
    noise(i)=shifted(i)-Right(i);
end
 noise=transpose(noise);
%% substract noise from original = filtered
for i=1:l-delay
    new(i)=Right(i)-noise(i); 
end

new=transpose(new);
end


