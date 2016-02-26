load Single_Multiple_Interface_Data_1.mat

% Sampling Frequency (in hertz)
per = 500e-6/size(dataA,2);
freq = 1/per;

%% Truncate the data
trun_size = 5000;
trun_dataA = dataA(:,trun_size:end);

%% Low Pass each data set in time and then average
filt_trun_dataA = zeros(size(trun_dataA));
for i = 1:size(trun_dataA,1)
    filt_trun_dataA(i,:) = filter(ones(1,50)/50,1,trun_dataA(i,:));
end

% Compute average of filtered data sets
avg_filt_trun_dataA = mean(filt_trun_dataA);


%% Average the data set and then low-pass

% Compute Average Data Set
avg_trun_dataA = mean(trun_dataA);

% Filter averaged data set
filt_avg_trun_dataA= filter(ones(1,50)/50,1,avg_trun_dataA);

%% Comparison plot
subplot(1,2,1); plot([trun_size:length(dataA)],avg_filt_trun_dataA);title('Filter then average')
subplot(1,2,2); plot([trun_size:length(dataA)],filt_avg_trun_dataA);title('Average then filter')


%% Frequency spectrum of the averaged data set
freq_spec = fft(filt_avg_trun_dataA);
figure()
N = max(size(filt_avg_trun_dataA));
f = [0: N - 1]*(freq/N);
plot(f(1:1000)/1e6,abs(freq_spec(1:1000)))
xlabel('Frequency (MHz)')
ylabel('Magnitude')
title('Frequency Spectrum of Echoes')

% Please find bandwidth.

%% Length of the phantom
c = 1540;
[len_peak, len_peak_location] = findpeaks(filt_avg_trun_dataA,'MinPeakHeight',0.2);
phantom_length = (len_peak_location(1) + trun_size)*per*c*0.5*39.3701;

% Plot of amplitude vs. distance
xaxis = [trun_size:max(size(dataA))];
time = xaxis.*per;
distance = time*0.5*c*39.3701;
figure()
plot(distance,filt_avg_trun_dataA)
xlabel('Distance (inches)')
ylabel('Amplitude (V)')
title('Amplitude vs. Distance')


%% Attenuation Coefficient
[at_peak, at_peak_location] = findpeaks(filt_avg_trun_dataA,'MinPeakHeight',0.01,'MinPeakDistance',len_peak_location(1));
at_peak_distance = (at_peak_location + trun_size)*per*0.5*c;
figure()
plot(log(at_peak_distance),log(at_peak));
xlabel('ln(distance in m)')
ylabel('ln(amplitude in V)')
title('Attentuation coefficient')
[alpha] = polyfit(log(at_peak_distance),log(at_peak),1);

%% Time Delay Compensation
filt_avg_trun_dataA_comp = filt_avg_trun_dataA;
band = 1000;
for i = 1:length(at_peak_location)
    filt_avg_trun_dataA_comp(at_peak_location(i)- band:at_peak_location(i) + band) = (filt_avg_trun_dataA_comp(at_peak_location(i) - band:at_peak_location(i) + band))*exp(-alpha(1)*at_peak_distance(i));
end
figure()
subplot(1,2,2); plot(distance,filt_avg_trun_dataA_comp);
xlabel('Sample Number')
ylabel('Amplitude(V)')
title('Compensated')
ylim([-0.5 0.5])
subplot(1,2,1); plot(distance,filt_avg_trun_dataA);
xlabel('Sample Number')
ylabel('Amplitude(V)')
title('Uncompensated')
ylim([-0.5 0.5])