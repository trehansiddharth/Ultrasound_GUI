clear all;
close all;
clc;


% 1. initializeScope
% 2. run set up scope section
% 3. run the scope section
% 4. run the image/plot section
% 5. deinitialize scope before closing!!!



%% Manual Initialization

% initializeScope;
% deinitializeScope;

%% ---set up scope---
global scopeStatus;

scopeStatus.resolution = 12;        % 12 divisions between min and max in the signal
scopeStatus.timebase = 3;           % time interval for data collection (also sampling frequency can be computed)
scopeStatus.numCaptures = 1;        % was 1000
scopeStatus.startTime = 0e-6;       % start to collect data
scopeStatus.stopTime = 100e-6;      % end collection of data
scopeStatus.channelSetting.a.enable = 1;        % enable channel A    
scopeStatus.channelSetting.a.range = '5v';      %50mV
scopeStatus.channelSetting.b.enable = false;    % disable channel B
scopeStatus.channelSetting.b.range = '20mv';    %1v
scopeStatus.channelSetting.c.enable = 0;        % disable channel C
scopeStatus.channelSetting.c.range = '50mv';    %1v
scopeStatus.channelSetting.d.enable = 0;
scopeStatus.channelSetting.d.range = '100mv';   %1v
scopeStatus.triggerSetting.source = 'Ext';
scopeStatus.triggerSetting.threshold = 0.5;     %originally 1.65
scopeStatus.triggerSetting.edge = 'rising';

%% Takes all the values and sets up the scope with those.
[scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setupScope();


%% ---run the scope---

3
pause(1)
2
pause(1)
1
pause(1)

for i = 1:36
    sprintf('start')
    [dataA(i,:), elapseTime] = runScope1Ch();
    sprintf('end')
end

%% ---image/plot---
tstep = 1/31.25e6;
time = 0:tstep:100e-6;
npt = 10;
figure(1)
imagesc(time * 1540 / 2, [1:1000],logCompression(envelopeDetection(dataA(1:1000,:)), 60))
xlabel('depth (m)')
ylabel('sample number')

%% visualize raw data
 for i = 1:1000
plot(dataA(i,:));
title(['sample ', int2str(i)]);
pause(0.01)
 end

%% Save Data
save('blck_run_B-1', 'dataA', 'time');
