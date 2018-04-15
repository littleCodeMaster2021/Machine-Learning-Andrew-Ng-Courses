function Z = projectData(X, U, K)
%dataset X, the principal components U, and the desired number of 
%dimensions to reduce to top k eigenvectors
%Computes the reduced data representation when projecting only 
%on to the top K columns of U. 
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K 
%               eigenvectors in U (first K columns). 
%               For the i-th example X(i,:), the projection on to the k-th 
%               eigenvector is given as follows:
%                    
%                    projection_k = X(i, :) * U(:, k);
%


U_reduce = U(:, 1:K);
Z = X * U_reduce;
% =============================================================

end
