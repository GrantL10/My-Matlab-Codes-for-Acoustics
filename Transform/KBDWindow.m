function [ dn ] =  KBDWindow( N )

% Kaiser–Bessel Derived (KBD) window
% N: the size of windows
% alpha = 4 is the optimal value,  refering to the relevant studies

M = N/2;
n = 0:N/2;
alpha = 4;
wn = besseli(0,pi*alpha*sqrt(1-(2*n/(M-1)-1).^2))/besseli(0,pi*alpha);    % In MATLAB Library: Kaiser's beta = pi * alpha

dn = zeros(N, 1);
temp = sum(wn);
for n = 1:N/2
    dn(n) = sqrt(sum(wn(1:n)) / temp);
end
for n = N/2+1:N
    dn(n) = sqrt(sum(wn(1:N + 1 - n)) / temp);
end

end

