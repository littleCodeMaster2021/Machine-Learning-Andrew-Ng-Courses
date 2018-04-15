function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)
% Useful values
m = size(X, 1);%number of training data
num_labels = size(Theta2, 1);
% You need to return the following variables correctly 
p = zeros(size(X, 1), 1); % #of training data rows by 1
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
% %%%%%%%%%%%%%%%%%%Method 1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for j=1:m %number of training data
% 	%first layer propagation
% 	a2 = sigmoid(X(j,:) * Theta1');% 1 by 25
% 	%bias to hidden layer
% 	a2 = [1 a2];% 1 by 26
% 	%hidden layer propagation and getting max 
% 	[max_columnvals,p(j,1)] = max((sigmoid(a2 * Theta2'))');% 10 by 1
% end

%%%%%%%%%%%% Method 2   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a2 = sigmoid(X * Theta1');
a2 = [ones(m,1) a2];
a3 = (sigmoid(a2 * Theta2'))';
[max_columnvals,p] = max(a3);
p = p';
% =========================================================================
end
