% userInput = input('Really want to deinitialize? y/n\n', 's');
userInput = 'y';
if strcmp(userInput, 'y')
    if (~exist('ps5000aDeviceObj'))
        enableDeinitializeScope = 0;
    elseif (strcmp(ps5000aDeviceObj.Status, 'open'))
        enableDeinitializeScope = 1;
    else
        enableDeinitializeScope = 0;
    end

    if (enableDeinitializeScope)
        disconnect(ps5000aDeviceObj);

        disp('Scope deinitialized');
    else
    	disp('Scope Already deinitialized');
    end
    
elseif strcmp(userInput, 'n')
else
    disp('Invalid input');
end
