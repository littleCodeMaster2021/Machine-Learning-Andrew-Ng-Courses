function [J_history, thetaZero] = MiniBatchGradient(theta, X, y,alpha,lambda,b)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
% b is number of example per batch
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
% You need to return the following variables correctly 
J_history = zeros(floor(m/b),1);

predictions =  sigmoid(X*theta);
thetaZero = theta;
thetaZero(1) = 0;
% Another way for Cost function and gradient descent function
for i = 1: b:(floor(m/b)-1)*b+1
     thetaZero= thetaZero- alpha*(1/b*((X(i:i+b-1,:))'*(predictions(i:i+b-1,:) -...
     y(i:i+b-1,:)))+ lambda / m * thetaZero);
     J_history(((i-1)/b +1)) = (1 / m) * (-y' * log(predictions) - (1 - y') * log(1 - predictions))...
    +(lambda / (2 * m)) *(thetaZero'*thetaZero);
% =============================================================
thetaZero = thetaZero(:);
end
end