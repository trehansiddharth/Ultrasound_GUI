function [data] = runScope1ChData()

global ps5000aDeviceObj;
global scopeStatus;

tic;
[status, numSamples, overflow] = invoke(ps5000aDeviceObj, 'ps5000aGetValuesBulk', scopeStatus.numSamples, 0, scopeStatus.numCaptures-1, 1, 0);
dataCell = get(scopeStatus.buffers, 'Value');
toc;

tic;
for iCaptures=1:scopeStatus.numCaptures
    data(iCaptures, :) = double(dataCell{iCaptures})' / 2^15;
end
toc;

[status] = invoke(ps5000aDeviceObj, 'ps5000aStop');
