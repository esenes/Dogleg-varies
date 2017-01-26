%% CORRECT NEGATIVE TIME DELAYS
close all; clearvars; clc;

fillTime = 68e-9;

timescale = 0:4e-9:799*4e-9;

% fpath = '/Users/esenes/swap_out/exp/';
% fname = 'Exp_analized_UnLoaded43MW_';
% fnum = {'1','2_1','2_2','3','4','5','6','7','8','9','10','11'};
% fnum = {'1','2','3','4','5','6','7','8','9','11','12'};
% fext = '.mat';
uiload


%% 
% edge method plotting
f12 = figure;     
figure(f12);
hEdge = histogram(edge_delay);
hEdge.BinWidth = 4e-9;
xlim([-.15e-6 .15e-6])
line([68e-9 68e-9], ylim, 'Color', 'r','LineWidth',2) %vertical line
line([-68e-9 -68e-9], ylim, 'Color', 'r','LineWidth',2) %vertical line
title('Delay edge method')
xlabel('$$t_{REF} - t_{TRA} $$ (s) ','interpreter','latex')
ylabel('Counts (arb.u.)')
% print(f12,[fpath 'edge_AntiLoaded6_5MW'],'-djpeg')
% savefig([fpath 'edge_AntiLoaded6_5MW'])

%% find the wrong time delays
corr_idx = find(edge_delay <= -fillTime | edge_delay >= fillTime);
corr_ts = BDs_ts(corr_idx);

f3 = figure;
figure(f3);

for k = 1:length(corr_ts)
    figure(2)
    INC_c = BD_struct.(corr_ts{k}).INC.data_cal;
    REF_c = BD_struct.(corr_ts{k}).REF.data_cal;
    TRA_c = BD_struct.(corr_ts{k}).TRA.data_cal;
    if isfield(BD_struct, ([corr_ts{k}(1:21) 'L1']))
        INC_p = BD_struct.([corr_ts{k}(1:21) 'L1']).INC.data_cal;
        REF_p = BD_struct.([corr_ts{k}(1:21) 'L1']).REF.data_cal;
        TRA_p = BD_struct.([corr_ts{k}(1:21) 'L1']).TRA.data_cal;
        
        signalsPlot(timescale,[INC_c; TRA_c; REF_c; INC_p; TRA_p; REF_p],f3)
    else
        signalsPlot_noPrev(timescale,[INC_c; TRA_c; REF_c],f3)
    end

    disp(['Current delay is: ' num2str(BD_struct.(corr_ts{k}).position.edge.time_REF-BD_struct.(corr_ts{k}).position.edge.time_TRA)])
    
    str = input('time_peak_REF =   ','s');
    BD_struct.(corr_ts{k}).position.edge.time_REF = str2num(str);
    str = input('time_peak_REF =   ','s');
    BD_struct.(corr_ts{k}).position.edge.time_REF = str2num(str);
    
    disp(['new delay is ' num2str(BD_struct.(corr_ts{k}).position.edge.time_REF-BD_struct.(corr_ts{k}).position.edge.time_TRA)])
    str = input('Satisfied ?   ','s');
    if strcmpi(str,'Y')
        continue;
    else strcmpi(str, 'N')
        str = input('time_peak_REF =   ','s');
        BD_struct.(corr_ts{k}).position.edge.time_REF = str2num(str);
        str = input('time_peak_REF =   ','s');
        BD_struct.(corr_ts{k}).position.edge.time_REF = str2num(str);
        disp(['new delay is ' num2str(BD_struct.(corr_ts{k}).position.edge.time_REF-BD_struct.(corr_ts{k}).position.edge.time_TRA)])
    end 
        
    pause
end


%% final check

edge_delay_new = zeros(1,length(BDs_ts));
for l=1:length(BDs_ts)
    edge_delay_new(l) = BD_struct.(BDs_ts{l}).position.edge.time_REF-BD_struct.(BDs_ts{l}).position.edge.time_TRA;
end
% edge method plotting
f12 = figure;     
figure(f12);
hEdge = histogram(edge_delay_new);
hEdge.BinWidth = 4e-9;
xlim([-.15e-6 .15e-6])
line([68e-9 68e-9], ylim, 'Color', 'r','LineWidth',2) %vertical line
line([-68e-9 -68e-9], ylim, 'Color', 'r','LineWidth',2) %vertical line
title('Delay edge method')
xlabel('$$t_{REF} - t_{TRA} $$ (s) ','interpreter','latex')
ylabel('Counts (arb.u.)')
% print(f12,[fpath 'edge_AntiLoaded6_5MW'],'-djpeg')
% savefig([fpath 'edge_AntiLoaded6_5MW'])


%% saving
edge_delay = edge_delay_new;
clearvars -except BD_struct BDs_ts beam_lost clusters corr_delay corr_fail data_struct edge_delay ...
    hasBeam inMetric isSpike sec_beam_lost sec_spike

uisave
