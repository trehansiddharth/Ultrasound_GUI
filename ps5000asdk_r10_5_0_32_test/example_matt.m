initializeScope;
% deinitializeScope;

resolution = 12; %don't change(bits)
timebase = 5; % 4 - 62.5MHz sampling frequency; 5 - 31.25MHz sampling freq
numCaptures = 1000; % (#) can't seem to go much higher than 1000 when timebase = 5, otherwise run into "out of memory" error
startTime = 0e-6; % (s)
stopTime = 100e-6; % was 100 e-6(s)
channelSetting = {1, '5v', 0, '20mv', 0, '50mv', 0, '100mv'};
triggerSetting = {'Ext', 3.5, 'rising'};
%[time, numSamples, buffers] = setupScope(ps5000aDeviceObj, ps5000aEnuminfo, resolution, timebase, channelSetting, triggerSetting, numCaptures, startTime, stopTime);
[time, numSamples, buffers] = setupScope();
% [dataA, dataB, dataC, dataD] = runScope(ps5000aDeviceObj, numCaptures, buffers);
% [dataA] = runScope1Ch(ps5000aDeviceObj, numSamples, numCaptures, buffers);
%%

5
pause(1)
4
pause(1)
3
pause(1)
2
pause(1)
1
pause(1)
beep
[dataA, dataB, dataC, dataD] = runScope(ps5000aDeviceObj, numCaptures, buffers);

tstep = 1/31.25e6;
time = 0:tstep:stopTime;

npt = 10;
%data = load('into_leg2.mat');
figure(1)
imagesc(time * 1540 / 2, [1:numCaptures], logCompression(envelopeDetection(data), 60))
xlabel('depth (m)')
ylabel('sample number')
% figure(2)
% imagesc(time* 1540 / 2, [1:numCaptures], logCompression(envelopeDetection(dataA(:,1:3200)), 60))
% % imagesc([1:numCaptures],time(npt:end) * 1540 / 2, logCompression(envelopeDetection(data(:,npt:end)), 60)')

%%

%save('2015-01-12-pork-narrowside13', 'dataA', 'time')

% hold on
% plot([1831,1942],[0.06227,0.02104],'w')
% plot([3030,3163],[0.05681,0.02041],'w')
% % plot([2407,2407],[0,0.1],'w')
% % plot([3410,3410],[0,0.1],'w')
% % imagesc(logCompression(envelopeDetection(data(:, 500:end)), 60))
% colormap(gray)
% 
% ylim([1500,1800])


