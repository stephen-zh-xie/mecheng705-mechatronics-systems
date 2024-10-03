% Generates dial up tone from 10 numbers, then plots

xx = dtmfdial('0123456789');
plot(xx)
title('Plot of waveform of phone number dial')
xlabel('time')
ylabel('amplitude')

spectrogram(xx, hamming(128), 0, 128)