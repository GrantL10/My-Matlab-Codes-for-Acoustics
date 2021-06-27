function h = LowShelf(f0, gain, Q, fs)

    % Biquad IIR Low-Shelf Filter
    % f0: center frequency
    % Q: quality factor
    % gain: gain
    % fs: sampling rate
    % Return: double 2-order coefficients

    A = sqrt(10^(gain / 20));
    w0 = 2 * pi * f0 / fs;
    alpha = sin(w0) / (2 * Q);
    b0 = A * ((A + 1) - (A - 1) * cos(w0) + 2 * sqrt(A) * alpha);
    b1 = 2 * A * ((A - 1) - (A + 1) * cos(w0));
    b2 = A * ((A + 1) - (A - 1) * cos(w0) - 2 * sqrt(A) * alpha);
    a0 = (A + 1) + (A - 1) * cos(w0) + 2 * sqrt(A) * alpha;
    a1 = -2 * ((A - 1) + (A + 1) * cos(w0));
    a2 = (A + 1) + (A - 1) * cos(w0) - 2 * sqrt(A) * alpha;
    b = [b0, b1, b2];
    a = [a0, a1, a2];
    h = [b / a(1), a / a(1)];

end
