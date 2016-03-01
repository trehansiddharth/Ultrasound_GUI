function [time, numSamples, buffers] = setNumCaptures(numCaptures)
global ps5000aDeviceObj;
global scopeStatus;
scopeStatus.numCaptures = numCaptures;
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

%% Set up rapid block parameters

% segments
numSegments = 2^ceil(log(scopeStatus.numCaptures)/log(2));
[status, maxSegments] = invoke(ps5000aDeviceObj, 'ps5000aGetMaxSegments');
if (maxSegments < numSegments)
    error('Requested number of segments (%d) is greater than available number of segments (%d)\n', numSegments, maxSegments);
else
    [status, nMaxSamples] = invoke(ps5000aDeviceObj, 'ps5000aMemorySegments', numSegments);
end

% Captures
[status] = invoke(ps5000aDeviceObj, 'ps5000aSetNoOfCaptures', scopeStatus.numCaptures);

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

time = (floor(scopeStatus.startTime/double(timeInt))+[0:1:(double(numSamples)-1)]) * double(timeInt);

%% print
fprintf('***********************************************\n');
                                                        
fprintf('Sampling frequency = %0.2f MHz\n', 1/timeInt/1e6);
if (timeInt > 1e-6)
    fprintf('Sampling Period = %0.2f us\n', timeInt/1e-6);
elseif (timeInt > 1e-9)
    fprintf('Sampling Period = %0.2f ns\n', timeInt/1e-9);
end
fprintf('Available number of samples = %d pts\n', maxSamples);
fprintf('Available number of samples after segmentation = %d pts\n', nMaxSamples);
fprintf('Available number of segments = %d segments\n', maxSegments);
fprintf('\n');
fprintf('Number of specified segments = %d segments\n', numSegments);
fprintf('Number of specified captures = %d captures\n', scopeStatus.numCaptures);
fprintf('\n');
fprintf('Number of pre-trigger samples = %d pts\n', numPreSamples);
fprintf('Number of post-trigger samples = %d pts\n', numPostSamples);
fprintf('Number of total samples = %d pts\n', numSamples);
fprintf('Number of samples for all captures = %d pts\n', numEntireSamples);
fprintf('***********************************************\n');

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
end