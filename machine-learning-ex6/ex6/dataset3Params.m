function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%   function sim = gaussianKernel(x1, x2, sigma)
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%trying values in multiplicative steps
%try all possible pairs of values for C and sigma: should has 8*8 results matrixs
%%SVMPREDICT returns a vector of predictions using a trained SVM model
%SVMTRAIN Trains an SVM classifier using a simplified version of the SMO 
%algorithm. 
testValues = [0.01, 0.03, 0.1, 0.3,  1, 3, 10, 30];
%function [model] = svmTrain(X, Y, C, kernelFunction, tol, max_passes)
%function pred = svmPredict(model, X)
% C is the standard SVM regularization parameter.  
results = [];

for loopC=1:length(testValues)
    for loopSigma=1:length(testValues)
      
      testC = testValues(loopC);
      testSigma = testValues(loopSigma);
      
      model= svmTrain(X, y, testC, @(x1, x2) gaussianKernel(x1, x2, testSigma)); 
      predictions = svmPredict(model, Xval);
      %the error is  the fraction of the cross validation examples that were classified incorrectly.
      testError = mean(double(predictions ~= yval));
      
      fprintf("C: %f\nsigma: %f\nerror: %f\n", testC, testSigma, testError);
      %save every result and parameters in different 
      results = [results; testC, testSigma, testError];
      
    end
end
% find the row index of min error
[minError, minIndex] = min(results(:,3));

C = results(minIndex,1);
sigma = results(minIndex,2);



fprintf("\n\nLeast error:\nC: %f\nsigma: %f\nerror: %f\n", C, sigma, minError);

% Wil return this one
% C: 0.300000
% sigma: 0.100000
% error: 0.035000

% but this one will work too
% C: 1.000000
% sigma: 0.100000
% error: 0.035000

% =========================================================================

end
