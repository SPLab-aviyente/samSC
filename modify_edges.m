function A = modify_edges(A, S, n)
%MODIFY_EDGES - Modify edge weights of a multilayer graph with provided layer 
%preferences.
%
%   Inputs:
%       A - LxL cell array of intra- and inter-layer adjacency matrix of the
%       multilyaer graph. A{i,i} is the intra-layer adjacency matrix of ith
%       layer. A{i,j} is inter-layer adjacency matrix between layer i and j
%       when i is not equal to j. If your multilayer graph is weighted, then
%       provide weighted adjacency matrix as A.
%       S - NxL matrix of layer preferences, where N is the number of
%       layer-nodes. S(i, :) is the layer preferences of ith layer-node.
%       n - L dimensional vector of number of nodes at each layer.
%
%   Outputs:
%       A - LxL cell array of modified intra- and inter-adjacency matrices.
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: 
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

L = size(A, 1); % number of layers
n_begin = [0; cumsum(n)]; % index of first layer-node of each layer
for i=1:L
    i_nodes = n_begin(i)+(1:n(i));
    
    for j=i:L
        j_nodes = n_begin(j)+(1:n(j));
        
        A{i, j} = A{i, j}.*(S(i_nodes, j) + S(j_nodes, i)')/2;   
        A{j, i} = A{i, j}';
    end
end

end
