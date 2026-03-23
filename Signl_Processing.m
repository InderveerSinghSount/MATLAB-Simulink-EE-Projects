clc;
clear;

t = 0:0.001:1;
f = 50;
signal = sin(2*pi*f*t);
noise = 0.5 * randn(size(t));
noisy_signal = signal + noise;

% Filter design
fs = 1000;
order = 100;
fc = 60;
b = fir1(order, fc/(fs/2));
filtered_signal = filter(b, 1, noisy_signal);

% FFT
N = length(noisy_signal);
freq = (0:N/2-1) * (fs/N);
fft_noisy = abs(fft(noisy_signal))/N;
fft_filtered = abs(fft(filtered_signal))/N;

% Plot
figure;
subplot(2,2,1);
plot(t(1:200), noisy_signal(1:200), 'r-');
title('Noisy Signal - Time Domain');
xlabel('Time (s)');
grid on;

subplot(2,2,2);
plot(t(1:200), filtered_signal(1:200), 'g-', 'LineWidth', 2);
title('Filtered Signal - Time Domain');
xlabel('Time (s)');
grid on;

subplot(2,2,3);
plot(freq, fft_noisy(1:N/2), 'r-');
title('Noisy Signal - Frequency Domain');
xlabel('Frequency (Hz)');
grid on;

subplot(2,2,4);
plot(freq, fft_filtered(1:N/2), 'g-', 'LineWidth', 2);
title('Filtered Signal - Frequency Domain');
xlabel('Frequency (Hz)');
grid on;