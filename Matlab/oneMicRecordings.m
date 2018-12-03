%% CLEANUP

close all;
clc;
clear;
gap=0.152;
%% IMPORT SIGNALS

signal1 = ['C:\P5Project\Adobe Audition\1micRecording\1micRecording_Recorded\razvan.wav'];
[a,Freq1] = audioread(signal1);
w = (1:length(a)) / Freq1;

signal2 = ['C:\P5Project\Adobe Audition\1micRecording\1micRecording_Recorded\paulius.wav'];
[b,Freq2] = audioread(signal2);
x = (1:length(b)) / Freq2;


%% ADD SIGNALS
[r1, d1] = ratioNsamples(-90, gap);
[r2, d2] = ratioNsamples(-90, gap);

resizedA = a(1:580000);
resizedB = b(1:580000);

rightMicLeftChatRazvan = resizedA;
leftMicLeftChatRazvan = shiftFunction(-d1, resizedA);
rightMicLeftChatRazvan = r1 * rightMicLeftChatRazvan;

rightMicRightChatPaulius = resizedB;
leftMicRightChatPaulius = shiftFunction(d2, resizedB);
rightMicRightChatPaulius = r2 * rightMicRightChatPaulius;

rightMicBothChatRazvanPaulius = rightMicLeftChatRazvan + rightMicRightChatPaulius;
leftMicBothChatRazvanPaulius = leftMicLeftChatRazvan + leftMicRightChatPaulius;

shiftedLeftMicBothChatRazvanPaulius = shiftFunction(-d1, leftMicBothChatRazvanPaulius);
shiftedLeftMicBothChatRazvanPaulius1 = shiftFunction(d2, leftMicBothChatRazvanPaulius);

subtractedSignal1 = shiftedLeftMicBothChatRazvanPaulius - rightMicBothChatRazvanPaulius;
subtractedSignal2 = shiftedLeftMicBothChatRazvanPaulius1 - rightMicBothChatRazvanPaulius;

%% SAVE SIGNAL

filename1 = 'subtractedSignalR.flac';
audiowrite(filename1,subtractedSignal1,48000);
filename2 = 'subtractedSignalP.flac';
audiowrite(filename2,subtractedSignal2,48000);
filename3 = 'leftMicBothChat.flac';
audiowrite(filename3,leftMicBothChatRazvanPaulius,48000);
filename4 = 'rightMicBothChat.flac';
audiowrite(filename4, rightMicBothChatRazvanPaulius,48000);

%% CLEAR VARIABLES

clearvars Freq1 Freq2 Freq3 Freq4 signal1 signal2 signal3 signal4 w x y z
clearvars filename1 filename2 filename3 filename4 a b resizedA resizedB

