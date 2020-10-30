function C = sam_sc(A, K)
%SAM_SC - Find communities of an undirected multilayer graph using strength
%adjusted multilayer spectral clustering (samSC) [1]. samSC finds communities of
%a multilayer network by first modifying edge weights of the multilayer graph
%with layer preferences of layer-nodes. Layer-preference of a layer-node is a
%measure that indicates how much a layer-node prefers make a connection with a 
%particular layer compared to other layers. 
%
%   Inputs:
%       A - LxL cell array of intra- and inter-layer adjacency matrix of the
%       multilyaer graph. A{i,i} is the intra-layer adjacency matrix of ith
%       layer. A{i,j} is inter-layer adjacency matrix between layer i and j
%       when i is not equal to j. If your multilayer graph is weighted, then
%       provide weighted adjacency matrix as A.
%       K - The candidate set of number of communities in the mutlilayer graph.
%       A community structure will be found for each value in K.
%
%   Outputs:
%       C - nxk matrix of community assignment, where k=length(K). C(:, i) is
%       the community structure of the multilayer graph when number of
%       communities is K(i).
%
%   Other m-files required: strength_vector.m, n_nodes_per_layer.m, 
%       modify_edges.m, supra_adjacency.m, normalized_laplacian.m, 
%       spectral_clustering.m
%
%   References:
%       [1] Karaaslanli, Abdullah, and Selin Aviyente. "Strength Adjusted 
%           Multilayer Spectral Clustering." 2019 IEEE 29th International 
%           Workshop on Machine Learning for Signal Processing (MLSP). IEEE, 
%           2019.

%   Author: Abdullah Karaaslanli
%   Address: Michigan State University, ECE
%   email: karaasl1@msu.edu
%   Website: http://www.abdkarr.github.io
%   Date: 25-Oct-2020; Last revision: 25-Oct-2020
%
%   Copyright (c) 2020, Abdullah Karaaslanli
%   All rights reserved.

S = strength_vector(A);

n = n_nodes_per_layer(A);

% normalize strength vectors by number of nodes per layer to remove biased
% pereference since a layer has more nodes
S = S./n';

% normalize strength vectors to have unit sum: layer preference
S = S./sum(S, 2);

A = modify_edges(A, S, n);

% Find communities by spectral clustering applied to supra-laplacian of modified
% edges
A = supra_adjacency(A);
C = spectral_clustering(normalized_laplacian(A), K, true);

end
