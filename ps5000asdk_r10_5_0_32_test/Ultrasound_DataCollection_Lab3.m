%function [] = Ultrasound_DataCollection_Lab3_sid ()
% This function is intended to collect data and display it in real time.

%% Clear existing workspace

clear all;
close all;
clc;

%% Create a clean-up object

cleanupObject = onCleanup(@() deinitializeScope);

%% Initialize the scope (line by line)

prompt = 'Do you want to initialize the scope? Y/N [Y]: ';
wantToInitializeScope = upper(input(prompt,'s')) == 'Y';

while ~wantToInitializeScope
    fprintf('The scope must be initialized prior to data collection \n');
    prompt = 'Do you want to initialize now? Y/N [Y]: ';
    wantToInitializeScope = input(prompt,'s') == 'Y';
end

% At this point it is guaranteed that the user wants to initialize the
% scope, so we can continue
initializeScope;
% Setup scope parameters
global scopeStatus;

scopeStatus.resolution = 12;                    % 12 divisions between min and max in the signal
scopeStatus.timebase = 3;                       % time interval for data collection (also sampling frequency can be computed)
scopeStatus.numCaptures = 1;                    % was 1000
scopeStatus.startTime = 0e-6;                   % start to collect data
scopeStatus.stopTime = 200e-6;                  % end collection of data
scopeStatus.channelSetting.a.enable = 1;        % enable channel A
scopeStatus.channelSetting.a.range = '5v';      %50mV
scopeStatus.channelSetting.b.enable = false;    % disable channel B
scopeStatus.channelSetting.b.range = '20mv';    %1v
scopeStatus.channelSetting.c.enable = 0;        % disable channel C
scopeStatus.channelSetting.c.range = '50mv';    %1v
scopeStatus.channelSetting.d.enable = 0;
scopeStatus.channelSetting.d.range = '100mv';   %1v
scopeStatus.triggerSetting.source = 'Ext';
scopeStatus.triggerSetting.threshold = 0.5;     %originally 1.65
scopeStatus.triggerSetting.edge = 'rising';

% Setup transducer parameters
global transducerStatus;

transducerStatus.length = 36;

prompt = 'What is the total length, in mm, of what you want to scan? ';
transducerStatus.phantomLength = input(prompt);

% Setup data collection parameters
global dataCollectionStatus;

dataCollectionStatus.numberOfSamples = 0;
dataCollectionStatus.sampleData = {};

% Takes all the values and sets up the scope with those.
[scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setupScope();

% Display
fprintf('The scope has been initialized and is ready to collect data \n');

%% Data collection and display

% Check for readiness
prompt = 'Are you ready to collect data? Y/N [Y]: ';
readyToCollectData = upper(input(prompt,'s')) == 'Y';

while ~readyToCollectData
    prompt = 'Please prepare the phantom and probe and then press Y.';
    readyToCollectData = upper(input(prompt,'s')) == 'Y';
    clc;
end

% At this point the user is ready to collect data
while readyToCollectData
    clc;
    
    scanNumber = 1;
    i = 1;
    while i < transducerStatus.phantomLength
        if scanNumber == 1
            prompt = 'Place the transducer in the start position and press any key to continue...';
        else
            prompt = 'You reached the end of the transducer. Place the transducer in the starting position again to collect the next stretch of data.';
        end
        fprintf(prompt);
        pause;
        fprintf('\n3... ');
        pause(1)
        fprintf('2... ');
        pause(1)
        fprintf('1... ');
        pause(1)
        clc
        fprintf('Move the probe in a smooth and slow manner \n');
        fprintf('Data will be collected every 1 mm \n');
        while (i <= scanNumber * transducerStatus.length) && (i <= transducerStatus.phantomLength);
            fprintf('Capture Number %d', i);
            [dataA(i,:), elapseTime] = runScope1Ch();
            imagesc(abs(dataA(1:i,:)'), [-0.2 0.2]);
            xlabel('Scan Number');
            ylabel('Sample Number');
            title('Image Construction');
            pause(0.05);
            i = i + 1;
        end
        scanNumber = scanNumber + 1;
    end
    dataCollectionStatus.sampleData{dataCollectionStatus.numberOfSamples + 1} = dataA;
    dataCollectionStatus.numberOfSamples = dataCollectionStatus.numberOfSamples + 1;
    
    % Check if the user wants to collect another data set
    prompt = 'Done with current data set. Do you want to collect another data set? Y/N [Y]: ';
    readyToCollectData = upper(input(prompt,'s')) == 'Y';
end

%% Save data and deinitialize the scope

prompt = 'What would you like to save the collected data as? [*.mat]';
filename = input(prompt, 's');
save(filename, 'dataCollectionStatus');

deinitializeScope;
fprintf('The scope has been deinitialized');
%end
