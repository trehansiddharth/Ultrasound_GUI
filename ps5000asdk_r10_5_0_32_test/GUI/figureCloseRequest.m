if strcmp(currentStatus(1), status.scopeInitialized)
    errordlg('You must deinitialize the scope before leaving this data collection module.', 'Scope not deinitialized');
else
    delete(f);
end