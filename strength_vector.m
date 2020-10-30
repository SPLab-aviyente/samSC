function S = strength_vector(A)
%STRENGTH_VECTOR - Returns strength vector of layer-nodes of an undirected
%multilayer network. Strength vector of a layer-node is an L dimensional vector 
%with L(i) equals to sum of weights of connections the layer-node makes with 
%nodes in ith layer. L is number of layers.
%
%   Inputs:
%       A - LxL cell array of intra- and inter-layer adjacency matrix of the
%       multilyaer graph. A{i,i} is the intra-layer adjacency matrix of ith
%       layer. A{i,j} is inter-layer adjacency matrix between layer i and j
%       when i is not equal to j. If your multilayer graph is weighted, then
%       provide weighted adjacency matrix as A.
%
%   Outputs:
%       S - nxL dimensional matrix, where S(i, :) is the strength vector of ith
%       layer-node. n is the number of layer-nodes in the multilayer graph.
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

S = cellfun(@(x) sum(x, 2), A, 'UniformOutput', false);
S = cell2mat(S);

end
