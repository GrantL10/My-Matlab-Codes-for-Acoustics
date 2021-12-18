function h = AllPass(f0, Q, fs)

    % Biquad IIR All-Pass Filter
    % f0: center frequency
    % Q: quality factor
    % fs: sampling rate
    % Return: double 2-order coefficients

    w0 = 2 * pi * f0 / fs;
    alpha = sin(w0) / (2 * Q);
    b0 = 1 - alpha;
    b1 = -2 * cos(w0);
    b2 = 1 + alpha;
    a0 = 1 + alpha;
    a1 = -2 * cos(w0);
    a2 = 1 - alpha;
    b = [b0, b1, b2];
    a = [a0, a1, a2];
    h = [b / a(1), a / a(1)];

end
