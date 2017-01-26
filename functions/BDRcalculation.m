function [ BDR, sigBDR, startDateStr, startDateNum_double, endDateStr, endDateNum_double ] ...
                       = BDRcalculation( pulsenum, BDs, tst )
%   Get data for BDR plotting, every element of the array is the result of
%   a run
%
%   Inputs:
%       - pulsenum: pulse number for the run
%       - BDs:      overall number of good BDs per run
%       - tstamps:  timestamps in the format ddmmm - ddmmm
% 
%   Outputs:
%       - BDR:                  array of BDRs of the runs
%       - sigBDR:               standard deviation of BDR, according Poisson's
%                                   distribution
%       - startDateStr:         date string containing the start date of the run
%       - startDateNum_double:  same but diuble instead of cell
% 
%   Last modified 03.10.2016 by Eugenio Senes

%BDR calculation
BDR = BDs ./ pulsenum;
sigBDR = sqrt(BDs) ./ pulsenum;

%to date conversion
startDateStr = cell(1,length(tst));
startDateNum = cell(1,length(tst));

for k=1:length(tst)
    currStart = strsplit(tst{k},' ');
    startDateStr{k} = [currStart{1} '2016'];
    startDateNum{k} =  datenum(startDateStr{k},'ddmmmyyyy');
end
startDateNum_double = cell2mat(startDateNum);



end

