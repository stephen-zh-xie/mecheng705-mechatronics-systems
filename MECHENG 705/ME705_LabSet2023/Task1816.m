% Plots the bandpass filter magnitude responses
% goes through a variety of Ls and checks if they work

% center frequencies
fcent = [697;770;852;941;1209;1336;1477;1633];

% initialise storage variable to check if L value works
testPass = zeros(1, 160); % note: values 1-39 probably unused
testStop = zeros(1, 160);

for r=40:1:160
        
    % get bandpass filters (fs = 8000, L = 40)
    hh = dtmfdesign(fcent, r, 8000);
    
    % set up passband cutoff variables
    startBand = zeros(1, length(fcent));
    endBand = zeros(1, length(fcent));
    
    % plot them all between 0 and pi
    for i=1:1:length(fcent)
        [H, W] = freqz(hh(:, i), 1, 4096, 8000); % finds freq response
        
        passband = zeros(1, length(H));
        stopband = zeros(1, length(H));
        for j=1:1:length(H)
            if abs(H(j)) > (1 / sqrt(2))
                passband(j) = H(j);
            end
            if abs(H(j)) > (1 / 4)
                stopband(j) = H(j);
            end
        end

        % begin passband testing - make sure the value's in the passband
        cutoffPass = find(passband);
        startPassband = cutoffPass(1);
        endPassband = cutoffPass(end);

        % W from freqz outputs the angular frequency of each response
        startBand(i) = W(startPassband);
        endBand(i) = W(endPassband);
        
        % increments testPass if a frequency is within passband
        % this should trigger once for each center freq on a functioning
        % filter
        for k=1:1:length(fcent)
            if fcent(k) > startBand(i) && fcent(k) < endBand(i)
                testPass(r) = testPass(r) + 1;
            end
        end
        
        % begin stopband testing - make sure all other freq outside
        cutoffStop = find(stopband);
        startStopband = cutoffStop(1);
        endStopband = cutoffStop(end);
        
        startBand(i) = W(startStopband);
        endBand(i) = W(endStopband);

        % increments testStop if a frequency is inside stopbad
        % this should trigger once for each center freq on a functioning
        % filter
        for l=1:1:length(fcent)
            if fcent(l) > startBand(i) && fcent(l) < endBand(i)
                testStop(r) = testStop(r) + 1;
            end
        end
        
    end

end