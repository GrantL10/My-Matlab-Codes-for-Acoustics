function [ y ] = MovingAverage( x, win_size )

% by Dr.Li 

% x is the input data 
% y it the ouput data
% win_size is the size of moving windows

    y1 = filter(ones(1 ,floor(win_size/2) + 1) / win_size, 1, x);
    y2 = filter(ones(1 ,floor(win_size/2) + 1) / win_size, 1, fliplr(x));
    y = y1 + fliplr(y2) - (1/win_size) * x;
    
    
end
