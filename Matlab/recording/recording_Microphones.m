%% CLEANING EVERYTHING
clc;
clear;

%% SETUP
Freq = 48000;           %Sampling rate frequency in Hz
BitsSample = 16;        %Bits per sample 
Channels = 2;           %Channels 1(Mono) or 2(Stereo)
ID_Left=3;              
ID_Right=1;             %audiodevinfo for more info

Microphone_Right = audiorecorder(Freq,BitsSample,Channels,ID_Right);
Microphone_Left = audiorecorder(Freq,BitsSample,Channels,ID_Left);

%% RECORDING
get(Microphone_Right);
get(Microphone_Left);

record(Microphone_Right,10);
record(Microphone_Left,10);

pause(10);

Test_Recording_Right = getaudiodata(Microphone_Right);
Test_Recording_Left = getaudiodata(Microphone_Left);

%% PLOTTING
figure
hold on
plot(Test_Recording_Right);
plot(Test_Recording_Left);

%% SAVING FILES
filename1 = 'RightMicSample4.flac';
audiowrite(filename1,Test_Recording_Right,48000);
filename2 = 'LeftMicSample4.flac';
audiowrite(filename2,Test_Recording_Left,48000);

%% IMPORTING SIGNALS FOR SIGNAL ANALYZER

rightMicSample = ['RightMicSample.flac'];
[x,~] = audioread(rightMicSample);
leftMicSample = ['LeftMicSample.flac'];
[y,Freq] = audioread(leftMicSample);
%}