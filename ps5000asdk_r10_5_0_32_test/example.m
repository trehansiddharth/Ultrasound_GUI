clear all;
close all;
clc;

initializeScope;
% deinitializeScope;

global scopeStatus;

scopeStatus.resolution = 12;
scopeStatus.timebase = 4;
scopeStatus.numCaptures = 10;
scopeStatus.startTime = 0e-6;
scopeStatus.stopTime = 100e-6;
scopeStatus.channelSetting.a.enable = 1;
scopeStatus.channelSetting.a.range = '50mv';
scopeStatus.channelSetting.b.enable = false;
scopeStatus.channelSetting.b.range = '1v';
scopeStatus.channelSetting.c.enable = 0;
scopeStatus.channelSetting.c.range = '1v';
scopeStatus.channelSetting.d.enable = 0;
scopeStatus.channelSetting.d.range = '1v';
scopeStatus.triggerSetting.source = 'Ext';
scopeStatus.triggerSetting.threshold = 1.65;
scopeStatus.triggerSetting.edge = 'rising';

[scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setupScope();

[data, elapseTime] = runScope1Ch();
