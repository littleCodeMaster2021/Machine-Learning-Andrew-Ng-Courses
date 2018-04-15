function [theta] = trainLinearReg(X, y, lambda)
%TRAINLINEARREG Trains linear regression given a dataset (X, y) and a
%regularization parameter lambda
%   [theta] = TRAINLINEARREG (X, y, lambda) trains linear regression using
%   the dataset (X, y) and regularization parameter lambda. Returns the
%   trained parameters theta.
%

% Initialize Theta: column
initial_theta = zeros(size(X, 2), 1); 

% Create "short hand" for the cost function to be minimized: t is theta 
% theta is the only variable
costFunction = @(t)linearRegCostFunction(X, y, t, lambda);

% Now, costFunction is a function that takes in only one argument
options = optimset('MaxIter', 200, 'GradObj', 'on');

% Minimize using fmincg to optimize the cost function[
[theta] = fmincg(costFunction, initial_theta, options);

end
