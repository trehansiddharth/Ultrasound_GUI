% This script is intended to collect data and display it in real time.

%% Clear existing workspace
clear all;
close all;
clc;

%% Initialize the scope (line by line)
% initializeScope;
% deinitializeScope;

%% Setup scope parameters
global scopeStatus;

scopeStatus.resolution = 12;                    % 12 divisions between min and max in the signal
scopeStatus.timebase = 3;                       % time interval for data collection (also sampling frequency can be computed)
scopeStatus.numCaptures = 1;                    % was 1000
scopeStatus.startTime = 0e-6;                   % start to collect data
scopeStatus.stopTime = 200e-6;                  % end collection of data
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

%% Data collection and display
3
pause(1)
2
pause(1)
1
pause(1)

for i = 1:36                            % Change this to length of travel (mm)
    sprintf('start')
    [dataA(i,:), elapseTime] = runScope1Ch();
    sprintf('end')
    imagesc(abs(dataA(1:i,:)'), [-0.2 0.2])
    xlabel('Scan Number')
    ylabel('Sample Number')
    title(' Image Construction')
    pause(0.05)
end

