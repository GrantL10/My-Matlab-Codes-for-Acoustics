%% For Stereo
clear;
clc;
N = 1024;  
[y,fs]=audioread('es01.wav');
%% Overlap-MDCT
block = N / 2;
len = length(y);
last = rem(len, block);
len = len-last;
Frame = len / block;
if last ~= 0
    i = block - last;    % If samples are not an integer multiple of N/2, then zeros should be filled in.
    y(len + last + i,:)=0;
    len = length(y);
else
    Frame = Frame - 1;
end
win = KBDWindow(N);
stereo_L = zeros(N / 2, Frame);
stereo_R = zeros(N / 2, Frame);
% mdct = @mdct4;
for i=1:Frame
    stereo_L(:,i) = mdct4(y((i - 1)* block + 1:(i + 1) * block, 1) .* win);
    stereo_R(:,i) = mdct4(y((i - 1)* block + 1:(i + 1) * block, 2) .* win);
%     stereo_L(:,i) = feval(mdct, y((i - 1)* block + 1:(i + 1) * block, 1) .* win);
%     stereo_R(:,i) = feval(mdct, y((i - 1)* block + 1:(i + 1) * block, 2) .* win);

end
%%  Overlap-IMDCT
yi=zeros(len,2);
% imdct = @imdct4;
for i = 1:Frame
    yi((i - 1)* block + 1:(i + 1) * block, 1) = yi((i - 1)* block + 1:(i + 1) * block, 1) + imdct4(stereo_L(:,i)) .* win;
    yi((i - 1)* block + 1:(i + 1) * block, 2) = yi((i - 1)* block + 1:(i + 1) * block, 2) + imdct4(stereo_R(:,i)) .* win;
%     yi((i - 1)* block + 1:(i + 1) * block, 1) = yi((i - 1)* block + 1:(i + 1) * block, 1) + feval(imdct, stereo_L(:,i)) .* win;
%     yi((i - 1)* block + 1:(i + 1) * block, 2) = yi((i - 1)* block + 1:(i + 1) * block, 2) + feval(imdct, stereo_R(:,i)) .* win;
end
sound(yi, fs)
subplot(2, 1, 1)
plot(y)
subplot(2, 1, 2)
plot(yi)
