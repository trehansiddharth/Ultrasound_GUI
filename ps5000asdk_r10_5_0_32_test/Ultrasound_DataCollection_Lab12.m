% This script is intended to collect data and display it in real time.

%% Clear existing workspace
clear all;
close all;
clc;

%% Initialize the scope (line by line)

prompt = 'Do you want to initialize the scope? Y/N [Y]: ';
wantToInitializeScope = upper(input(prompt,'s')) == 'Y';

while ~wantToInitializeScope
    fprintf('The scope must be initialized prior to data collection \n');
    prompt = 'Do you want to initialize now? Y/N [Y]: ';
    wantToInitializeScope = input(prompt,'s') == 'Y';
end

initializeScope;

% Setup scope parameters
global scopeStatus;

scopeStatus.resolution = 12;                    % 12 divisions between min and max in the signal
scopeStatus.timebase = 3;                       % time interval for data collection (also sampling frequency can be computed)
scopeStatus.numCaptures = 2;                   % was 1000
scopeStatus.startTime = 0e-6;                   % start to collect data
scopeStatus.stopTime = 500e-6;                  % end collection of data
scopeStatus.channelSetting.a.enable = 1;        % enable channel A
scopeStatus.channelSetting.a.range = '500mv';      %50mV
scopeStatus.channelSetting.b.enable = false;    % disable channel B
scopeStatus.channelSetting.b.range = '20mv';    %1v
scopeStatus.channelSetting.c.enable = false;        % disable channel C
scopeStatus.channelSetting.c.range = '50mv';    %1v
scopeStatus.channelSetting.d.enable = false;
scopeStatus.channelSetting.d.range = '100mv';   %1v
scopeStatus.triggerSetting.source = 'A';
scopeStatus.triggerSetting.threshold = 1;       %originally 1.65
scopeStatus.triggerSetting.edge = 'rising';

% Takes all the values and sets up the scope with those.
[scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setupScope();

% Display
fprintf('The scope has been initialized and is ready to collect data \n');

%% Data collection and display

% Check for readiness
prompt = 'Are you ready to collect data? Y/N [Y]: ';
str = input(prompt,'s'); 

if strcmp(str,'Y') == 1
    clc;
else
    prompt = 'Please prepare the phantom and probe and then press Y.';
    str = input(prompt,'s');
    clc;
end

% Check for alignment with single or multiple interface
d = dialog('Position', [300 300 250 150], 'Name', 'Scan Phantom for Start Location');
txt = uicontrol('Parent', d,...
    'Style', 'text',...
    'Position', [20 80 210 40],...
    'String', 'Please use the probe to scan the phantom and find a suitable location for a single or multiple interface.');
btn = uicontrol('Parent', d,...
    'Position', [89 20 70 25],...
    'String', 'Done',....
    'Callback', 'delete(gcf), inScanningPhase = 0');

inScanningPhase = 1;
while inScanningPhase
    [scanningData, elapseTime] = runScope1Ch();
    plot(sum(scanningData)./size(scanningData,1))
    ylabel('Voltage (V)');
    xlabel('Data Number');
    title('Pulse-Echo Response')
    pause(0.005)
end



prompt = 'Are you ready to collect data? Y/N [Y]: ';
str = input(prompt,'s');
count = 0;

% Setup scope parameter

scopeStatus.resolution = 12;                    % 12 divisions between min and max in the signal
scopeStatus.timebase = 3;                       % time interval for data collection (also sampling frequency can be computed)
scopeStatus.numCaptures = 100;                   % was 1000
scopeStatus.startTime = 0e-6;                   % start to collect data
scopeStatus.stopTime = 500e-6;                  % end collection of data
scopeStatus.channelSetting.a.enable = 1;        % enable channel A
scopeStatus.channelSetting.a.range = '500mv';      %50mV
scopeStatus.channelSetting.b.enable = false;    % disable channel B
scopeStatus.channelSetting.b.range = '20mv';    %1v
scopeStatus.channelSetting.c.enable = 0;        % disable channel C
scopeStatus.channelSetting.c.range = '50mv';    %1v
scopeStatus.channelSetting.d.enable = 0;
scopeStatus.channelSetting.d.range = '100mv';   %1v
scopeStatus.triggerSetting.source = 'A';
scopeStatus.triggerSetting.threshold = 1;       %originally 1.65
scopeStatus.triggerSetting.edge = 'rising';

% Takes all the values and sets up the scope with those.
[scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setupScope();

clc;

% Data Collection
if strcmp(str,'Y') == 1
    count = count + 1;
    3
    pause(1)
    2
    pause(1)
    1
    pause(1)
    [dataA, elapseTime] = runScope1Ch();
    fprintf('Data successfully collected \n');
    plot(sum(dataA)./size(dataA,1))
    ylabel('Voltage (V)');
    xlabel('Data Number');
    title('Pulse-Echo Response')
    filename = ['Single_Multiple_Interface_Data_' num2str(count) '.mat'];
    save(filename, 'dataA')
else
    fprintf('No data collected \n');
    prompt = 'Please align the probe with a single interface or multiple interfaces and then press Y.';
    str = input(prompt,'s');
    if strcmp(str,'Y') == 1
        count = count + 1;
        3
        pause(1)
        2
        pause(1)
        1
        pause(1)
        [dataA, elapseTime] = runScope1Ch();
        fprintf('Data successfully collected \n');
        
        plot(sum(dataA)./size(dataA,1))
        ylabel('Voltage (V)');
        xlabel('Data Number')
        title('Pulse-Echo Response')
        filename = ['Single_Multiple_Interface_Data_' num2str(count) '.mat'];
        save(filename, 'dataA');
    end
end

%% Deinitialize the scope

prompt = 'Deinitialize the scope? Y/N [Y]: ';
str = input(prompt,'s');

if strcmp(str,'Y') == 1
    deinitializeScope;
    fprintf('The scope has been deinitialized')
else
    prompt = 'Do you want to collect another data set? Y/N [Y]: ';
    str1 = input(prompt,'s');
    while strcmp(str1,'Y') == 1
        count = count + 1;
        3
        pause(1)
        2
        pause(1)
        1
        pause(1)
        [dataA, elapseTime] = runScope1Ch();
        fprintf('Data successfully collected \n');
        plot(sum(dataA)./size(dataA,1))
        ylabel('Voltage (V)');
        xlabel('Data Number')
        title('Pulse-Echo Response')
        filename = ['Single_Multiple_Interface_Data_' num2str(count) '.mat'];
        save(filename, 'dataA');
        
        prompt = 'Do you want to collect another data set? Y/N [Y]: ';
        str1 = input(prompt,'s');
    end
    deinitializeScope;
    fprintf('The scope has been deinitialized')
end





