
%% Check to see if it exists.

if (~exist('ps5000aDeviceObj'))
    enableInitializeScope = 1;
elseif (strcmp(ps5000aDeviceObj.Status, 'closed'))
    enableInitializeScope = 1;
else
    enableInitializeScope = 0;
end

%% If not..
if (enableInitializeScope)

    % Load configuration
    PS5000aConfig;

    % Create a device object.
    global ps5000aDeviceObj;
    ps5000aDeviceObj = icdevice('picotech_ps5000a_generic.mdd');

    % Connect device object to hardware
    connect(ps5000aDeviceObj);

    disp('Scope initialized');
else
	disp('Scope Already initialized');
end
