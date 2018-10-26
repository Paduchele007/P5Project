%% CLEANUP

close all;
clc;
clear;

%% IMPORT SIGNALS

leftMic = ['D:\GitHub\P5Project\P5Project\Sounds\SoundSamples\RecordedSamples\ChatRight\LeftMicSample.flac'];
[x,Freq] = audioread(leftMic);
t = (1:length(x)) / Freq;
rightMic = ['D:\GitHub\P5Project\P5Project\Sounds\SoundSamples\RecordedSamples\ChatRight\RightMicSample.flac'];
[y,Freq] = audioread(rightMic);
u = (1:length(y)) / Freq;


%% DISPLAY SIGNALS

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
