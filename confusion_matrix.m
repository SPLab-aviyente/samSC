function C = confusion_atrix(cl1, cl2)
%CONFUSIONMATRIX - Find confusion matrix between two community cstructure of a ...
%graph.
%
%   Inputs:
%       cl1 - First community structure
%       cl2 - Second community structures
%
%   Outputs:
%       C - K_1xK_2 confusion matrix, where K_1 and K_2 are number of
%       communities in cl1 and cl2, respectively.
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
%   Date: 17-Oct-2020; Last revision: 17-Oct-2020
%
%   Copyright (c) 2020, Abdullah Karaaslanli
%   All rights reserved.

comm_ids_1 = unique(cl1);
comm_ids_2 = unique(cl2);
K_1 = length(comm_ids_1);
K_2 = length(comm_ids_2);

% confusion matrix
C = zeros(K_1, K_2);

for i=1:K_1
     nodes_i = find(cl1==comm_ids_1(i)); % node set
    for j=1:K_2

        nodes_j = find(cl2==comm_ids_2(j)); % node set
         
        C(i,j)=length(intersect(nodes_i, nodes_j)); % number of common nodes
    end
end

end
