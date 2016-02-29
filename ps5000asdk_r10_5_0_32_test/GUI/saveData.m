if strcmp(currentStatus(2), status.transducerNotCollectingData)
    [filename, pathname] = uiputfile('*.mat', 'Save scan data...');
    if filename
        if collected1DData
            scopeStatus.numCaptures = 100;
            setNumCaptures;
            pause(2);
            runScope1Ch()
            pause(0.05);
            scopeStatus.numCaptures = 2;
            setNumCaptures;
        else
            save(strcat(pathname, filename), 'collectedData');
        end
    end
else
    errordlg('You must pause data collection before saving any data.', 'Cannot save');
end