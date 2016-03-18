% Frequency Domain Filtering Code

% Load Data
load LowSNR;
data = collectedData(50,:);
figure()
plot(data)
xlabel('Sample Number')
ylabel('Voltage (V)')
title('Original Data')

% Transducer Characteristics
cf = 1.05;
BW = 0.3483*cf;
sample_freq = 125;
mean = cf;
variance = (BW*cf / (2*sqrt(2*log(2))))^2;

% Physical Frequencies
f_discrete = ([0:length(data) - 1].*sample_freq)./(length(data));

% FFT
freq_spec = fft(data);

% Plot
figure()
plot(f_discrete,abs(freq_spec))
xlabel('Frequency (MHz)')
ylabel('Voltage (V)')
title('Frequency Spectrum')

% Finding indices corresponding to center frequency and bandwidth

% 1st Peak
[onehi] = find(f_discrete >= (cf - BW/2));
[onelow] = find(f_discrete < (cf + BW/2));
p1 = intersect(onehi, onelow);

% 2nd Peak
[twohi] = find(f_discrete >= (max(f_discrete) - cf - BW/2));
[twolow] = find(f_discrete < (max(f_discrete) + cf - BW/2));
p2 = intersect(twohi, twolow);

% Define new frequency spectrum

% Hamming Window
freq_spec_new1 = zeros(size(freq_spec));
winFREQ = hamming(length(freq_spec_new1(p1)))';
winFREQ = winFREQ;
winFREQN = hamming(length(freq_spec_new1(p2)))'; 
winFREQN = winFREQN;
freq_spec_new1(p1) = freq_spec(p1).* winFREQ;
freq_spec_new1(p2) = freq_spec(p2).* winFREQN;

figure()
plot(real(ifft(freq_spec_new1)))
xlabel('Sample Number')
ylabel('Voltage (V)')
title('Hamming Window')

% % Gaussian Window
% freq_spec_new2 = zeros(size(freq_spec));
% freq_spec_new2(p1) = freq_spec(p1);
% freq_spec_new2(p2) = freq_spec(p2);
% winGauss1 = gaussian(f_discrete, 1, mean, variance);
% winGauss2 = gaussian(f_discrete, 1, max(f_discrete) - cf, variance);
% freq_spec_new2 = freq_spec_new2.*(winGauss1 + winGauss2);
% 
% 
% figure()
% plot(real(ifft(freq_spec_new2)))
% xlabel('Sample Number')
% ylabel('Voltage (V)')
% title('Gaussian Window')

% Box Window
freq_spec_new3 = zeros(size(freq_spec));
freq_spec_new3(p1) = freq_spec(p1);
freq_spec_new3(p2) = freq_spec(p2);

winBox1 = rectwin(length(p1))';
winBox2 = rectwin(length(p2))';
freq_spec_new3(p1) = freq_spec(p1).* winBox1;
freq_spec_new3(p2) = freq_spec(p2).* winBox2;

figure()
plot(real(ifft(freq_spec_new3)))
xlabel('Sample Number')
ylabel('Voltage (V)')
title('Box Window')
