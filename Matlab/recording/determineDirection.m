%% CLEANUP
close all;
clc;
clear;

%% IMPORT SIGNALS

sample1 = ['D:\GitHub\P5Project\P5Project\Sounds\SoundSamples\basic_tones\maybe_properly\sine_500Hz_left.wav'];
[x,Freq] = audioread(sample1);
sample2 = ['D:\GitHub\P5Project\P5Project\Sounds\SoundSamples\basic_tones\maybe_properly\sine_500Hz_right.wav'];
[y,Freq] = audioread(sample2);
sample3 = ['D:\GitHub\P5Project\P5Project\Sounds\SoundSamples\basic_tones\maybe_properly\sawtooth_500Hz_left.wav'];
[z,Freq] = audioread(sample3);
sample4 = ['D:\GitHub\P5Project\P5Project\Sounds\SoundSamples\basic_tones\maybe_properly\sawtooth_500Hz_right.wav'];
[q,Freq] = audioread(sample4);
sample5 = ['D:\GitHub\P5Project\P5Project\Sounds\SoundSamples\basic_tones\maybe_properly\both_left.wav'];
[a,Freq] = audioread(sample5);
sample6 = ['D:\GitHub\P5Project\P5Project\Sounds\SoundSamples\basic_tones\maybe_properly\both_right.wav'];
[b,Freq] = audioread(sample6);

%% DISPLAY SIGNALS
figure()
subplot(2,1,1)
plot(x(1:1:1000));
hold on;
plot(y(1:1:1000));
subplot(2,1,2)
plot(z(1:1:1000));
hold on;
plot(q(1:1:1000));

figure()
hold on
plot(a(1000:1:2000));
plot(z(1000:1:2000));
plot(x(1000:1:2000));