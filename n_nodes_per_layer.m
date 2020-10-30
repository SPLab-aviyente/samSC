function n = n_nodes_per_layer(A)
%N_NODES_PER_LAYER - Returns number of nodes per layer.
%   Inputs:
%       A - LxL cell array of intra- and inter-layer adjacency matrix of the
%       multilyaer graph. A{i,i} is the intra-layer adjacency matrix of ith
%       layer. A{i,j} is inter-layer adjacency matrix between layer i and j
%       when i is not equal to j.
%
%   Outputs:
%       n - L dimensional column vector with n(i) is the number of nodes in 
%       layer i.
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

n = cellfun(@(x) size(x, 1), A(:, 1));

end
