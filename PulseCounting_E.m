%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pulse counting:  
% This script counts the overall RF pulses indipendently by the analysis
% that have been conducted.
% 
% Different files can be loaded:
% - "Prod_<date>.mat" (mkx folder > matfiles)
% - "Data_<date>.mat" still to implemented .........
%
% Please note that this makes no difference if there was beam or not
%
% REV. 1. by Eugenio Senes
%
% Last modified 23.01.2016 by Eugenio Senes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% Read setup file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clearvars; clc;
%include folder to path
[dirpath,~,~]=fileparts(mfilename('fullpath'));
addpath(genpath(dirpath))
%read setup
[datapath_read, ~, ~, ~, ~] = readSetup();
%%%%%%%%%%%%%%%%%%%%%%%%% End of setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Initialization %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

startDate = '20161205';
endDate = '20161210';
startTime = '09:30:00';
endTime = '08:00:00';

%%%%%%%%%%%%%%%%%%%%%%%% End of Initialization %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%check the date and times input
if datenum([startDate startTime],'YYYYmmddHH:MM:SS') > datenum([endDate endTime],'YYYYmmddHH:MM:SS')
    error('End is preceding the start !')
end

%build file list
[filenames_full] = files2Analyse(startDate, endDate, datapath_read, 1);
filename = get_dates(filenames_full);

    %% Init variables
    %init some counters for the content of the file
    B0_ctr = 0;
    L0_ctr = 0; 
    LL_ctr = 0; %counts where are present B0,L1,L2
    FF_ctr = 0; %counts where is the B0, but not one of L1 or L2
    % Init for pulse difference counter
    pulseDelta = zeros(1,length(filename));

%%
disp('Start processing files:')

for j = 1:1%length(filename) %loop over dates
    tic
    disp(['Loading file ' num2str(j) ' on ' num2str(length(filename)) ])
    %% Load the files
    load([datapath_read filesep 'Prod_' filename{j} '.mat']);

    %% Select just events in range
    field_names_out = eventSelection( startDate, endDate, startTime, endTime, filename, j, field_names );

    %% Counting section
    for i = 1:length(field_names_out) %loop over events in a file

        switch field_names_out{i}(end-1:end)
            case 'B0' %bd detected
                B0_ctr = B0_ctr +1;
                %NUMBER OF PULSES BETWEEN BDs
                pulseDelta(j) = pulseDelta(j) + tdms_struct.(field_names_out{i}).Props.Pulse_Delta;

                    disp(field_names_out{i})
                    disp(num2str(tdms_struct.(field_names_out{i}).Props.Pulse_Delta))

            case 'L1'
                % do nothing
            case 'L2'    
                % do nothing
            case 'L0' %no BD, not interesting unless for backup pulses
                L0_ctr = L0_ctr +1;
                %sum the pulse delay
                pulseDelta(j) = pulseDelta(j) + tdms_struct.(field_names_out{i}).Props.Pulse_Delta;

                if tdms_struct.(field_names_out{i}).Props.Pulse_Delta > 1505
                    warning(field_names_out{i})
                    warning(['pulse count = ' num2str( tdms_struct.(field_names_out{i}).Props.Pulse_Delta)]) 
                end
                
                    disp(field_names_out{i})
                    disp(num2str(tdms_struct.(field_names_out{i}).Props.Pulse_Delta))
                
        end
        disp(num2str(pulseDelta))

    end
    disp(' ')
    disp(['Pulse count = ' num2str(pulseDelta(j))])
    disp(' ')
end
disp(' ')
disp(['Pulse count = ' num2str(sum(pulseDelta))])

47888176-23296404-23290605
