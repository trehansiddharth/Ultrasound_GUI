function [ echoes ] = find_ultrasound_echoes( data )
%find_ultrasound_peaks Finds the peaks (ignoring initial burst) of
%ultrasound data
%   Detailed explanation goes here

[rs cs] = size(data);

<<<<<<< HEAD
%[peaks, locs] = findpeaks(smoothen(hilbert(abs(data))), 'MinPeakHeight', 0.1, 'MinPeakDistance', 1000);
[peaks, locs] = findpeaks(smooth(abs(hilbert(abs(data(2500:end))))), 'MinPeakHeight', 0.045, 'MinPeakDistance', 1000);
echoes = [(2499 + locs(1:end)) peaks(1:end)];
=======
[peaks, locs] = findpeaks(abs(data(:,2)), 'MinPeakHeight', 0.1, 'MinPeakDistance', 1000);
echoes = [locs(1:end) peaks(1:end)];

for c = 3:cs
    [peaks, locs] = findpeaks(abs(data(:,c)), 'MinPeakHeight', 0.1, 'MinPeakDistance', 1000);
    echoes = [echoes(1:end,:); locs(1:end) peaks(1:end)];
end
>>>>>>> f11e294b01de53349ba64826f62c580684ccd8f4

end

