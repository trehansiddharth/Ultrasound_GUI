function [data] = runScope1ChReady()

global ps5000aDeviceObj;

tic;
ready = 0;
while ready == 0
    [status, ready] = invoke(ps5000aDeviceObj, 'ps5000aIsReady', ready);
end
toc;
