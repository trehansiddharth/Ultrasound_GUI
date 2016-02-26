function [time, numSamples, buffers] = setupScope(varargin)

global ps5000aDeviceObj;
global scopeStatus;

%% Check to see if there are enugh arguments
if (mod(nargin, 2) == 0)
    for m = 1:2:nargin
        scopeStatus = setMultiLevelField(scopeStatus, varargin{m}, varargin{m+1});
    end
else
    error('Number of arguments must be even');
end

fprintf('Scope status updated...\n');

% resolution = 8, 12, 14, 15, 16
%
% timebase = Formula depends on the resolution setting. Refer to the manual.
%            For 12-bit,
%            1 - 3 -> 2^(timebase-1)/5e8
%            4 - 2^32-1 -> (timebase-3) / 62.5e6
%
% channelSetting = Needs to be a cell, not a vector.
%                  {chAEnable, chA_AC_DC, chARange, chBEnable, chB_AC_DC, chBRange. chCEnable, chC_AC_DC, chCRange. chDEnable, chD_AC_DC, chDRange}
%                  {1, 'ac', '10mv', 1, 'dc', '50mv', 1, 'dc', '100mv', 0, 'dc', '1v'}
%                  ch#Enable = 0 or 1
%                  ch#AC_DC = 'ac' or 'dc'
%                  ch#Range = (string) '10mv', '20mv', '50mv', '100mv', '200mv',
%                             '500mv', '1v', '2v', '5v,' '10v', '20v', '50v', 'max'
%
% triggerSetting = Needs to be a cell, not a vector
%                  {source, threshold, direction}
%                  source = trigger source (string) 'A', 'B', 'C', 'D', 'Ext'
%                  threshold = trigger thrshold value (V)
%                  direction = tirgger direction (string) 'rising', 'falling'
%
% numCaptures = Number of triggers to capture
%
% startTime = Capture starting time (s)
%
% stopTime = Capture stop time (s)

% load enumeration
PicoEnumeration

%% Set up Channels

channelVector = ['a', 'b', 'c', 'd'];
for m = 1:4
    rangeStr = scopeStatus.channelSetting.(channelVector(m)).range;
    if (strcmp(rangeStr, '10m'))
        range = range_10mv;
    elseif (strcmp(rangeStr, '20mv'))
        range = range_20mv;
    elseif (strcmp(rangeStr, '50mv'))
        range = range_50mv;
    elseif (strcmp(rangeStr, '100mv'))
        range = range_100mv;
    elseif (strcmp(rangeStr, '200mv'))
        range = range_200mv;
    elseif (strcmp(rangeStr, '500mv'))
        range = range_500mv;
    elseif (strcmp(rangeStr, '1v'))
        range = range_1v;
    elseif (strcmp(rangeStr, '2v'))
        range = range_2v;
    elseif (strcmp(rangeStr, '5v'))
        range = range_5v;
    elseif (strcmp(rangeStr, '10v'))
        range = range_10v;
    elseif (strcmp(rangeStr, '20v'))
        range = range_20v;
    elseif (strcmp(rangeStr, '50v'))
        range = range_50v;
    elseif (strcmp(rangeStr, 'max'))
        range = range_max;
    else
        error('Invalid channel range. Allowed ranges: 10mv, 20mv, 50mv, 100mv, 200mv, 500mv, 1v, 2v, 5v, 10v, 20v, 50v, max');
    end
    chRange(m) = range;
end

% [status] = invoke(ps5000aDeviceObj, 'ps5000aSetChannel', channel, enabled, type, range, analogueOffset);
[status] = invoke(ps5000aDeviceObj, 'ps5000aSetChannel', channel_a, scopeStatus.channelSetting.a.enable, coupling_ac, chRange(1), 0);
[status] = invoke(ps5000aDeviceObj, 'ps5000aSetChannel', channel_b, scopeStatus.channelSetting.b.enable, coupling_dc, chRange(2), 0);
[status] = invoke(ps5000aDeviceObj, 'ps5000aSetChannel', channel_c, scopeStatus.channelSetting.c.enable, coupling_dc, chRange(3), 0);
[status] = invoke(ps5000aDeviceObj, 'ps5000aSetChannel', channel_d, scopeStatus.channelSetting.d.enable, coupling_ac, chRange(4), 0);

%% Set Resolution
% [status] = invoke(ps5000aDeviceObj, 'ps5000aSetDeviceResolution', resolution);
[status] = invoke(ps5000aDeviceObj, 'ps5000aSetDeviceResolution', scopeStatus.resolution);

%% Set timebase

% Essentially the sampling period. It provides the scope with the time base
% and the scope returns a sampling period.

% [status, timeIntNs, maxSamples] = invoke(ps5000aDeviceObj, 'ps5000aGetTimebase', timebase, segmentIndex);
[status, timeIntNs, maxSamples] = invoke(ps5000aDeviceObj, 'ps5000aGetTimebase', scopeStatus.timebase, 0);
if (status == 0)
	set(ps5000aDeviceObj, 'timebase', scopeStatus.timebase);
else
    error('Requested time base: %d resulted in error\n', scopeStatus.timebase);
end
timeInt = double(timeIntNs) * 1e-9; % time between samples in second


%% Set trigger

triggerSourceStr = scopeStatus.triggerSetting.source;
if (strcmp(triggerSourceStr, 'A'))
    triggerSource = channel_a;
elseif (strcmp(triggerSourceStr, 'B'))
    triggerSource = channel_b;
elseif (strcmp(triggerSourceStr, 'C'))
    triggerSource = channel_c;
elseif (strcmp(triggerSourceStr, 'D'))
    triggerSource = channel_d;
elseif (strcmp(triggerSourceStr, 'Ext'))
    triggerSource = channel_ext;
else
    error('Invalid trigger source. Allowed values: A, B, C, D, Ext');
end

triggerThreshold = scopeStatus.triggerSetting.threshold; % (V)


if (strcmp(scopeStatus.triggerSetting.edge, 'rising'))
    triggerDirection = thresh_rising;
elseif (strcmp(scopeStatus.triggerSetting.edge, 'falling'))
    triggerDirection = thresh_falling;
else
    error('Invalid trigger direction. Allowed values: rising, falling');
end

% [status] = invoke(ps5000aDeviceObj, 'setSimpleTrigger', source, threshold_mV, direction, delay, autoTrigger_ms);
[status] = invoke(ps5000aDeviceObj, 'setSimpleTrigger', triggerSource, triggerThreshold * 1e3, triggerDirection, floor(scopeStatus.startTime/timeInt), 0);

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

scopeStatus

toc;
