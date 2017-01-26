function [ BDR, sigBDR ] = BDRcalc( pulsenum, BDs )
%   Get data for BDR plotting, works with arrays as well
%
%   Inputs:
%       - pulsenum: pulse number for the run
%       - BDs:      overall number of good BDs per run
% 
%   Outputs:
%       - BDR:                  array of BDRs of the runs
%       - sigBDR:               standard deviation of BDR, according Poisson's
%                                   distribution
% 
%   Last modified 13.10.2016 by Eugenio Senes

%BDR calculation
BDR = BDs ./ pulsenum;
sigBDR = sqrt(BDs) ./ pulsenum;

end