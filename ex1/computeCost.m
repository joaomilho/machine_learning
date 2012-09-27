function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 

accum = 0;
for i = 1:m
  % sprintf("T1 %f",theta(1))
  % sprintf("T2 %f",theta(2))
  % sprintf("Xi %f",X(i,2))
  h = theta(1) * X(i,1) + theta(2) * X(i,2);
  % sprintf("h %f",h)
  % sprintf("yi %f",y(i))
  ir = (h - y(i)) ^ 2;
  % sprintf("ir %f",ir)
  accum += ir;
  % sprintf("============")
end


% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


J = (1.0/(2.0*m)) * accum;
% =========================================================================

end