if strcmp(currentStatus(2), status.transducerNotCollectingData)
    [filename, pathname] = uiputfile('*.mat', 'Save scan data...');
    if filename
        if collected1DData
            [scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setNumCaptures(100);
            [collectedData, elapseTime] = runScope1Ch();
            [scopeStatus.time, scopeStatus.numSamples, scopeStatus.buffers] = setNumCaptures(2);
        end
        save(strcat(pathname, filename), 'collectedData');
    end
else
    errordlg('You must pause data collection before saving any data.', 'Cannot save');
end