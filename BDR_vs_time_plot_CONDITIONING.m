%% Overall BDR plotting
%%%%%%%%%%%%%%%%%%%%%%%
close all; clearvars ; clc;
%include folder to path
[dirpath,~,~]=fileparts(mfilename('fullpath'));
addpath(genpath(dirpath))
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%loaded43MW
pulsenum43 = [1057750   4077400+960950  6009400+949600  1655650+307200  4453550+1193650 1383750+247950  6298650+554250  282650+26200    3688000+1106350	4598950 3501200+778200];
BDs43 =      [11        52              291             14              50              25              190             1               27              17      67];
tstamps43 = {'4MAR - 7MAR','24MAR - 30MAR','31MAR - 4APR','15APR - 16APR','22APR - 25APR',...
    '29APR - 30APR','04MAY - 09MAY','13MAY','20MAY - 23 MAY','27MAY - 30MAY','23SEP - 25SEP'};


[ BDR43, sigBDR43, startDateStr43, startDateNum43 ] = BDRcalculation(pulsenum43, BDs43, tstamps43);
%%%%%%%%%%%%%%%%%%%%%%%
%loaded41MW OK
pulsenum41 = [2228500+242400    3194300+1746150 3379350+794300];
BDs41 =      [43                5               37];
tstamps41 = {'28OCT - 02NOV','04NOV - 06NOV','11NOV - 13NOV'};

[ BDR41, sigBDR41, startDateStr41, startDateNum41 ] = BDRcalculation(pulsenum41, BDs41, tstamps41);
%%%%%%%%%%%%%%%%%%%%%%%
%loaded38MW OK
pulsenum38 = [2242600+205150   2344050+3059900 6735700+1294850  4406450+1285000 2293000+1605850 636900+144050	2960500+1083450 2743100+564750	546700+40100    3577000+2012100 4521350+516250  3944150+1621700 3488850+687900];
BDs38 =      [6                43              22               46              19              14              30              107             52              17              37              17              36];
tstamps38 = {'08APR - 09APR','01JUL - 04JUL','14JUL - 18JUL',...
    '22JUL - 25JUL','29JUL - 31JUL','05AUG - 06AUG','12AUG - 14AUG',...
    '25AUG - 27AUG','08SEP - 12 SEP','18NOV - 21NOV','25NOV - 28NOV','02DEC - 05DEC','10DEC - 12DEC'};

[ BDR38, sigBDR38, startDateStr38, startDateNum38 ] = BDRcalculation(pulsenum38, BDs38, tstamps38);
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%antiloaded
pulsenumA6 = [8115100   10622950    10235100    3311350 ];
BDsA6 =      [68        17          10          7       ];
tstampsA6 = {'04APR - 08APR','03JUN - 06JUN','10JUN - 13JUN','24JUN - 27JUN'};

[ BDRA6, sigBDRA6, startDateStrA6, startDateNumA6 ] = BDRcalculation(pulsenumA6, BDsA6, tstampsA6);
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%Unloaded43MW OK
pulsenumU43 = [22517650 5138650  3706700 5559900 3437200 1681050 6176900 5247600    1279100 3316750    2308750 1039100];
BDsU43 =      [313      105      5       439     248     140     246     58         20      43         144     43];
tstampsU43 = {'24FEB - 01MAR','22MAR - 24MAR','30MAR - 31MAR','12APR - 15APR','27APR - 29APR',...
                '03MAY - 04APR','09MAY - 12MAY','17MAY - 20MAY','31MAY - 01JUN','01JUN - 03JUN','21SEP - 22SEP','25SEP - 26SEP'};

[ BDRU43, sigBDRU43, startDateStrU43, startDateNumU43 ] = BDRcalculation(pulsenumU43, BDsU43, tstampsU43);
%%%%%%%%%%%%%%%%%%%%%%%
%Unloaded41MW OK
pulsenumU41 = [5469800   2514800 5902050 18411700   2117900 4206400 10535450];
BDsU41 =      [223       22      120     209        95      35      86];
tstampsU41 = {'30AUG - 02SEP','06SEP - 07SEP','12SEP - 15SEP','17OCT - 28OCT',...
                '05OCT - 06OCT','02NOV - 04NOV','06NOV - 11NOV'};


[ BDRU41, sigBDRU41, startDateStrU41, startDateNumU41] = BDRcalculation(pulsenumU41, BDsU41, tstampsU41);

%%%%%%%%%%%%%%%%%%%%%%%
%Unloaded38MW OK
pulsenumU38 = [1587050  5446800 1413200 3160450 8687650 1633300 58800   1323650 8633700 7273525 9155736 10451200 9534300];
BDsU38 =      [15       96      44      50      109     36      4       10      84      42      68      38       28];
tstampsU38 = {'14JUL ','19JUL - 20JUL','25JUL - 26JUL','26JUL - 28JUL','14AUG - 18AUG','28AUG - 29AUG',...
                '07SEP - 08SEP','07OCT - 08OCT','14NOV - 18NOV','21NOV - 25NOV','28NOV - 02DEC','05DEC - 10DEC','12DEC - 16DEC'};

[ BDRU38, sigBDRU38, startDateStrU38, startDateNumU38 ] = BDRcalculation(pulsenumU38, BDsU38, tstampsU38);

%%%%%%%%%%%%%%%%%%%%%%%
%Unloaded35MW OK
pulsenumU35 = [6130800   ];
BDsU35 =      [43        ];
tstampsU35 = {'06AUG - 09AUG'};

[ BDRU35, sigBDRU35, startDateStrU35, startDateNumU35 ] = BDRcalculation(pulsenumU35, BDsU35, tstampsU35);

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%plotting vs time
figure(1)
errorbar(startDateNum43,BDR43,sigBDR43,'. r','MarkerSize',20); 
hold on
errorbar(startDateNum41,BDR41,sigBDR41,'.','Color',[1 .5 0],'MarkerSize',20); 
hold on
errorbar(startDateNum38,BDR38,sigBDR38,'. m','MarkerSize',20); 
hold on
errorbar(startDateNumA6,BDRA6,sigBDRA6,'.','Color',[0.2 0.6 0.2],'MarkerSize',20); 
hold on
errorbar(startDateNumU43,BDRU43,sigBDRU43,'. b','MarkerSize',20); 
hold on
errorbar(startDateNumU41,BDRU41,sigBDRU41,'.','Color',[0.6 0.2 0.6],'MarkerSize',20); 
hold on
errorbar(startDateNumU38,BDRU38,sigBDRU38,'.','Color',[0.2 0.2 0.6],'MarkerSize',20); 
hold off
%errorbar(startDateNumU35,BDRU35,sigBDRU35,'. ','Color',[0.6 0.2 0.2],'MarkerSize',20); 

legend({'Loaded 43.3MW','Loaded 41MW','Loaded 38MW',...
        'Antiloaded 6.5MW',...
        'Unloaded 43.3MW','Unloaded 41MW','Unloaded 38MW','UnLoaded 35MW'})
title('Measured overall BDR (all runs processed as unloaded)')
xlabel('Date')
ylabel('BDR [1/pulse]')

ax = gca;
ax.XLim = [736370 736685];
ax.XTick = [736361 736390 736421 736451 736482 736512 736543 736574 736604 736635 736696];%1st of every month
ax.XTickLabelRotation = 45;
ax.YLim = [5e-7 2e-4]
ax.FontSize = 20;
ax.YGrid = 'on';
ax.YScale = 'log';
datetick('x','ddmmm')


%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
% cumulative BDR plotting vs input power
figure(3)
% loaded 43MW
tpuls43 = sum(pulsenum43);
tBDs43 = sum(BDs43);
[t43, ts43] = BDRcalc(tpuls43,tBDs43) ;
errorbar(43.3,t43,ts43,'. r','MarkerSize',20); 
hold on
% loaded 41MW
tpuls41 = sum(pulsenum41);
tBDs41 = sum(BDs41);
[t41, ts41] = BDRcalc(tpuls41,tBDs41) ;
errorbar(41,t41,ts41,'.','Color',[1 .5 0],'MarkerSize',20); 
hold on
% loaded 38MW
tpuls38 = sum(pulsenum38);
tBDs38 = sum(BDs38);
[t38, ts38] = BDRcalc(tpuls38,tBDs38) ;
errorbar(38,t38,ts38,'. m','MarkerSize',20); 
hold on
% antiloaded 6.5MW
tpulsA6 = sum(pulsenumA6);
tBDsA6 = sum(BDsA6);
[tA6, tsA6] = BDRcalc(tpulsA6,tBDsA6) ;
errorbar(6.5,tA6,tsA6,'.','Color',[0.2 0.6 0.2],'MarkerSize',20); 
hold on
% unloaded 43MW
tpulsU43 = sum(pulsenumU43);
tBDsU43 = sum(BDsU43);
[tU43, tsU43] = BDRcalc(tpulsU43,tBDsU43) ;
errorbar(43.3,tU43,tsU43,'. b','MarkerSize',20); 
hold on
% unloaded 41MW
tpulsU41 = sum(pulsenumU41);
tBDsU41 = sum(BDsU41);
[tU41, tsU41] = BDRcalc(tpulsU41,tBDsU41) ;
errorbar(41,tU41,tsU41,'.','Color',[0.6 0.2 0.6],'MarkerSize',20); 
hold on
% unloaded 38MW
tpulsU38 = sum(pulsenumU38);
tBDsU38 = sum(BDsU38);
[tU38, tsU38] = BDRcalc(tpulsU38,tBDsU38) ;
errorbar(38,tU38,tsU38,'.','Color',[0.2 0.2 0.6],'MarkerSize',20); 
hold off


legend({'Loaded 43.3MW','Loaded 41MW','Loaded 38MW',...
        'Antiloaded 6.5MW',...
        'Unloaded 43.3MW','Unloaded 41MW','Unloaded 38MW','UnLoaded 35MW'})
title('Measured BDR')
xlabel('Input power (MW)')
ylabel('BDR [1/pulse]')
ax = gca;
ax.FontSize = 14;
ax.YGrid = 'on';
ax.YScale = 'log';


%% %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
% cumulative BDR plotting vs avg gradient
figure(3)
% loaded 43MW
tpuls43 = sum(pulsenum43);
tBDs43 = sum(BDs43);
[t43, ts43] = BDRcalc(tpuls43,tBDs43) ;
errorbar(75.02e6,t43,ts43,'. r','MarkerSize',20); 
hold on
% loaded 41MW
tpuls41 = sum(pulsenum41);
tBDs41 = sum(BDs41);
[t41, ts41] = BDRcalc(tpuls41,tBDs41) ;
errorbar(72.28e6,t41,ts41,'.','Color',[1 .5 0],'MarkerSize',20); 
hold on
% loaded 38MW
tpuls38 = sum(pulsenum38);
tBDs38 = sum(BDs38);
[t38, ts38] = BDRcalc(tpuls38,tBDs38) ;
errorbar(68.59e6,t38,ts38,'. m','MarkerSize',20); 
hold on
% unloaded 43MW
tpulsU43 = sum(pulsenumU43);
tBDsU43 = sum(BDsU43);
[tU43, tsU43] = BDRcalc(tpulsU43,tBDsU43) ;
errorbar(101.7e6,tU43,tsU43,'. b','MarkerSize',20); 
hold on
% unloaded 41MW
tpulsU41 = sum(pulsenumU41);
tBDsU41 = sum(BDsU41);
[tU41, tsU41] = BDRcalc(tpulsU41,tBDsU41) ;
errorbar(98.97e6,tU41,tsU41,'.','Color',[0.6 0.2 0.6],'MarkerSize',20); 
hold on
% unloaded 38MW
tpulsU38 = sum(pulsenumU38);
tBDsU38 = sum(BDsU38);
[tU38, tsU38] = BDRcalc(tpulsU38,tBDsU38) ;
errorbar(95.28e6,tU38,tsU38,'.','Color',[0.2 0.2 0.6],'MarkerSize',20); 
hold on






legend({'Loaded 43.3MW','Loaded 41MW','Loaded 38MW',...
        'Unloaded 43.3MW','Unloaded 41MW','Unloaded 38MW','UnLoaded 35MW'})
title('Measured BDR (All BDs, careless of beam presence)')
xlabel('Average accelerating gradient (V/m)')
ylabel('BDR [1/pulse]')
ax = gca;
ax.FontSize = 14;
ax.YGrid = 'on';
ax.YScale = 'log';
ylim([ .5e-5 .4e-4 ])


%% log plot and fit
figure(4)
clearvars xdata ydata

% fitting parameters
% law is BDR = alpha * acc. gradient^30

xdata = [95.28e6    98.97e6 101.7e6];
xdata = log10(xdata);
ydata = [tU38       tU41    tU43];
ydata = log10(ydata);

fit_u = fit(xdata', ydata', 'poly1')
plot(fit_u)
hold on

errorbar(xdata, ydata,'.')
xlabel('Log10(avg gradient)')
ylabel('Log10(BDR)')

hold off