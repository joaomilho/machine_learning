function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
%g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
new_m = ones(0);
for col = 1:size(z,1)
  for row = 1:size(z,2)
    new_m(col,row) = 1 / (1 + e ^ (-z(col,row)));
  end
end
g = new_m;

% =============================================================

end
