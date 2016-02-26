function [dataA, dataB, dataC, dataD, time] = runScope(ps5000aDeviceObj, numCaptures)
tic;
[status, timeIndisposedMs] = invoke(ps5000aDeviceObj, 'runBlock', 0);
toc;

tic;
[dataAtemp, dataBtemp, dataCtemp, dataDtemp, numSamples, overflow] = invoke(ps5000aDeviceObj, 'getRapidBlockData', numCaptures, 1, 0);
dataA = dataAtemp';
dataA = dataA / 1000;

dataB = dataBtemp';
dataB = dataB / 1000;

dataC = dataCtemp';
dataC = dataC / 1000;

dataD = dataDtemp';
dataD = dataD / 1000;
toc;

[status] = invoke(ps5000aDeviceObj, 'ps5000aStop');
