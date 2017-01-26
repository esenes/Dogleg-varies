%% ADD PREVIOUS PULSES
close all; clearvars; clc;

%fpath = 'W:\Backup_SSD\swap_out\exp\';
fpath = '/Users/esenes/swap_out/exp/';
fname = 'Exp_analized_UnLoaded43MW_';
fnum = {'1','2','3','7','8','9','10','11','12'};
fnum = {'4','5','6'};
fext = '.mat';

edge_delay_full = [];
corr_delay_full = [];
corr_fail_full = [];

for k=1:length(fnum) %loop over files
    fullName = [fpath fname fnum{k} fext];
    disp(['Processing file: ' fullName])
    
    load(fullName, 'edge_delay','corr_delay','corr_fail')

    edge_delay_full = [edge_delay_full edge_delay];
    corr_delay_full = [corr_delay_full corr_delay];
    corr_fail_full = [corr_fail_full corr_fail];  

end

% edge_delay_low = edge_delay_full;
% corr_delay_low = corr_delay_full;
% corr_fail_low = corr_fail_full; 

% edge_delay_high = edge_delay_full;
% corr_delay_high = corr_delay_full;
% corr_fail_high = corr_fail_full; 

%% 
% edge and correlation method plotting
f12 = figure;     
figure(f12);
hEdge = histogram([edge_delay_high edge_delay_low]);
hEdge.BinWidth = 8e-9;
hEdge.FaceColor = 'w';
hEdge.EdgeColor = 'r';
hold on
hEdge = histogram(edge_delay_high);
hEdge.BinWidth = 8e-9;
hold on
hEdge = histogram(edge_delay_low);
hEdge.BinWidth = 8e-9;
hold off
xlim([-.15e-6 .15e-6])
line([68e-9 68e-9], ylim, 'Color', 'r','LineWidth',2) %vertical line
line([-68e-9 -68e-9], ylim, 'Color', 'r','LineWidth',2) %vertical line
title('Delay edge method, high and low BDR')
xlabel('$$t_{REF} - t_{TRA} $$ (s) ','interpreter','latex')
ylabel('Counts (arb.u.)')
legend({'Cumulating all the runs','High BDR runs','Lower BDR runs'})
print(f12,[fpath 'comparison_edge_unloaded43MW_3'],'-djpeg')
savefig([fpath 'comparison_edge_unloaded43MW_3'])

f13 = figure;
figure(f13);
hCorr = histogram([corr_delay_high(not(corr_fail_high)) corr_delay_low(not(corr_fail_low))]);
hCorr.BinWidth = 4e-9;
hCorr.FaceColor = 'w';
hCorr.EdgeColor = 'r';
hold on
hCorr = histogram(corr_delay_high(not(corr_fail_high)));
hCorr.BinWidth = 4e-9;
hold on
hCorr = histogram(corr_delay_low(not(corr_fail_low)));
hCorr.BinWidth = 4e-9;
hold off
%title({'Delay correlation method';['Manual fails: ' num2str(find(length(corr_fail))) ' on ' num2str(length(BDs))]})
xlabel('$$t_{REF} - t_{INC} $$ (s) ','interpreter','latex')
ylabel('Counts (arb.u.)')
legend({'Cumulating the runs','High BDR runs','Other runs'})

print(f13,[fpath 'comparison_corr_unloaded43MW_3'],'-djpeg')
savefig([fpath 'comparison_corr_unloaded43MW_3'])
