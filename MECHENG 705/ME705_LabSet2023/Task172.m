% Generates band pass filter with frequency OMEGA(c) = 0.2
% note: h[n] = b * cos[OMEGA(c)*n] * w[n]

beta = 1; % magnifies frequency response - 1 for testing purposes
OMEGAc = 0.2; % center frequency

% nn is time index
nn = 0:999;
% rawFilter is ideal filter
rawFilter = beta * cos(OMEGAc * nn);
% w is length of hamming window, our choice (order + 1 length)
w = 51;

filter = rawFilter(1:w);

[H, W] = freqz(filter, 1, 4096); % finds freq response
maxVal = max(abs(H)); % finds maximum amplitude of freq response
newBeta = 1/maxVal; % gets beta required for normalised freq response