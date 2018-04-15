function numgrad = computeNumericalGradient(J, theta)
%COMPUTENUMERICALGRADIENT Computes the gradient using "finite differences"
%and gives us a numerical estimate of the gradient.
%   numgrad = COMPUTENUMERICALGRADIENT(J, theta) computes the numerical
%   gradient of the function J around theta. Calling y = J(theta) should
%   return the cost function value at theta: [Theta1(:) ; Theta2(:)];
%   the ith element get changed              

numgrad = zeros(size(theta));
perturb = zeros(size(theta));
e = 1e-4;
for i = 1:numel(theta) % numel is the total number of elements in the vector
    % Set perturbation vector
    perturb(i) = e; % theta is an unroll parameters            
    loss1 = J(theta - perturb);
    loss2 = J(theta + perturb);
    % Compute Numerical Gradient
    numgrad(i) = (loss2 - loss1) / (2*e);
    perturb(i) = 0;
end

end
