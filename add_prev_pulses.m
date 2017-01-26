%% ADD PREVIOUS PULSES
close all; clearvars; clc;

%fpath = 'W:\Backup_SSD\swap_out\exp\';
fpath = '/Users/esenes/swap_out/exp/';
fname = 'Exp_analized_AntiLoaded6_5MW_';
fnum = {'1','2','3','4'};%,'5','6','7','8','9','10'};%,'11_1','12','13'};
fext = '.mat';

for k=1:length(fnum) %loop over files
    fullName = [fpath fname fnum{k} fext];
    disp(['Processing file: ' fullName])
    
    %build list of variables
    matObj = matfile(fullName);
    info = whos(matObj);
    [~, varlen] = size('info.name');
    varlst = {};
    for l=1:varlen
        varlst = [varlst info(l).name];
    end

    %loading
    load(fullName)

    events = fieldnames(BD_struct);
    
    for m=1:length(events)
        event_L1 = [events{m}(1:end-2) 'L1'];
        event_L2 = [events{m}(1:end-2) 'L2'];
        if isfield(data_struct,event_L1)
            BD_struct.(event_L1) = data_struct.(event_L1);
        end
        if isfield(data_struct,event_L2)
            BD_struct.(event_L2) = data_struct.(event_L2);
        end        
    end
    
    %save
    fileattrib(fullName,'+w','a');
    save(fullName,varlst{:})
    fileattrib(fullName,'-w','a');
   
end