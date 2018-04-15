function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids coordinates by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point(a,b), a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);
% 
% for k = 1:K
%     xPos = find(idx == k); % row index array that plots are for k groups: k*1
%     if(size(xPos,1)>0)
%       avg = mean(X(xPos,:));
%       centroids(k, :) = avg;
%     end
% end

% More efficient way to do the job by vectorization calculation

binary_idx = zeros(K, m);
amount = zeros(K,1);

for i = 1:m
    binary_idx(idx(i),i)=1;
end
amount = sum(binary_idx,2);
centroids= (binary_idx*X)./amount;
    
end
