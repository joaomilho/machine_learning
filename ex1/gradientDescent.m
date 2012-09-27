function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    %// last_cost = J_history(iter-1)
    %// temp0 = theta(1) - (alpha/m) * last_cost
    %// temp1 = theta(2) - (alpha/m) * last_cost

    %// theta = [temp0; temp1]
    theta = theta - (alpha/m) * X' * ((X * theta) - y);
    
    cost = computeCost(X, y, theta);
    

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = cost;

end

end
