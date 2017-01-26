%% CLUSTERING CHECK
close all; clearvars; clc;

fpath = '/Users/esenes/swap_out/exp/';
fname = 'Exp_analized_Loaded38MW_';
fnum = {'1','2','4','6','7','8','9','11_1','12','13','14','15'};
fnum = {'14','15'};
fext = '.mat';

for k=1:length(fnum) %loop over files
    fullName = [fpath fname fnum{k} fext];
    disp(['Processing file: ' fullName])
    
    %loading
    load(fullName, 'BDs_ts')
    disp(['size of BDs_ts = ' num2str(length(BDs_ts))])
    try 
        load(fullName, 'BDs_ts_new')
        disp(['size of BDs_ts_new = ' num2str(length(BDs_ts_new))])
        BDs_ts = BDs_ts_new;
    catch
        
    end

    %filtering
    ts_array = zeros(1,length(BDs_ts));
    for k=1:length(BDs_ts)
        [~, ts_array(k)] = getFileTimeStamp(BDs_ts{k});
    end
    %2 seconds filtering
    [keep_2,~] = filterSecondary(ts_array,2 ,ones(1,length(BDs_ts)) );
    l2 = length(find(keep_2 > 0));
    %3 seconds filtering
    [keep_3,~] = filterSecondary(ts_array,3 ,ones(1,length(BDs_ts)) );
    l3 = length(find(keep_3 > 0));
    %5 seconds filtering
    [keep_5,~] = filterSecondary(ts_array,5 ,ones(1,length(BDs_ts)) );
    l5 = length(find(keep_5 > 0));
    %9 seconds filtering
    [keep_9,~] = filterSecondary(ts_array,9 ,ones(1,length(BDs_ts)) );
    l9 = length(find(keep_9 > 0));
    %10 seconds filtering
    [keep_10,~] = filterSecondary(ts_array,10 ,ones(1,length(BDs_ts)) );
    l10 = length(find(keep_10 > 0));
    
    %reporting
    fprintf(1,['\nInitial number of BDs: ' num2str(length(BDs_ts)) ' \n' ...
                'After 2 seconds filtering: ' num2str(l2) '\n' ...
                'After 3 seconds filtering: ' num2str(l3) '\n' ...
                'After 5 seconds filtering: ' num2str(l5) '\n' ...
                'After 9 seconds filtering: ' num2str(l9) '\n' ...
                'After 10 seconds filtering: ' num2str(l10) '\n \n' ...
                ])

end
