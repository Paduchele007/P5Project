a = 4000;
b = 6000;

T=100;
ts=1/100;
t=0:ts:T-ts;

y = cos(2 * pi * t * 0.1);
y1 = shiftFunction(240, y);

figure('Name', 'BlaBLa','NumberTitle', 'off');
subplot(2,1,1);
plot(t(a:b),y(a:b));
grid on;
axis tight;
ylabel('Amplitude', 'interpreter', 'latex', 'FontSize', 14);
xlabel('Time[s]','interpreter', 'latex', 'FontSize', 14);
title('Signal1', 'interpreter', 'latex', 'FontSize', 14);

subplot(2,1,2);
plot(t(a:b),y1(a:b));
grid on;
axis tight;
ylabel('Amplitude', 'interpreter', 'latex', 'FontSize', 14);
xlabel('Time[s]','interpreter', 'latex', 'FontSize', 14);
title('Signal1(240)', 'interpreter', 'latex', 'FontSize', 14);

x = 0.34 * cos(2 * pi * t);      
x1 = shiftFunction(-377,x);

figure('Name', 'BlaBLa1','NumberTitle', 'off');
subplot(2,1,1);
plot(t(a:b),x(a:b));
grid on;
axis tight;
ylabel('Amplitude', 'interpreter', 'latex', 'FontSize', 14);
xlabel('Time[s]','interpreter', 'latex', 'FontSize', 14);
title('Signal2', 'interpreter', 'latex', 'FontSize', 14);

subplot(2,1,2);
plot(t(a:b),x1(a:b));
grid on;
axis tight;
ylabel('Amplitude', 'interpreter', 'latex', 'FontSize', 14);
xlabel('Time[s]','interpreter', 'latex', 'FontSize', 14);
title('Signal2(-377)', 'interpreter', 'latex', 'FontSize', 14);


z = y+x1;
z1 = y1+x;

figure;
subplot(2,1,1);
plot(t(a:b),z(a:b));
grid on;
axis tight;
ylabel('Amplitude', 'interpreter', 'latex', 'FontSize', 14);
xlabel('Time[s]','interpreter', 'latex', 'FontSize', 14);
title('Signal1 + Signal2(-377)', 'interpreter', 'latex', 'FontSize', 14);

subplot(2,1,2);
plot(t(a:b),z1(a:b));
grid on;
axis tight;
ylabel('Amplitude', 'interpreter', 'latex', 'FontSize', 14);
xlabel('Time[s]','interpreter', 'latex', 'FontSize', 14);
title('Signal1(240) + Signal2', 'interpreter', 'latex', 'FontSize', 14);



zshifted = shiftFunction(377,z);
figure;
subplot(2,1,1);
subtractedSignal = zshifted - z1;
plot(t(a:b),-subtractedSignal(a:b));
grid on;
axis tight;
ylabel('Amplitude', 'interpreter', 'latex', 'FontSize', 14);
xlabel('Time[s]','interpreter', 'latex', 'FontSize', 14);
title('ObtainedSignal1', 'interpreter', 'latex', 'FontSize', 14);

subplot(2,1,2);
zshifted2 = shiftFunction(-240,z1);
subtractedSignal2 = zshifted2 - z;
plot(t(a:b),-subtractedSignal2(a:b));
grid on;
axis tight;
ylabel('Amplitude', 'interpreter', 'latex', 'FontSize', 14);
xlabel('Time[s]','interpreter', 'latex', 'FontSize', 14);
title('ObtainedSignal2', 'interpreter', 'latex', 'FontSize', 14);