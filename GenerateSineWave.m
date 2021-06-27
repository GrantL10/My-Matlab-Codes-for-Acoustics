clear;
clc;
%%
% Generate time series
fs = 48000;       % [Hz] Sampling Rate
t = 60;           % [s]  Duration
x = 0:1/fs:t;     % [s]  Time Series
 
% Generate signal
f = 3000;         % [Hz] Signal Frequency
g = 1;            % Gain coefficient
y = g * sin(2*pi*f*x);
 
% Generate wave file
filename = [num2str(f), 'Hz.wav'];
audiowrite(filename, y, fs); 
% sound(y,fs);