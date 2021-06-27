%% Octave Compatible
clear;
clc;
%%
fs = 375000;
disp_points = fs / 10;
sos = zeros([3, 6]);
sos(1, :) = HighShelf(50, 6, 1, fs);
sos(2, :) = LowShelf(2000, 6, 0.7, fs);
sos(3, :) = PeakNotch(8000, -2, 0.7, fs);
h = ones(disp_points, 1);
for i = 1:size(sos, 1)
    [h_temp, w] = freqz(sos(i, 1:3), sos(i, 4:6), disp_points, fs);
    h = h .* h_temp;
end
%%
figure(1)
subplot(2, 1, 1)
semilogx(w(2:end), 20 * log10(abs(h(2:end))));
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
grid on
subplot(2, 1, 2)
semilogx(w(2:end), angle(h(2:end)) / pi * 180);
xlabel('Frequency (Hz)')
ylabel('Phase (deg)')
grid on
% uiwait(figure(1))
