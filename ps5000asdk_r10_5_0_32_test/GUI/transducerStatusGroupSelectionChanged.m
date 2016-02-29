selectedOption = get(get(transducerStatusGroup, 'SelectedObject'), 'Tag')

switch selectedOption
    case 'btnCollect1DScanData'
        %set(ps5000aDeviceObj, 'numCaptures', 2);
        currentStatus(2) = {status.transducerCollecting1DScanData};
        setCurrentStatus;
        while strcmp(currentStatus(2), status.transducerCollecting1DScanData)
            [scanningData, elapseTime] = runScope1Ch();
            plot(sum(scanningData)./size(scanningData,1))
            ylabel('Voltage (V)');
            xlabel('Data Number');
            title('Pulse-Echo Response');
            pause(0.005);
        end
        collectedData = scanningData;
        collected1DData = 1;
    case 'btnCollect2DScanData'
        %set(ps5000aDeviceObj, 'numCaptures', 100);
        currentStatus(2) = {status.transducerCollecting2DScanData};
        setCurrentStatus;
        i = 1;
        while strcmp(currentStatus(2), status.transducerCollecting2DScanData)
            fprintf('Capture Number %d\n', i);
            [dataA, elapseTime] = runScope1Ch();
            size(dataA)
            imagesc(abs(dataA(1:i,:)'), [-0.2 0.2]);
            xlabel('Scan Number');
            ylabel('Sample Number');
            title('Image Construction');
            pause(0.05);
            i = i + 1;
        end
        collectedData = dataA;
        collected1DData = 0;
    case 'btnDontCollectData'
        currentStatus(2) = {status.transducerNotCollectingData};
end

setCurrentStatus;