function [ C ] = my_cross( A, B )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

C = zeros(3, length(A));

C(3, :) = A(1, :).*B(2, :) - A(2, :).*B(1, :);
C(1, :) = A(2, :).*B(3, :) - A(3, :).*B(2, :);
C(2, :) = A(3, :).*B(1, :) - A(1, :).*B(3, :);

end

