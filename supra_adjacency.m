function As = supra_adjacency(A)
%SUPRA_ADJACENCY - Returns supra-adjacency matrix of a multilayer graph.
%
%   Inputs:
%       A - LxL cell array of intra- and inter-layer adjacency matrix of the
%       multilyaer graph. A{i,i} is the intra-layer adjacency matrix of ith
%       layer. A{i,j} is inter-layer adjacency matrix between layer i and j
%       when i is not equal to j. If your multilayer graph is weighted, then
%       provide weighted adjacency matrix as A.
%
%   Outputs:
%       As - nxn supra-adjacency matrix, where n is the number of layer-nodes.
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

As = cell2mat(A);

end
