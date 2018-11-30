%% CLEANUP
close all;
clc;
clear;
gap=0.152;

%% IMPORT SIGNALS

signal1 = ['C:\P5Project\Adobe Audition\1micRecording\1micRecording_Recorded\Razvan.wav'];
[a,Freq1] = audioread(signal1);
w = (1:length(a)) / Freq1;

signal2 = ['C:\P5Project\Adobe Audition\1micRecording\1micRecording_Recorded\Paulius.wav'];
[b,Freq2] = audioread(signal2);
x = (1:length(b)) / Freq2;

signal3 = ['C:\P5Project\Adobe Audition\1micRecording\1micRecording_Recorded\Titas.wav'];
[c,Freq3] = audioread(signal3);
y = (1:length(c)) / Freq3;

% noise = ['C:\P5Project\Adobe Audition\1micRecording\1micRecording_Recorded\keyboardClicking.wav'];
% [d,Freq4] = audioread(signal4);
% z = (1:length(d)) / Freq4;

%% ADD SIGNALS
[r1, d1] = ratioNsamples(90, gap)
[r2, d2] = ratioNsamples(60, gap)
[r3, d3] = ratioNsamples(-40, gap)

resizedA = a(1:580000);
resizedB = b(1:580000);
resizedC = c(1:580000);
%% Shift and add gains
rightMicLeftChatRazvan = resizedA;
leftMicLeftChatRazvan = shiftFunction(-d1, resizedA);
rightMicLeftChatRazvan = r1 * rightMicLeftChatRazvan;

rightMicRightChatPaulius = resizedB;
leftMicRightChatPaulius = shiftFunction(d2, resizedB);
rightMicRightChatPaulius = r2 * rightMicRightChatPaulius;

rightMicRightChatTitas = resizedC;
leftMicRightChatTitas = shiftFunction(d3, resizedC);
rightMicRightChatTitas = r3 * rightMicRightChatTitas;

%% Add signals
rightMicThreeChatRazvanPauliusTitas = rightMicLeftChatRazvan + rightMicRightChatPaulius + rightMicRightChatTitas;
leftMicThreeChatRazvanPauliusTitas = leftMicLeftChatRazvan + leftMicRightChatPaulius + leftMicRightChatTitas;

%% Do the filtering
shiftedLeftMicThreeChatRazvanPauliusTitas = shiftFunction(-d2, leftMicThreeChatRazvanPauliusTitas);
shiftedLeftMicThreeChatRazvanPauliusTitas1 = shiftFunction(d1, leftMicThreeChatRazvanPauliusTitas);
shiftedLeftMicThreeChatRazvanPauliusTitas2 = shiftFunction(-d3, leftMicThreeChatRazvanPauliusTitas);


subtractedSignal1 = (shiftedLeftMicThreeChatRazvanPauliusTitas + shiftedLeftMicThreeChatRazvanPauliusTitas2) - 2*rightMicThreeChatRazvanPauliusTitas;
subtractedSignal2 = (shiftedLeftMicThreeChatRazvanPauliusTitas1 + shiftedLeftMicThreeChatRazvanPauliusTitas2) - 2*rightMicThreeChatRazvanPauliusTitas;
subtractedSignal3 = (shiftedLeftMicThreeChatRazvanPauliusTitas + shiftedLeftMicThreeChatRazvanPauliusTitas1) - 2*rightMicThreeChatRazvanPauliusTitas;

%% SAVE SIGNAL

filename1 = 'subtractedSignalR.flac';
audiowrite(filename1,subtractedSignal1,48000);
filename2 = 'subtractedSignalP.flac';
audiowrite(filename2,subtractedSignal2,48000);
filename3 = 'subtractedSignalT.flac';
audiowrite(filename3,subtractedSignal3,48000);
filename4 = 'leftMicThreeChat.flac';
audiowrite(filename4,leftMicThreeChatRazvanPauliusTitas,48000);
filename5 = 'rightMicThreeChat.flac';
audiowrite(filename5, rightMicThreeChatRazvanPauliusTitas,48000);

%% CLEAR VARIABLES

clearvars Freq1 Freq2 Freq3 Freq4 signal1 signal2 signal3 signal4 w x y z
clearvars filename1 filename2 filename3 filename4 a b resizedA resizedB

