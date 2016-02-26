function [] = runScope1ChStart()

global ps5000aDeviceObj;

tic;
[status, timeIndisposedMs] = invoke(ps5000aDeviceObj, 'ps5000aRunBlock', 0);
toc;
