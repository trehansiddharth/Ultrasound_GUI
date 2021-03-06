function [ awg_buffer, picoscope_generated ] = awg2array( awg_filename )
%AWG2ARRAY Converts AWG file to an array of values.
%   Detailed explanation goes here

    fprintf('Loading AWG file %s ...\n', awg_filename);
    
    % Load file
    awg_fid = fopen(awg_filename, 'r');
    
    % Empty buffer
    awg_buffer = [];
    
    % Variable to indicate if file has been generated by PicoScope
    picoscope_generated = PicoConstants.FALSE;
    
    if(awg_fid == -1)
       
        error('File not opened - please ensure the file is on the MATLAB path/not in use and try again.');
        
    else
        
        disp('File opened successfully.')
        
        % Check if file is CSV
        if(strfind(awg_filename, '.csv') ~= [])
            
            % Prompt user to indicate if file has been generated by PicoScope 6
            fprintf('Has file %s been generated using PicoScope 6? ', awg_filename);
            
            % Variable to indicate if AWG file has been generated by
            % PicoScope (outputs in range -1.0 to +1.0)
            is_picoscope_generated_awg_file = input('[Y/N]: ', 's');
            
            if(strcmpi(is_picoscope_generated_awg_file, 'Y') == PicoConstants.TRUE)
                
                picoscope_generated = PicoConstants.TRUE;
                
            end
            
            awg_buffer = csvread(awg_filename);
            
        else

            [awg_buffer, waveform_size] = fscanf(awg_fid, '%f');

        end
         
    end 
    
    % Close file and check for error
    st = fclose(awg_fid);

    if(st == -1)

        error('awg2array: Unable to close file %s\n', awg_filename);
    else

        fprintf('File %s successfully closed.\n', awg_filename);

    end
 
end

