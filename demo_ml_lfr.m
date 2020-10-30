%DEMO_ML_LFR - Finds communities of multilayer LFR benchmark using samSC.
%Performance of samSC is compared to regular SC on 40 realization of the 
%benchmark. Multilayer LFR benchmark constructed with 5 layers, 200 nodes at 
%each layer. Mixing coefficient is 0.5 and probability of within-layer 
%communities forming an across-layer community is 0.5. For the remaining details 
%about how the benchmark networks are constructed see [1]. 
%
%   Other m-files required: sam_sc.m, spectral_clustering.m, calc_nmi.m
%   MAT-files required: ml_lfr_mu-0.5_alpha-0.5.mat
%
%   References:
%       [1] Karaaslanli, Abdullah, and Selin Aviyente. "Strength Adjusted 
%           Multilayer Spectral Clustering." 2019 IEEE 29th International 
%           Workshop on Machine Learning for Signal Processing (MLSP). IEEE, 2019.

%   Author: Abdullah Karaaslanli
%   Address: Michigan State University, ECE
%   email: karaasl1@msu.edu
%   Website: http://www.abdkarr.github.io
%   Date: 30-Oct-2020; Last revision: 30-Oct-2020
%
%   Copyright (c) 2020, Abdullah Karaaslanli
%   All rights reserved.

clear;

% load simulated multilayer networks: adjacencies, n_comms, gt_comms
load('ml_lfr_mu-0.5_alpha-0.5.mat');

n_exp = length(adjacencies);

nmi_sam_sc = zeros(1, n_exp);
nmi_ncut = zeros(1, n_exp);
for e=1:n_exp
    % find communities with samsc
    c_sam_sc = sam_sc(adjacencies{e}, n_comms{e});
        
    % find communities with regular spectral_clustering
    c_ncut = spectral_clustering(normalized_laplacian(cell2mat(adjacencies{e})), ...
        n_comms{e}, true);
    
    % NMIs
    nmi_sam_sc(e) = calc_nmi(c_sam_sc, gt_comms{e});
    nmi_ncut(e) = calc_nmi(c_ncut, gt_comms{e});    
end

fprintf('NMI value of communities found by samSC: %.3f(+-%.3f)\n', ...
    mean(nmi_sam_sc), std(nmi_sam_sc));
fprintf('NMI value of communities found by regular SC: %.3f(+-%.3f)\n', ...
    mean(nmi_ncut), std(nmi_ncut));

