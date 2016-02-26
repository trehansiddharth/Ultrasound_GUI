function [dataA, dataB, dataC, dataD] = runScope(ps5000aDeviceObj, numCaptures, buffers)
tic;
[status, timeIndisposedMs] = invoke(ps5000aDeviceObj, 'runBlock', 0);
toc;

tic;
[dataAtemp, dataBtemp, dataCtemp, dataDtemp, numSamples, overflow] = invoke(ps5000aDeviceObj, 'getRapidBlockData', numCaptures, 1, 0);
dataA = dataAtemp' / 1000;
dataB = dataBtemp' / 1000;
dataC = dataCtemp' / 1000;
dataD = dataDtemp' / 1000;
toc;

[status] = invoke(ps5000aDeviceObj, 'ps5000aStop');
