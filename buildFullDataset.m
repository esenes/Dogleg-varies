%% BUILD FULL DATASET
close all; clearvars; clc;
% generate a full dataset of the funs, excluding the data_struct, but using
% the BDs only into the BDs struct

fpath = '/Users/esenes/swap_out/exp/';
fname = 'Exp_analized_AntiLoaded6_5MW_';
%fnum = {'1','2_1','2_2','3','4','5','6','7','8','9','10','11'};
fnum = {'1','2','3','4'};%,'5','6','7','8','9','10','11','12'};
%fnum = {'1','2_1','2_2','3','4','5','6','7','8','9','10','11','12','13'};
%fnum = {'1_1','1_2','2','3','4_1','4_2','4_3','5','6','7'};
%fnum = {'1','2','4','6','7','8','9','11_1','12','13','14','15','16'};

fext = '.mat';

edge_delay_full = [];
corr_delay_full = [];
corr_fail_full = [];
BDs_ts_full = [];
BD_struct_full = struct;

for k=1:length(fnum) %loop over files
    fullName = [fpath fname fnum{k} fext];
    disp(['Processing file: ' fullName])
    
    %load
    load(fullName, 'edge_delay','corr_delay','corr_fail','BDs_ts',...
                    'BDs_ts_new','BD_struct');
    %in case that BDs_ts_new exists, use that one and forget BDs_ts            
    disp(['BDs_ts length: ' num2str(length(BDs_ts))])
    if exist('BDs_ts_new')
        disp(['BDs_ts_new length: ' num2str(length(BDs_ts_new))])
        BDs_ts = BDs_ts_new;
        %sort out the events not in BDs_ts_new in case and rebuild delays
        %lists
        disp('Chopping other arrays ...')
        edge_delay = [];
        corr_delay = [];
        corr_fail = [];
        for m=1:length(BDs_ts_new)
            tR = BD_struct.(BDs_ts_new{m}).position.edge.time_REF;
            tT = BD_struct.(BDs_ts_new{m}).position.edge.time_TRA;
            edge_delay(m) = tR-tT;
            corr_delay(m) = BD_struct.(BDs_ts_new{m}).position.correlation.delay_time;
            corr_fail(m) = BD_struct.(BDs_ts_new{m}).position.correlation.fail;
        end
        disp(['BDs_ts length: ' num2str(length(BDs_ts))])
    end
    
    edge_delay_full = [edge_delay_full edge_delay];
    corr_delay_full = [corr_delay_full corr_delay];
    corr_fail_full = [corr_fail_full corr_fail];  
    BDs_ts_full = [BDs_ts_full BDs_ts];
    fieldToCopy = fieldnames(BD_struct);
    for l=1:length(fieldToCopy)
        BD_struct_full.(fieldToCopy{l}) = BD_struct.(fieldToCopy{l});
    end
    
    
    clearvars -except fpath fname fnum fext edge_delay_full corr_delay_full ... 
        corr_fail_full BDs_ts_full BD_struct_full 
end


%% saving ...
clearvars fext fname fnum fpath
uisave