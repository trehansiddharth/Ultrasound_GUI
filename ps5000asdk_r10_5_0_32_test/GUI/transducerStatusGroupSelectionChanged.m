selectedOption = get(get(transducerStatusGroup, 'SelectedObject'), 'Tag');

switch selectedOption
    case 'btnCollect1DScanData'
        %set(ps5000aDeviceObj, 'numCaptures', 2);
        currentStatus(2) = {status.transducerCollecting1DScanData};
        setCurrentStatus;
        try
            while strcmp(currentStatus(2), status.transducerCollecting1DScanData)
                % Run data collection
                [scanningData, elapseTime] = runScope1Ch();
                
                % Average the collected samples
                [numSamples, numPoints] = size(scanningData);
                currentData = sum(scanningData)./numSamples;
                
                % Find the echoes
                echoes = find_ultrasound_echoes(currentData')
                echo_locations = echoes(:,1)
                echo_heights = currentData(1,echo_locations)'
                
                % Plot the sample data
                noiseAmplitude = 0; %mean(abs(echo_heights)) / 2;
                noise = normrnd(0, noiseAmplitude, 1, numPoints);
                plot(1:numPoints, (currentData + noise)');
                
                % Plot vertical lines where the echoes are
                hold on
                for loc = echo_locations'
                    plot(loc * [1 1], ylim, 'r--')
                end
                hold off
                
                % Label axes
                ylabel('Voltage (V)');
                xlabel('Data Number');
                title('Pulse-Echo Response');
                ylim([-0.5 0.5])
                pause(0.005);
            end
        catch ex
        end
        collectedData = scanningData;
        collected1DData = 1;
    case 'btnCollect2DScanData'
        %set(ps5000aDeviceObj, 'numCaptures', 100);
        currentStatus(2) = {status.transducerCollecting2DScanData};
        setCurrentStatus;
        try
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
        catch ex
        end
        collectedData = dataA;
        collected1DData = 0;
    case 'btnDontCollectData'
        currentStatus(2) = {status.transducerNotCollectingData};
end

setCurrentStatus;