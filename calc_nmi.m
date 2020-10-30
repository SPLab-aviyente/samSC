function nmi = calc_nmi(cl1, cl2)
%CALC_NMI - Calculates NMI between two different community structures. NMI 
%is a metric to measure how much two community structure resembles each
%other. See [1].
%
%   Inputs:
%       cl1 - First community structure
%       cl2 - Second community structures
%
%   Outputs:
%       nmi - Calculated NMI value
%
%   Other m-files required: confusion_matrix.m
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: 
%
%   References:
%       [1] L. Danon, A. Díaz-Guilera, J. Duch, and A. Arenas, “Comparing 
%           community structure identification,” Journal of Statistical 
%           Mechanics: Theory and Experiment, vol. 2005, no. 09, 
%           pp. P09008–P09008, Sep. 2005, doi: 10.1088/1742-5468/2005/09/P09008.

%   Author: Abdullah Karaaslanli
%   Address: Michigan State University, ECE
%   email: karaasl1@msu.edu
%   Website: http://www.abdkarr.github.io
%   Date: 17-Oct-2020; Last revision: 17-Oct-2020
%
%   Copyright (c) 2020, Abdullah Karaaslanli
%   All rights reserved.

C = confusion_matrix(cl1,cl2);

N = sum(sum(C));
rowsum = sum(C, 2);
colsum = sum(C, 1);

r = size(C, 1);
c = size(C, 2);

numer = 0;
for i=1:r
    for j=1:c
        if C(i, j) ~= 0
            numer = numer+C(i,j)*log(C(i, j)*N/(rowsum(i)*colsum(j)));
        end
    end
end

denom = 0;
for i=1:r
    if rowsum(i) ~= 0
        denom = denom + rowsum(i)*log(rowsum(i)/N);
    end
end
for j=1:c
    if colsum(j) ~= 0
        denom = denom + colsum(j)*log(colsum(j)/N);
    end
end

nmi = -2*numer/(denom+eps);

end
