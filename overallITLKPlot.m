%% GENERATE INTERLOCK CHECK PLOTS
close all; clc; clearvars;
%include folder to path
[dirpath,~,~]=fileparts(mfilename('fullpath'));
addpath(genpath(dirpath))

%load
uiload

%convert the timestamp in a format that the function likes
ts_lst = zeros(1,length(BDs_ts_full)); ts = 0;
for k=1:length(BDs_ts_full)
    [~, ts] = getFileTimeStamp(BDs_ts_full{k});
    ts_lst(k) = ts;
end

%generate the plot
interlock_BDcell(ts_lst, edge_delay_full)