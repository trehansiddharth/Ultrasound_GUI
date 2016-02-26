function [data, elapseTime] = runScope1Ch()
% [data] = runScope1Ch()

%% Initialize Global Variables
global ps5000aDeviceObj;
global scopeStatus;


starttime = clock;
manualPolling = false;
if (manualPolling==false)
    [status, timeIndisposedMs] = invoke(ps5000aDeviceObj, 'runBlock', 0);
else
    [status, timeIndisposedMs] = invoke(ps5000aDeviceObj, 'ps5000aRunBlock', 0);
    ready = 0;
    while ready == 0
        [status, ready] = invoke(ps5000aDeviceObj, 'ps5000aIsReady', ready);
    end
end

[status, numSamples, overflow] = invoke(ps5000aDeviceObj, 'ps5000aGetValuesBulk', scopeStatus.numSamples, 0, scopeStatus.numCaptures-1, 1, 0);
dataCell = get(scopeStatus.buffers, 'Value');

%% Storage of Incoming Voltages
if (scopeStatus.numCaptures == 1)
    data = double(dataCell)' / 2^15;
else
    for iCaptures=1:scopeStatus.numCaptures
        data(iCaptures, :) = double(dataCell{iCaptures})' / 2^15;
%         plot(data(iCaptures,:),'r')
%         pause(0.01)
%         clf
    end
end

%% Update
[status] = invoke(ps5000aDeviceObj, 'ps5000aStop');
stoptime = clock;
elapseTime = etime(stoptime, starttime);