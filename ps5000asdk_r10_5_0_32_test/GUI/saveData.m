[filename, pathname] = uiputfile('*.mat', 'Save scan data...');
if filename
    save(strcat(pathname, filename), 'collectedData');
end