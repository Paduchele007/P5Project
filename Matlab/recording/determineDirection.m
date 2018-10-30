%% CLEANUP

close all;
clc;
clear;

%% IMPORT SIGNALS

leftMic = ['D:\GitHub\P5Project\P5Project\Sounds\AdobeAuditionSamples\CentreChatLeftMic.wav'];
[x,Freq] = audioread(leftMic);
t = (1:length(x)) / Freq;
rightMic = ['D:\GitHub\P5Project\P5Project\Sounds\AdobeAuditionSamples\CentreChatRightMic.wav'];
[y,Freq] = audioread(rightMic);
u = (1:length(y)) / Freq;


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
figure('Name', 'Titas Talking', 'NumberTitle', 'off');
subplot(3,1,1);
plot(t,x, 'r');
axis tight;
subplot(3,1,2);
plot(u,y, 'b');
axis tight;
subplot(3,1,3);
plot(t,x, 'r');
hold on;
plot(u,y, 'b');
axis tight;


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