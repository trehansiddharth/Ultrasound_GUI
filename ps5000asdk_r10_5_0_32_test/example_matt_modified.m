initializeScope;
% deinitializeScope;

global scopeStatus;

scopeStatus.resolution = 12;
scopeStatus.timebase = 5;
scopeStatus.numCaptures = 1000;
scopeStatus.startTime = 0e-6;
scopeStatus.stopTime = 100e-6;
scopeStatus.channelSetting.a.enable = 1;
scopeStatus.channelSetting.a.range = '5v'; %50mV
scopeStatus.channelSetting.b.enable = false;
scopeStatus.channelSetting.b.range = '20mv'; %1v
scopeStatus.channelSetting.c.enable = 0;
scopeStatus.channelSetting.c.range = '50mv'; %1v
scopeStatus.channelSetting.d.enable = 0;
scopeStatus.channelSetting.d.range = '100mv';%1v
scopeStatus.triggerSetting.source = 'Ext';
scopeStatus.triggerSetting.threshold = 3.5; %originally 1.65
scopeStatus.triggerSetting.edge = 'rising';

[scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setupScope();
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
[data, elapseTime] = runScope1Ch();

tstep = 1/31.25e6;
time = 0:tstep:stopTime;

npt = 10;
%data = load('into_leg2.mat');
imagesc(data);
%{
figure(1)
imagesc(time * 1540 / 2, [1:numCaptures], logCompression(envelopeDetection(data), 60))
xlabel('depth (m)')
ylabel('sample number')
%}
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


