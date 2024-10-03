% Plots the 8 badpassfilter magnitude responses using dtmfdesign
% Will also be used to check the effect of L=40 and L=80

% center frequencies
fcent = [697;770;852;941;1209;1336;1477;1633];

% get bandpass filters (fs = 8000, L = 40)
hh = dtmfdesign(fcent, 40, 8000);

% set up passband cutoff variables
startBand = zeros(1, length(fcent));
endBand = zeros(1, length(fcent));

% plot them all between 0 and pi
for i=1:1:length(fcent)
    [H, W] = freqz(hh(:, i), 1, 4096, 8000); % finds freq response
    plot(W, abs(H));
    
    passband = zeros(1, length(H));
    for j=1:1:length(H)
        if abs(H(j)) > (1 / sqrt(2))
            passband(j) = H(j);
        end
    end
    cutoff = find(passband);
    startPassband = cutoff(1);
    endPassband = cutoff(end);
    
    % W from freqz outputs the angular frequency of each response
    startBand(i) = W(startPassband);
    endBand(i) = W(endPassband);

    hold on
end
xlabel("Frequency (Hz)");
ylabel("Normalised Magnitude Response")