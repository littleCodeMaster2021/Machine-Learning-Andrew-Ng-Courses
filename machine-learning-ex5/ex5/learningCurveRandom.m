function [error_train, error_val] = ...
    learningCurveRandom(X, y, Xval, yval, lambda)
%learningCurveRandom(X_poly, y, X_poly_val, yval, lambda)
% Number of training examples
m = size(X, 1);
n= size(Xval,1);
l = min(m,n);
% You need to return these values correctly
error_train = zeros(l, 1);
error_val   = zeros(l, 1);

for i = 1: l
%randsample gets a i-by-1 vector of values sampled uniformly at random from the integers 1 to m.
rand_train = randsample(m,i);
rand_val = randsample(n,i);
%Randomly select i examples from the training set.
Xtrain = X([rand_train],:);
ytrain = y([rand_train]);

%Randomly select i examples from the cross validation set.

Xcv = Xval([rand_val],:);
ycv = yval([rand_val]);

%learn the parameters theta using the randomly chosen training set
theta = trainLinearReg(Xtrain, ytrain, lambda);	

%evaluate theta from randomly chosen training set and cross validation set
[Jtrain]=linearRegCostFunction(Xtrain,ytrain,theta,0); 
[Jval]=linearRegCostFunction(Xcv,ycv,theta,0);

% storage errors obtained after training on i examples.
error_train(i) = Jtrain;  
error_val(i) = Jval;
   
end

% =========================================================================

end