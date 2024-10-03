function  sc = dtmfscore(xx, hh)
%DTMFSCORE
%          sc = dtmfscore(xx, hh)
%    returns a score based on the maximum amplitude of the filtered output
%     xx = input DTMF signal
%     hh = impulse response of ONE bandpass filter
%
% The signal detection is done by filtering xx with a length-L
% BPF, hh, and then finding the maximum amplitude of the output.
% The score is either 1 or 0.
%      sc = 1 if max(|y[n]|) is greater than, or equal to, 0.59
%      sc = 0 if max(|y[n]|) is less than 0.59

xx = xx*(2/max(abs(xx)));   %---Scale x[n] to the range [-2,+2]

%%%% add your lines below to complete the code

% Stephen's code begins
% note: equation for filter is y[n] = sum of (Bk * x[n-k])
% but convolution works fine for FIR filters
% so y = b conv x

yy = conv(hh, xx);
if max(abs(yy)) >= 0.45
    sc = 1;
else
    sc = 0;
end