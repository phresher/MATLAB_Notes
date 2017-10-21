t = 0:.001:.25;
x = sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + 2*randn(size(t));

figure
plot(y(1:50))
title('Noisy time domain signal')
Y = fft(y,251);
Pyy = Y.*conj(Y)/251;
f = 1000/251*(0:127);

figure
plot(f,Pyy(1:128))
title('Power spectral density')
xlabel('Frequency (Hz)')