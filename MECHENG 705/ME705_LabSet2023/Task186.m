% Find minimum noise the decoder can deal with
% Author: Stephen Xie

% variable for percent checking
snrAcc = zeros(1, 20);

% for each snr value:
for i=1:1:20
    % run this many times
    for j = 1:1:100
        % Generates dial up tone
        
        xx = dtmfdial('01205978436', i);
        
        keys = dtmfrun(xx, 200, 8000);
        if isequal(keys, ["0", "1", "2", "0", "5", "9", "7", "8", "4", "3", "6"])
            snrAcc(i) = snrAcc(i) + 1;
        end
    end


end
