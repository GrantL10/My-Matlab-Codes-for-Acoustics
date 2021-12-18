function h = BandPass(f0, Q, fs, type)

    % Biquad IIR Band-Pass Filter
    % f0: center frequency
    % Q: quality factor
    % fs: sampling rate
    % param type: 1) constant 0 dB peak gain; 2) constant skirt gain, peak gain = Q
    % Return: double 2-order coefficients

    w0 = 2 * pi * f0 / fs;
    alpha = sin(w0) / (2 * Q);
    if (nargin == 3 || type == 1)
        b0 = alpha;
        b1 = 0;
        b2 = -alpha;
        a0 = 1 + alpha;
        a1 = -2 * cos(w0);
        a2 = 1 - alpha;
    else                     % type 2)
        b0 = sin(w0) / 2 ;   % = Q * alpha
        b1 = 0;
        b2 = -sin(w0) / 2;   % = -Q * alpha
        a0 = 1 + alpha;
        a1 = -2 * cos(w0);
        a2 = 1 - alpha;
    end
    b = [b0, b1, b2];
    a = [a0, a1, a2];
    h = [b / a(1), a / a(1)];

end
