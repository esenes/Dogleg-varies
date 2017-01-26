%% get current cursor x postition
datacursormode on;
dcm_obj = datacursormode;
info_struct = getCursorInfo(dcm_obj);
datestr(info_struct.Position(1),'ddmmyyyy HH:MM:SS')





%% BDs management
close all; clc;
%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%
datapath_write = '/Users/esenes/swap_out/exp/Exp_analized_UnLoaded43MW_3.mat';
mode = 'unloaded';


%load manually the analysis file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%save the delays of the two methods
edge_delay = zeros(1,length(BDs_ts));
corr_delay = zeros(1,length(BDs_ts));
corr_fail = zeros(1,length(BDs_ts)); %the fail flag for the correlation method
for k=1:length(BDs_ts)
    tR = data_struct.(BDs_ts{k}).position.edge.time_REF;
    tT = data_struct.(BDs_ts{k}).position.edge.time_TRA;
    edge_delay(k) = tR-tT;
    corr_delay(k) = data_struct.(BDs_ts{k}).position.correlation.delay_time;
    corr_fail(k) = data_struct.(BDs_ts{k}).position.correlation.fail;
end









%remove the metric fails
rem_ts = {...
'g_20160809082411_980_B0',...
'g_20160809082422_824_B0',...
'g_20160807144928_305_B0',...
'g_20160807144938_624_B0',...
'g_20160807142320_249_B0'...
};
rm_idx = [];
for k = 1:length(rem_ts)
    [succ, idx] = ismember(rem_ts{k},BDs_ts);
    if succ == 0
        warning('Element not found')
    end
    rm_idx(k) = idx;
end
BDs_ts(rm_idx) = [];


%display the chopped array
BDs_ts = BDs;

for k = 1:length(BDs_ts)
    disp(get_tsString(BDs_ts{k}))
    %isfield(data_struct.(BDs_ts{k}),'position')
    %isfield(data_struct.(BDs_ts{k}).position.correlation,'fail')
    %data_struct.(BDs_ts{k}).position.correlation
end

%chopping part, to arrange every time 

%cut the head
[succ, idx] = ismember('g_20160503223407_315_B0',BDs_ts);
BDs_ts_new = BDs_ts(idx:end);
%cut the tail

% [succ, idx] = ismember('g_20160429044925_379_B0',BDs_ts);
% BDs_ts(idx)
% length(BDs_ts(1:idx))
% BDs_ts_1 = BDs_ts(1:idx);
% 
% BDs_ts_2 = BDs_ts(end-3:end);
% 
% BDs_ts_new = [BDs_ts_1 BDs_ts_2];

BDs_ts_new = BDs_ts;

disp(['New number of BDs is ' num2str(length(BDs_ts_new))])

%save the new file
fileattrib(datapath_write,'+w','a');
tic
disp('Saving ...')
if strcmpi(mode,'loaded')
    save(datapath_write,...
        'data_struct','BDs_ts','inMetric','isSpike','sec_spike','beam_lost','sec_beam_lost','hasBeam','clusters',...
        'corr_delay','corr_fail','edge_delay','-v7.3');
    fileattrib([datapath_write],'-w','a');
elseif strcmpi(mode,'unloaded')
    save(datapath_write,...
        'BDs_ts_new','data_struct','BDs_ts','inMetric','isSpike','sec_spike',...
        'corr_delay','corr_fail','edge_delay','-v7.3');
    fileattrib([datapath_write ],'-w','a');
end
disp('Done.')