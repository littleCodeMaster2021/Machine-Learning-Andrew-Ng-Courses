function idx = findClosestCentroids(X, centroids)
%takes the data matrix X(a,b) and the locations of all centroids(x1,y1)inside
%centroids and should output a one-dimensional array idx that holds the
%index the closest centroids in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% get the min value per row and corresponding index (which should be the centroid id)
%[minValues,idx]=min(distances,[],2); % 2 is for each row

% Restore broadcasting
%warning ("on", "Octave:broadcast");

% calculate all Euclidian distances betweek all X and all centroids (a^2 + b^2 = c^2)
%distances = sqrt(((X(:,1) - centroids(:,1)').^2) + ((X(:,2) - centroids(:,2)').^2));

for i = 1:length(idx)
    distance = zeros(K, 1);
    for j = 1:K
        % Euclidian distances
        distance(j)= sqrt(((X(i,1) - centroids(j,1)).^2) + ((X(i,2) - centroids(j,2)).^2));
    end
    [value, idx(i)] = min(distance); % K*1 matrix
end

% =============================================================

end

