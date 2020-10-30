function L = normalized_laplacian(A)
%NORMALIZED_LAPLACIAN - Returns normalized Laplacian of an undirected graph.
%
%   Inputs:
%       A - Adjacency matrix of the graph. If your graph is weighted, provide
%       weighted adjacency matrix as input.
%
%   Outputs:
%       L - Normalized Laplacian of the graph
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: 

%   Author: Abdullah Karaaslanli
%   Address: Michigan State University, ECE
%   email: karaasl1@msu.edu
%   Website: http://www.abdkarr.github.io
%   Date: 25-Oct-2020; Last revision: 25-Oct-2020
%
%   Copyright (c) 2020, Abdullah Karaaslanli
%   All rights reserved.

n = size(A, 1); % number of nodes

% inverse degree matrix
d = sum(A, 1);
d = d.^-0.5;
d(isinf(d)) = 0;

% calculate Laplacian
L = eye(n) - diag(d)*A*diag(d);

end
