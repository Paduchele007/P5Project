%% CLEANUP

close all;
clc;
clear;

%% IMPORT SIGNALS

signal1 = ['D:\GitHub\P5Project\P5Project\Sounds\AdobeAuditionSamples\50DegRightChatLeftMic.wav'];
[a,Freq1] = audioread(signal1);
w = (1:length(a)) / Freq1;

signal2 = ['D:\GitHub\P5Project\P5Project\Sounds\AdobeAuditionSamples\50DegRightChatRightMic.wav'];
[b,Freq2] = audioread(signal2);
x = (1:length(b)) / Freq2;

signal3 = ['D:\GitHub\P5Project\P5Project\Sounds\AdobeAuditionSamples\50DegLeftChatLeftMic.wav'];
[c,Freq3] = audioread(signal3);
y = (1:length(c)) / Freq3;

signal4 = ['D:\GitHub\P5Project\P5Project\Sounds\AdobeAuditionSamples\50DegLeftChatRightMic.wav'];
[d,Freq4] = audioread(signal4);
z = (1:length(d)) / Freq4;

signal5 = ['D:\GitHub\P5Project\P5Project\Sounds\AdobeAuditionSamples\CentreChatLeftMic.wav'];
[e,Freq5] = audioread(signal3);
q = (1:length(e)) / Freq5;

signal6 = ['D:\GitHub\P5Project\P5Project\Sounds\AdobeAuditionSamples\CentreChatRightMic.wav'];
[f,Freq6] = audioread(signal4);
p = (1:length(f)) / Freq6;


%% DISPLAY SIGNALS
%{
figure('Name', 'Recorded Smamples', 'NumberTitle', 'off')

subplot(2,1,1);
plot(t,x(1:1:length(x)), 'b');
axis tight;
title('Left Microphone')
xlabel('Time[s]', 'interpreter', 'latex', 'FontSize', 15);
ylabel('Amplitude');

subplot(2,1,2);
plot(u,y(1:1:length(y)), 'r');
axis tight;
title('Right Microphone')
xlabel('Time[s]', 'interpreter', 'latex', 'FontSize', 15);
ylabel('Amplitude');
%}

%% DISPLAY SIGNALS FIRST 500 SAMPLES
%{
figure('Name', 'Recorded Smamples', 'NumberTitle', 'off')

subplot(2,1,1);
plot(t(1:1:450000),x(1:1:450000),'b');
axis tight;
title('Left Microphone')
xlabel('Time[s]', 'interpreter', 'latex', 'FontSize', 15);
ylabel('Amplitude');

subplot(2,1,2);
plot(u(1:1:450000),y(1:1:450000),'r');
axis tight;
title('Right Microphone')
xlabel('Time[s]', 'interpreter', 'latex', 'FontSize', 15);
ylabel('Amplitude');
%}

%% SEARCH FOR CLOSEST VALUE SAMPLE 
%{
absoluteValue = ones;
for i = 1:1:500
    if i < 500
        for j = 1:1:i+500
            absoluteValue1(i) = abs(x(i) - x(j));
            if absoluteValue1(i) < 0.2 && absoluteValue1(i) < absoluteValue(i)
                absoluteValue(i) = absoluteValue1(i);
                closestSample(i) = j;
                
            end
        end
    else
        for j = i-499:1:i+500
            absoluteValue1(i) = abs(x(i) - x(j));
            if absoluteValue1(i) < 0.2 && absoluteValue1(i) < absoluteValue(i)
                absoluteValue(i) = absoluteValue1(i);
                closestSample(i) = j;
            end
        end
    end
end
%}

%% PLOT SIGNALS ON TOP
figure('Name', '50 Deg Right Chat', 'NumberTitle', 'off');

subplot(3,1,1);
plot(w,a, 'r');
axis tight;
title('Left Microphone(Should Be Second)');

subplot(3,1,2);
plot(x,b, 'b');
axis tight;
title('Right Microphone(Should Be First)');

subplot(3,1,3);
plot(w,a,'r');
hold on;
plot(x,b,'b');
axis tight;
title('Both Microphones');

figure('Name', '50 Deg Left Chat', 'NumberTitle', 'off');
subplot(3,1,1);
plot(y,c, 'r');
axis tight;
title('Left Microphone(Should Be First)');

subplot(3,1,2);
plot(z,d, 'b');
axis tight;
title('Right Microphone(Should Be Second)');

subplot(3,1,3);
plot(y,c, 'r');
hold on;
plot(z,d, 'b');
axis tight;
title('Both Microphones');

figure('Name', 'Center Chat', 'NumberTitle', 'off')
subplot(3,1,1);
plot(q,e, 'r');
axis tight;
title('Left Microphone');

subplot(3,1,2);
plot(p,f, 'b');
axis tight;
title('Right Microphone');

subplot(3,1,3);
plot(q,e, 'r');
hold on;
plot(p,f, 'b');
axis tight;
title('Should be kind of the same');


%% FIND HIGHEST VALUE SAMPLES
%{
highestValuex = 0;
lowestValuex = 0;
for i = 1:1:length(x);
    if x(i) > highestValuex;
        highestValuex = x(i);
        highestValuexindex = i;
    end
    if x(i) < lowestValuex
        lowestValuex = x(i);
        lowestValuexindex = i;
    end
end

highestValuey = 0;
lowestValuey = 0;
for i = 1:1:length(y);
    if y(i) > highestValuey;
        highestValuey = y(i);
        highestValueyindex = i;
    end
    if y(i) < lowestValuey;
        lowestValuey = y(i);
        lowestValueyindex = i;
    end
end
%}

%% DETERMINE MULTIPLE INTERVAL DELAYS
%{
highestValuexIndex = 1;
lowestValuexIndex = 1;
for i = 10000:1000:length(x)
    highestValuex = 0;
    lowestValuex = 0;
        for j = i-999:1:i+1000;
            if x(j) > highestValuex;
                highestValuex = x(i);
            end
            if x(j) < lowestValuex;
                lowestValuex = x(i);
            end
        end
        highestValuexVector(highestValuexIndex) = highestValuex;
        highestValuexIndex = highestValuexIndex + 1;
        lowestValuexVector(lowestValuexIndex) = lowestValuex;
        lowestValuexIndex = lowestValuexIndex + 1;
end

highestValueyIndex = 1;
lowestValueyIndex = 1;
for i = 10000:1000:length(y)
    highestValuey = 0;
    lowestValuey = 0;
        for j = i-999:1:i+1000;
            if y(j) > highestValuey;
                highestValuey = y(i);
            end
            if y(j) < lowestValuey;
                lowestValuey = y(i);
            end
        end
        highestValueyVector(highestValueyIndex) = highestValuey;
        highestValueyIndex = highestValueyIndex + 1;
        lowestValueyVector(lowestValueyIndex) = lowestValuey;
        lowestValueyIndex = lowestValueyIndex + 1;
end
%}