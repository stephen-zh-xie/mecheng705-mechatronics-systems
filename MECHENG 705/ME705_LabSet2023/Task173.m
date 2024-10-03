% Further analysis of band pass filter with frequency OMEGA(c) = 0.2
% note: h[n] = b * cos[OMEGA(c)*n] * w[n]

beta = 0.0369; % magnifies frequency response - 0.0369 from last task
OMEGAc = 0.2; % center frequency

% nn is time index
nn = 0:999;
% rawFilter is ideal filter
rawFilter = beta * cos(OMEGAc * nn);
% w is length of hamming window, our choice (order + 1 length)
w = 51;

filter = rawFilter(1:w);

[H, W] = freqz(filter, 1, 4096, 8000); % finds freq response
passband = zeros(1, length(H));
for i=1:1:length(H)
    if abs(H(i)) > (1 / sqrt(2))
        passband(i) = H(i);
    end
end
cutoff = find(passband);
startPassband = cutoff(1);
endPassband = cutoff(end);

% W from freqz outputs the angular frequency of each response
startFreq = W(startPassband);
endFreq = W(endPassband);