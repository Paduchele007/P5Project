Freq = 48000;    %Sampling rate frequency in Hz
BitsSample = 16;    %Bits per sample 
Channels = 1;   %Channels 1(Mono) or 2(Stereo)
ID_Left=3;
ID_Right=1;

Microphone_Right = audiorecorder(Freq,BitsSample,Channels,1);
Microphone_Left = audiorecorder(Freq,BitsSample,Channels,3);

get(Microphone_Right);
get(Microphone_Left);

record(Microphone_Right,10);
record(Microphone_Left,10);

pause(10);

Test_Recording_Right = getaudiodata(Microphone_Right);
Test_Recording_Left = getaudiodata(Microphone_Left);

figure
hold on
plot(Test_Recording_Right);
plot(Test_Recording_Left);

