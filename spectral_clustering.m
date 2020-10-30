function C = spectral_clustering(A, K, do_minimize)
%SPECTRAL_CLUSTERING - Find community structure of a given undirected graph by
%applying spectral clustering to its provided matrix.
%
%   Inputs:
%       A - Matrix to which spectral clustering should be applied.
%       K - The candidate set of number of communities in the graph. A community
%       structure will be found for each value in K.
%       do_minimize - Boolean. If true eigenvectors corresponding to smallest
%       eigenvalues of A will be used in k-means. Default is false.
%
%   Outputs:
%       C - nxk matrix of community assignment, where k=length(K). C(:, i) is
%       the community structure of the multilayer graph when number of
%       communities is K(i).
%
%   Examples:
%       Line 1 of example
%       Line 2 of example
%       Line 3 of example
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
%
%   References:
%       [1]

%   Author: Abdullah Karaaslanli
%   Address: Michigan State University, ECE
%   email: karaasl1@msu.edu
%   Website: http://www.abdkarr.github.io
%   Date: 25-Oct-2020; Last revision: 25-Oct-2020
%
%   Copyright (c) 2020, Abdullah Karaaslanli
%   All rights reserved.

% Is do_minimize provided?
if nargin < 3
    do_minimize = false;
end

n = size(A, 1); % number of nodes 

% eigendecomposition
[V, e] = eig(A, 'vector');

% find communities
C = zeros(n, length(K));
for i=1:length(K)
    % Which eigenvectors to use: smallest or largest?
    if do_minimize
        [~, eig_indx] = mink(e, K(i));
    else
        [~, eig_indx] = maxk(e, K(i));
    end
    
    C(:, i) = kmeans(V(:, eig_indx), K(i), 'Replicates', 10);
end

end
