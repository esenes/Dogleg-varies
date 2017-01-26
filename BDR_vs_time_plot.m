%% Overall BDR plotting
%%%%%%%%%%%%%%%%%%%%%%%
close all; clearvars ; clc;
%include folder to path
[dirpath,~,~]=fileparts(mfilename('fullpath'));
addpath(genpath(dirpath))
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%loaded43MW
pulsenum43 = [1057750   4077400 6009400 1655650 4222050 1383750 6298650 258800  3688000 4598950 3501200];
BDs43 =      [11        52      166     12      32      12      128     1       18      17      17];
tstamps43 = {'4MAR - 7MAR','24MAR - 30MAR','31MAR - 4APR','15APR - 16APR','22APR - 25APR',...
    '29APR - 30APR','04MAY - 09MAY','13MAY','20MAY - 23 MAY','27MAY - 30MAY','23SEP - 25SEP'};


[ BDR43, sigBDR43, startDateStr43, startDateNum43 ] = BDRcalculation(pulsenum43, BDs43, tstamps43);
%%%%%%%%%%%%%%%%%%%%%%%
%loaded41MW OK
pulsenum41 = [2228500   3194300 3379350];
BDs41 =      [9         4       17];
tstamps41 = {'28OCT - 02NOV','04NOV - 06NOV','11NOV - 13NOV'};

[ BDR41, sigBDR41, startDateStr41, startDateNum41 ] = BDRcalculation(pulsenum41, BDs41, tstamps41);
%%%%%%%%%%%%%%%%%%%%%%%
%loaded38MW OK
pulsenum38 = [2242600   2344050 6735700 4406450 2293000 636900  2960500 2743100 546700  3577000 4521350 3944150 3488850];
BDs38 =      [4         19      13      27      1       6       17      40      26      7       31      10      19];
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
%Unloaded38MW
pulsenumU38 = [1587050  5446800 1413200 3160450 8687650 1633300 58800   1323650 8633700 7273525 9155736 10451200 9534300];
BDsU38 =      [15       96      44      50      109     38      4       10      84      42      68      38       28];
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
title('Measured BDR')
xlabel('Date')
ylabel('BDR [1/pulse]')

ax = gca;
ax.XLim = [736361 736696];
ax.XTick = [736361 736390 736421 736451 736482 736512 736543 736574 736604 736635 736696];%1st of every month
ax.XTickLabelRotation = 45;
ax.FontSize = 14;
ax.YGrid = 'on';
ax.YScale = 'log';
datetick('x','ddmmm')

% %3D plot to undertand conditioning status (omitting the antiloaded runs)
% figure(2)
% stem3(startDateNum43,43.3*ones(1,length(BDR43)),BDR43,'. r','LineWidth',4,'MarkerSize',15)
% hold on
% stem3(startDateNum41,41*ones(1,length(BDR41)),BDR41,'.','Color',[1 .5 0],'LineWidth',4,'MarkerSize',15)
% hold on
% stem3(startDateNum38,38*ones(1,length(BDR38)),BDR38,'. m','LineWidth',4,'MarkerSize',15)
% hold on
% %stem3(startDateNumA6,6.5*ones(1,length(BDRA6)),BDRA6,'.','Color',[0.2 0.6 0.2],'LineWidth',4,'MarkerSize',15)
% %hold on 
% stem3(startDateNumU43,43.3*ones(1,length(BDRU43)),BDRU43,'. b','LineWidth',4,'MarkerSize',15)
% hold on 
% stem3(startDateNumU41,41*ones(1,length(BDRU41)),BDRU41,'.','Color',[0.6 0.2 0.6],'LineWidth',4,'MarkerSize',15)
% hold on
% stem3(startDateNumU38,38*ones(1,length(BDRU38)),BDRU38,'.','Color',[0.2 0.2 0.6],'LineWidth',4,'MarkerSize',15)
% 
% legend({'Loaded 43.3MW','Loaded 41MW','Loaded 38MW',...
%         'Unloaded 43.3MW','Unloaded 41MW','Unloaded 38MW','UnLoaded 35MW'})
% title({'Measured BDR'; 'Antiloaded runs omitted'})
% xlabel('Date')
% ylabel('Input Power (MW)')
% zlabel('BDR [1/pulse]')
% 
% ax = gca;
% ax.XLim = [736361 736696];
% ax.XTick = [736330 736361 736390 736421 736451 736482 736512 736543 736574 736604 736635 736665 736696];%1st of every month
% ax.FontSize = 14;
% ax.XGrid = 'on';
% ax.XMinorGrid = 'on';
% ax.YGrid = 'on';
% ax.YMinorGrid = 'on';
% datetick('x','ddmmm')

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

%% BDR vs time plot, scaled with average gradient
BDR43s = BDR43/(75^30);
sigBDR43s = sigBDR43/(75^30);
BDR41s = BDR41/(72^30);
sigBDR41s = sigBDR41/(72^30);
BDR38s = BDR38/(68.5^30);
sigBDR38s = sigBDR38/(68.5^30);
BDRU43s = BDRU43/(100^30);
sigBDRU43s = sigBDRU43/(100^30);
BDRU41s = BDRU41/(99^30);
sigBDRU41s = sigBDRU41/(99^30);
BDRU38s = BDRU38/(95^30);
sigBDRU38s = sigBDRU38/(95^30);

%plotting vs time
figure(67)
errorbar(startDateNum43,BDR43s,sigBDR43s,'. r','MarkerSize',20); 
hold on
errorbar(startDateNum41,BDR41s,sigBDR41s,'.','Color',[1 .5 0],'MarkerSize',20); 
hold on
errorbar(startDateNum38,BDR38s,sigBDR38s,'. m','MarkerSize',20); 
hold on
errorbar(startDateNumU43,BDRU43s,sigBDRU43s,'. b','MarkerSize',20); 
hold on
errorbar(startDateNumU41,BDRU41s,sigBDRU41s,'.','Color',[0.6 0.2 0.6],'MarkerSize',20); 
hold on
errorbar(startDateNumU38,BDRU38s,sigBDRU38s,'.','Color',[0.2 0.2 0.6],'MarkerSize',20); 
hold off
%errorbar(startDateNumU35,BDRU35,sigBDRU35,'. ','Color',[0.6 0.2 0.2],'MarkerSize',20); 

legend({'Loaded 43.3MW','Loaded 41MW','Loaded 38MW',...
        'Unloaded 43.3MW','Unloaded 41MW','Unloaded 38MW','UnLoaded 35MW'})
title('Measured BDR')
xlabel('Date')
ylabel('BDR [1/pulse] / E[MV/m]^{30}_{avg}')

ax = gca;
ax.XLim = [736361 736696];
ax.XTick = [736361 736390 736421 736451 736482 736512 736543 736574 736604 736635 736696];%1st of every month
ax.XTickLabelRotation = 45;
ax.FontSize = 14;
ax.YGrid = 'on';
ax.YScale = 'log';
datetick('x','ddmmm')

%% BDR vs time plot, scaled with peak gradient
BDR43s = BDR43/(98^30);
sigBDR43s = sigBDR43/(98^30);
BDR41s = BDR41/(95.5^30);
sigBDR41s = sigBDR41/(95.5^30);
BDR38s = BDR38/(92^30);
sigBDR38s = sigBDR38/(92^30);
BDRU43s = BDRU43/(103^30);
sigBDRU43s = sigBDRU43/(103^30);
BDRU41s = BDRU41/(100^30);
sigBDRU41s = sigBDRU41/(100^30);
BDRU38s = BDRU38/(96.6^30);
sigBDRU38s = sigBDRU38/(96.6^30);

%plotting vs time
figure(68)
errorbar(startDateNum43,BDR43s,sigBDR43s,'. r','MarkerSize',20); 
hold on
errorbar(startDateNum41,BDR41s,sigBDR41s,'.','Color',[1 .5 0],'MarkerSize',20); 
hold on
errorbar(startDateNum38,BDR38s,sigBDR38s,'. m','MarkerSize',20); 
hold on
errorbar(startDateNumU43,BDRU43s,sigBDRU43s,'. b','MarkerSize',20); 
hold on
errorbar(startDateNumU41,BDRU41s,sigBDRU41s,'.','Color',[0.6 0.2 0.6],'MarkerSize',20); 
hold on
errorbar(startDateNumU38,BDRU38s,sigBDRU38s,'.','Color',[0.2 0.2 0.6],'MarkerSize',20); 
hold off
%errorbar(startDateNumU35,BDRU35,sigBDRU35,'. ','Color',[0.6 0.2 0.2],'MarkerSize',20); 

legend({'Loaded 43.3MW','Loaded 41MW','Loaded 38MW',...
        'Unloaded 43.3MW','Unloaded 41MW','Unloaded 38MW','UnLoaded 35MW'})
title('Measured BDR')
xlabel('Date')
ylabel('BDR [1/pulse] / E[MV/m]^{30}_{peak}')

ax = gca;
ax.XLim = [736361 736696];
ax.XTick = [736361 736390 736421 736451 736482 736512 736543 736574 736604 736635 736696];%1st of every month
ax.XTickLabelRotation = 45;
ax.FontSize = 14;
ax.YGrid = 'on';
ax.YScale = 'log';
datetick('x','ddmmm')

%% 5 main sections at stable BDR
figure
%sector 1
pulsenum_l1 = pulsenum43(1:3);
BDs_l1 = BDs43(1:3);

BDR_l1 = sum(BDs_l1)/sum(pulsenum_l1)
sigBDR_l1 = sqrt(sum(BDs_l1))/sum(pulsenum_l1)
errorbar(1,BDR_l1,sigBDR_l1,'. r')
hold on

pulsenum_u1 = pulsenumU43(1:3);
BDs_u1 = BDsU43(1:3);

BDR_u1 = sum(BDs_u1)/sum(pulsenum_u1)
sigBDR_u1 = sqrt(sum(BDs_u1))/sum(pulsenum_u1)
errorbar(1,BDR_u1,sigBDR_u1,'. b')
hold on 
%sector2
pulsenum_l2 = pulsenum43(4:9);
BDs_l2 = BDs43(4:9);

BDR_l2 = sum(BDs_l2)/sum(pulsenum_l2)
sigBDR_l2 = sqrt(sum(BDs_l2))/sum(pulsenum_l2)
errorbar(2,BDR_l2,sigBDR_l2,'. r')
hold on

pulsenum_u2 = pulsenumU43(4:10);
BDs_u2 = BDsU43(4:10);

BDR_u2 = sum(BDs_u2)/sum(pulsenum_u2)
sigBDR_u2 = sqrt(sum(BDs_u2))/sum(pulsenum_u2)
errorbar(2,BDR_u2,sigBDR_u2,'. b')
hold on
%sector3
pulsenum_l3 = pulsenum38(2:7);
BDs_l3 = BDs38(2:7);

BDR_l3 = sum(BDs_l3)/sum(pulsenum_l3)
sigBDR_l3 = sqrt(sum(BDs_l3))/sum(pulsenum_l3)
errorbar(3,BDR_l3,sigBDR_l3,'. r')
hold on

pulsenum_u3 = pulsenumU38(1:6);
BDs_u3 = BDsU38(1:6);

BDR_u3 = sum(BDs_u3)/sum(pulsenum_u3)
sigBDR_u3 = sqrt(sum(BDs_u3))/sum(pulsenum_u3)
errorbar(3,BDR_u3,sigBDR_u3,'. b')
hold on
%sector4
pulsenum_l4 = pulsenum41(1:3);
BDs_l4 = BDs41(1:3);

BDR_l4 = sum(BDs_l4)/sum(pulsenum_l4)
sigBDR_l4 = sqrt(sum(BDs_l4))/sum(pulsenum_l4)
errorbar(4,BDR_l4,sigBDR_l4,'. r')
hold on

pulsenum_u4 = pulsenumU41(5:7);
BDs_u4 = BDsU41(5:7);

BDR_u4 = sum(BDs_u4)/sum(pulsenum_u4)
sigBDR_u4 = sqrt(sum(BDs_u4))/sum(pulsenum_u4)
errorbar(4,BDR_u4,sigBDR_u4,'. b')
hold on
%sector5
pulsenum_l5 = pulsenum38(11:13);
BDs_l5 = BDs38(11:13);

BDR_l5 = sum(BDs_l5)/sum(pulsenum_l5)
sigBDR_l5 = sqrt(sum(BDs_l5))/sum(pulsenum_l5)
errorbar(5,BDR_l5,sigBDR_l5,'. r')
hold on

pulsenum_u5 = pulsenumU38(9:13);
BDs_u5 = BDsU38(9:13);

BDR_u5 = sum(BDs_u5)/sum(pulsenum_u5)
sigBDR_u5 = sqrt(sum(BDs_u5))/sum(pulsenum_u5)
errorbar(5,BDR_u5,sigBDR_u5,'. b')
hold off

%% 5 main sections at stable BDR, scaled with average gradient
figure
%sector 1
pulsenum_l1 = pulsenum43(1:3);
BDs_l1 = BDs43(1:3);

BDR_l1 = sum(BDs_l1)/sum(pulsenum_l1)
BDR_l1 = BDR_l1/((75)^30)
sigBDR_l1 = sqrt(sum(BDs_l1))/sum(pulsenum_l1)
sigBDR_l1 = sigBDR_l1/((75)^30)
errorbar(1,BDR_l1,sigBDR_l1,'. r')
hold on

pulsenum_u1 = pulsenumU43(1:3);
BDs_u1 = BDsU43(1:3);

BDR_u1 = sum(BDs_u1)/sum(pulsenum_u1)
BDR_u1 = BDR_u1/((100)^30)
sigBDR_u1 = sqrt(sum(BDs_u1))/sum(pulsenum_u1)
sigBDR_u1 = sigBDR_u1/((100)^30)
errorbar(1,BDR_u1,sigBDR_u1,'. b')
hold on 
%sector2
pulsenum_l2 = pulsenum43(4:9);
BDs_l2 = BDs43(4:9);

BDR_l2 = sum(BDs_l2)/sum(pulsenum_l2)
BDR_l2 = BDR_l2/((75)^30)
sigBDR_l2 = sqrt(sum(BDs_l2))/sum(pulsenum_l2)
sigBDR_l2 = sigBDR_l2/((75)^30)
errorbar(2,BDR_l2,sigBDR_l2,'. r')
hold on

pulsenum_u2 = pulsenumU43(4:10);
BDs_u2 = BDsU43(4:10);

BDR_u2 = sum(BDs_u2)/sum(pulsenum_u2)
BDR_u2 = BDR_u2/((100)^30)
sigBDR_u2 = sqrt(sum(BDs_u2))/sum(pulsenum_u2)
sigBDR_u2 = sigBDR_u2/((100)^30)
errorbar(2,BDR_u2,sigBDR_u2,'. b')
hold on
%sector3
pulsenum_l3 = pulsenum38(2:7);
BDs_l3 = BDs38(2:7);

BDR_l3 = sum(BDs_l3)/sum(pulsenum_l3)
BDR_l3 = BDR_l3/((68.5)^30)
sigBDR_l3 = sqrt(sum(BDs_l3))/sum(pulsenum_l3)
sigBDR_l3 = sigBDR_l3/((68.5)^30)
errorbar(3,BDR_l3,sigBDR_l3,'. r')
hold on

pulsenum_u3 = pulsenumU38(1:6);
BDs_u3 = BDsU38(1:6);

BDR_u3 = sum(BDs_u3)/sum(pulsenum_u3)
BDR_u3 = BDR_u3/((95)^30)
sigBDR_u3 = sqrt(sum(BDs_u3))/sum(pulsenum_u3)
sigBDR_u3 = sigBDR_u3/((95)^30)
errorbar(3,BDR_u3,sigBDR_u3,'. b')
hold on
%sector4
pulsenum_l4 = pulsenum41(1:3);
BDs_l4 = BDs41(1:3);

BDR_l4 = sum(BDs_l4)/sum(pulsenum_l4)
BDR_l4 = BDR_l4/((74)^30)
sigBDR_l4 = sqrt(sum(BDs_l4))/sum(pulsenum_l4)
sigBDR_l4 = sigBDR_l4/((74)^30)
errorbar(4,BDR_l4,sigBDR_l4,'. r')
hold on

pulsenum_u4 = pulsenumU41(5:7);
BDs_u4 = BDsU41(5:7);

BDR_u4 = sum(BDs_u4)/sum(pulsenum_u4)
BDR_u4 = BDR_u4/((99)^30)
sigBDR_u4 = sqrt(sum(BDs_u4))/sum(pulsenum_u4)
sigBDR_u4 = sigBDR_u4/((99)^30)
errorbar(4,BDR_u4,sigBDR_u4,'. b')
hold on
%sector5
pulsenum_l5 = pulsenum38(11:13);
BDs_l5 = BDs38(11:13);

BDR_l5 = sum(BDs_l5)/sum(pulsenum_l5)
BDR_l5 = BDR_l5/((68.5)^30)
sigBDR_l5 = sqrt(sum(BDs_l5))/sum(pulsenum_l5)
sigBDR_l5 = sigBDR_l5/((68.5)^30)
errorbar(5,BDR_l5,sigBDR_l5,'. r')
hold on

pulsenum_u5 = pulsenumU38(9:13);
BDs_u5 = BDsU38(9:13);

BDR_u5 = sum(BDs_u5)/sum(pulsenum_u5)
BDR_u5 = BDR_u5/((95)^30)
sigBDR_u5 = sqrt(sum(BDs_u5))/sum(pulsenum_u5)
sigBDR_u5 = sigBDR_u5/((95)^30)
errorbar(5,BDR_u5,sigBDR_u5,'. b')
hold off