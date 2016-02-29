% [~, timeIntNs, maxSamples] = invoke(ps5000aDeviceObj, 'ps5000aGetTimebase', timebase, segmentIndex);
[currentScopeStatus, timeIntNs, maxSamples] = invoke(ps5000aDeviceObj, 'ps5000aGetTimebase', scopeStatus.timebase, 0);
if (currentScopeStatus == 0)
	set(ps5000aDeviceObj, 'timebase', scopeStatus.timebase);
else
    error('Requested time base: %d resulted in error\n', scopeStatus.timebase);
end
timeInt = double(timeIntNs) * 1e-9; % time between samples in second

% segments
numSegments = 2^ceil(log(scopeStatus.numCaptures)/log(2));
[~, maxSegments] = invoke(ps5000aDeviceObj, 'ps5000aGetMaxSegments');
if (maxSegments < numSegments)
    error('Requested number of segments (%d) is greater than available number of segments (%d)\n', numSegments, maxSegments);
else
    [s, nMaxSamples] = invoke(ps5000aDeviceObj, 'ps5000aMemorySegments', numSegments);
end

% Captures
[~] = invoke(ps5000aDeviceObj, 'ps5000aSetNoOfCaptures', scopeStatus.numCaptures);

% Samples
numPreSamples = 0;
numPostSamples = round((scopeStatus.stopTime - scopeStatus.startTime) / timeInt);
numSamples = numPreSamples + numPostSamples;
numEntireSamples = scopeStatus.numCaptures * numSamples;
if (numSamples == 0)
    error('Requested number of samples (%d) is 0\n', numSamples);
elseif (numSamples > nMaxSamples)
    error('Requested number of samples (%d) is greater than available number of samples (%d)\n', numSamples, nMaxSamples);    
else
    set(ps5000aDeviceObj, 'numPreTriggerSamples', numPreSamples);
    set(ps5000aDeviceObj, 'numPostTriggerSamples', numPostSamples);
end

%% Clear buffers and data
clear buffers;
clear data;
tic;
for iCaptures=1:scopeStatus.numCaptures
    if (mod(iCaptures, 1000) == 0)
        fprintf('Status: %0.1f %% done\n', iCaptures/scopeStatus.numCaptures * 100);
    end
    buffers(iCaptures) = libpointer('int16Ptr', zeros(numSamples, 1));
    status = invoke(ps5000aDeviceObj, 'ps5000aSetDataBuffer', 0, buffers(iCaptures), numSamples, iCaptures-1, 0);
end