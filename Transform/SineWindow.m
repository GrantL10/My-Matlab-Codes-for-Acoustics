function [ window ] = SineWindow( N )

% It needs to be windowed twice

n=0:N-1;
window=sin((n+0.5)/N*pi)';

end

