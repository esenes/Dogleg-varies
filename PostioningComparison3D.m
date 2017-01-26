%% POSITIONING COMPARISON - ALL THE RUNS
close all; clearvars; clc;

fpath = '/Users/esenes/swap_out/';
fname = 'Full_dataset_';
fatt = {'Loaded38MW','Loaded41MW','Loaded43MW','Unloaded38MW','Unloaded41MW','Unloaded43MW',...
    'AntiLoaded6_5MW'};
fext = '.mat';

%structure parameters
struct_param = GetTD26CCParameters();
tdp = struct_param.tdp;
tds_REF = struct_param.tds_REF;
zi_struct = struct_param.zi_struct;
ze_struct = struct_param.ze_struct;
ncell = struct_param.ncell; 

%init vars
cells_position = [];

%% gather data
for k=1:length(fatt) %loop over files
    fullName = [fpath fname fatt{k} fext];
    disp(['Processing file: ' fullName])
    
    load(fullName)%, 'edge_delay','corr_delay','corr_fail')
    
    % cell posititoning
    % edge_delays --> cells
    
    td = (edge_delay_full + 72e-9);
    %Convert to position
    Z = td2z(td/2,tdp,zi_struct);
    % Convert to cell
    [h,cells_all,~] = cellhist(Z,ze_struct,ncell);
    %store 
    h = h/sum(h); %convert to percentage
    cells_position = [cells_position ; h];
end

cells_position = cells_position';

%% plotting LOADED case 3D
figure(1)
bar3(cells_position(:,1),'r')
title(fatt(1))
aa = gca;
aa.XTickLabel = fatt(1);
aa.YTick = [1 2 3 7 12 17 22 27 29 30];
aa.YTickLabel = {'Upstream WG','Input coupler','1','5','10','15','20','25','Output coupler','Downstream WG'}
aa.YTickLabelRotation = 40
figure(2)
bar3(cells_position(:,2),'r')
title(fatt(2))
aa = gca;
aa.XTickLabel = fatt(2);
aa.YTick = [1 2 3 7 12 17 22 27 29 30];
aa.YTickLabel = {'Upstream WG','Input coupler','1','5','10','15','20','25','Output coupler','Downstream WG'}
aa.YTickLabelRotation = 40
figure(3)
bar3(cells_position(:,3),'r')
title(fatt(3))
aa = gca;
aa.XTickLabel = fatt(3);
aa.YTick = [1 2 3 7 12 17 22 27 29 30];
aa.YTickLabel = {'Upstream WG','Input coupler','1','5','10','15','20','25','Output coupler','Downstream WG'}
aa.YTickLabelRotation = 40

%% plotting LOADED case with normal bars
figure(4)
subplot(3,1,1)
bar(cells_position(:,1),'r')
title(fatt(1))
aa = gca;
aa.XTick = [3 7 12 17 22 27];
aa.XTickLabel = {'1','5','10','15','20','25'}
aa.XTickLabelRotation = 0
aa.LineWidth = 2
aa.FontSize = 14
xlabel('Cell')
ylabel({ 'Relative frequency' ;'(arb. u.)'})
xlim([.6 30.5])
subplot(3,1,2)
bar(cells_position(:,2),'r')
title(fatt(2))
aa = gca;
aa.XTick = [3 7 12 17 22 27];
aa.XTickLabel = {'1','5','10','15','20','25'}
aa.XTickLabelRotation = 0
aa.LineWidth = 2
aa.FontSize = 14
aa.LineWidth = 2
aa.FontSize = 14
xlabel('Cell')
ylabel({ 'Relative frequency' ;'(arb. u.)'})
xlim([.6 30.5])
subplot(3,1,3)
bar(cells_position(:,3),'r')
title(fatt(3))
aa = gca;
aa.XTick = [1 2 3 7 12 17 22 27 29 30];
aa.XTickLabel = {'Upstream WG','Input coupler','1','5','10','15','20','25','Output coupler','Downstream WG'}
aa.XTickLabelRotation = 45
aa.LineWidth = 2
aa.FontSize = 14
xlabel('Cell')
ylabel({ 'Relative frequency' ;'(arb. u.)'})
xlim([.6 30.5])

%% plotting UNLOADED case with normal bars
figure(5)
subplot(3,1,1)
bar(cells_position(:,4),'b')
title(fatt(4))
aa = gca;
aa.XTick = [3 7 12 17 22 27];
aa.XTickLabel = {'1','5','10','15','20','25'}
aa.XTickLabelRotation = 0
aa.LineWidth = 2
aa.FontSize = 14
xlabel('Cell')
ylabel({ 'Relative frequency' ;'(arb. u.)'})
xlim([.6 30.5])

subplot(3,1,2)
bar(cells_position(:,5),'b')
title(fatt(5))
aa = gca;
aa.XTick = [3 7 12 17 22 27];
aa.XTickLabel = {'1','5','10','15','20','25'}
aa.XTickLabelRotation = 0
aa.LineWidth = 2
aa.FontSize = 14
aa.LineWidth = 2
aa.FontSize = 14 
xlabel('Cell')
ylabel({ 'Relative frequency' ;'(arb. u.)'})
xlim([.6 30.5])

subplot(3,1,3)
bar(cells_position(:,6),'b')
title(fatt(6))
aa = gca;
aa.XTick = [1 2 3 7 12 17 22 27 29 30];
aa.XTickLabel = {'Upstream WG','Input coupler','1','5','10','15','20','25','Output coupler','Downstream WG'}
aa.XTickLabelRotation = 45
aa.LineWidth = 2
aa.FontSize = 14
xlabel('Cell')
ylabel({ 'Relative frequency' ;'(arb. u.)'})
xlim([.6 30.5])

%% plotting ANTILOADED case with normal bars
figure(6)
bar(cells_position(:,7),'g')
title('AntiLoaded 6.5 MW')
aa = gca;
aa.XTick = [1 2 3 7 12 17 22 27 29 30];
aa.XTickLabel = {'Upstream WG','Input coupler','1','5','10','15','20','25','Output coupler','Downstream WG'}
aa.XTickLabelRotation = 45
aa.LineWidth = 2
aa.FontSize = 14
xlabel('Cell')
ylabel({ 'Relative frequency' ;'(arb. u.)'})
xlim([.6 30.5])