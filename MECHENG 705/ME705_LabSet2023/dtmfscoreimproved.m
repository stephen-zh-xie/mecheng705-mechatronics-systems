function  sc = dtmfscoreimproved(xx, hh)
%
%          sc = dtmfscoreimproved(xx, hh)
%    returns a percentage based on the maximum amplitude of the filtered output
%     xx = input DTMF signal
%     hh = impulse response of ONE bandpass filter
%
% The signal detection is done by filtering xx with a length-L
% BPF, hh, and then finding the maximum amplitude of the output.
% The score is the max amplitude of the scaled output

xx = xx*(2/max(abs(xx)));   %---Scale x[n] to the range [-2,+2]

%%%% add your lines below to complete the code

% Stephen's code begins
% note: equation for filter is y[n] = sum of (Bk * x[n-k])
% but convolution works fine for FIR filters
% so y = b conv x

yy = conv(hh, xx);
sc = max(abs(yy));