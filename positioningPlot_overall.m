%% ADD PREVIOUS PULSES
close all; clearvars; clc;

fpath = '/Users/esenes/swap_out/exp/';
fname = 'Exp_analized_UnLoaded43MW_';
fnum = {'1','2_1','2_2','3','4','5','6','7','8','9','10','11'};
fnum = {'1','2','3','4','5','6','7','8','9','10','11','12'};
fext = '.mat';

edge_delay_full = [];
corr_delay_full = [];
corr_fail_full = [];

for k=1:length(fnum) %loop over files
    fullName = [fpath fname fnum{k} fext];
    disp(['Processing file: ' fullName])
    
    load(fullName, 'edge_delay','corr_delay','corr_fail')
    
    disp(length(edge_delay))

    edge_delay_full = [edge_delay_full edge_delay];
    corr_delay_full = [corr_delay_full corr_delay];
    corr_fail_full = [corr_fail_full corr_fail];  

end

%%
edge_delay_full = edge_delay;


%% 
% edge and correlation method plotting
f12 = figure;     
figure(f12);
hEdge = histogram(edge_delay_full);
hEdge.BinWidth = 4e-9;
xlim([-.15e-6 .15e-6])
line([68e-9 68e-9], ylim, 'Color', 'r','LineWidth',2) %vertical line
line([-68e-9 -68e-9], ylim, 'Color', 'r','LineWidth',2) %vertical line
title('Delay edge method')
xlabel('$$t_{REF} - t_{TRA} $$ (s) ','interpreter','latex')
ylabel('Counts (arb.u.)')
% print(f12,[fpath 'edge_AntiLoaded6_5MW'],'-djpeg')
% savefig([fpath 'edge_AntiLoaded6_5MW'])

f13 = figure;
figure(f13);
hCorr = histogram(corr_delay_full(not(corr_fail_full)));
hCorr.BinWidth = 4e-9;
title({'Delay correlation method';['Manual fails: ' num2str(length(find(corr_fail_full>0))) ' on ' num2str(length(corr_fail_full))]})
xlabel('$$t_{REF} - t_{INC} $$ (s) ','interpreter','latex')
ylabel('Counts (arb.u.)')
xlim([-25e-9 180e-9])

% print(f13,[fpath 'corr_AntiLoaded6_5MW'],'-djpeg')
% savefig([fpath 'corr_AntiLoaded6_5MW'])
