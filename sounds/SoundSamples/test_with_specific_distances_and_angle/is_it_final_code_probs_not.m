function [new,noise,shifted] = is_it_final_code_probs_not(delay, Right, Left,l)

for i=1:l-delay
    shifted(i)=Left(i+delay);
end
shifted=transpose(shifted);

for i=1:l-delay
    noise(i)=(2*shifted(i)-Left(i)-Right(i))/2;
end

 noise=transpose(noise);
 
for i=1:l-delay
    new(i)=Left(i)-noise(i); 
end

new=transpose(new);
end

