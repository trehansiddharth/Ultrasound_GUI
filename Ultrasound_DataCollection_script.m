
addpath(genpath(cd));
% Create global variables for all possible statuses the program can have
global status;

status.scopeInitialized = 'Scope has been initialized';
status.scopeUninitialized = 'Scope is currently not initialized';
status.transducerCollecting1DScanData = 'Transducer is collecting 1D scan data...';
status.transducerCollecting2DScanData = 'Transducer is collecting 2D scan data...';
status.transducerNotCollectingData = 'Transducer is currently not collecting data';
status.savingData = 'Saving data...';
status.dataSaved = 'All your data has been saved';
status.dataUnsaved = 'You have unsaved data, pause data collection to be able to save it';

% Global variable for the current status of the program
global currentStatus;

% Initial state of the program
currentStatus = {status.scopeUninitialized, status.transducerNotCollectingData, status.dataSaved};

% Global variable for data we collect so we can save it later
global collectedData;
global collected1DData;
collected1DData = 0;

% Initialize GUI objects
initializeInterface;

% Update UI to reflect current status
setCurrentStatus;