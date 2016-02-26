selectedOption = scopeStatusGroup.SelectedObject.Tag;

switch selectedOption
    case 'btnInitializeScope'
        %enableInitializeScope;
        initializeScope;
        % Setup scope parameters
        global scopeStatus;

        scopeStatus.resolution = 12;                    % 12 divisions between min and max in the signal
        scopeStatus.timebase = 3;                       % time interval for data collection (also sampling frequency can be computed)
        scopeStatus.numCaptures = 2;                  % was 1000
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
        scopeStatus.triggerSetting.threshold = 0.5;     %originally 1.65
        scopeStatus.triggerSetting.edge = 'rising';

        % Takes all the values and sets up the scope with those.
        [scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setupScope();

        % Display
        fprintf('The scope has been initialized and is ready to collect data \n');
        
        transducerStatusGroup.Visible = 'On';
        currentStatus(1) = {status.scopeInitialized};
        setCurrentStatus;
    case 'btnDeinitializeScope'        
        deinitializeScope;
        fprintf('The scope has been deinitialized');
        
        transducerStatusGroup.Visible = 'Off';
        currentStatus(1) = {status.scopeUninitialized};
        setCurrentStatus;
end

setCurrentStatus;
