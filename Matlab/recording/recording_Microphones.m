Freq = 48000;    %Sampling rate frequency in Hz
BitsSample = 16;    %Bits per sample 
Channels = 1;   %Channels 1(Mono) or 2(Stereo)
ID_Left=3;
ID_Right=1;

Microphone_Right = audiorecorder(Freq,BitsSample,Channels,1);
Microphone_Left = audiorecorder(Freq,BitsSample,Channels,3);

get(Microphone_Right);
get(Microphone_Left);

recordblocking(Microphone_Right,10);

Test_Recording = getaudiodata(Microphone_Right);
plot(Test_Recording);

