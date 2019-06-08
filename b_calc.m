function [B_abs, B_x, B_y, B_z] = b_calc(x, y, z, curve, dl)
%   b_calc Summary of this function goes here
%   Detailed explanation goes here

% CONSTANTS
u0 = 4*pi*10^-7;
I = 5;

B_abs = zeros(length(x), length(y), length(z));
B_x = zeros(length(x), length(y), length(z));
B_y = zeros(length(x), length(y), length(z));
B_z = zeros(length(x), length(y), length(z));

for i = 1: length(x)
    for j = 1: length(y)
        for k = 1: length(z)
            r = [x(i); y(j); z(k)];     % for every point r calculate field

            R = r - curve;              % calculate R for every point r_t               
            
            dB = my_cross(dl, R);       % dB for every point r over r_t 
            
            R_norm = realsqrt(sum(R.*R, 1));    % |R|
            R_den = R_norm.*R_norm.*R_norm;     % |R|^3
            
            dB = dB ./ R_den;
            B = u0/(4*pi) * I * sum(dB, 2);

            B_abs(i, j, k) = norm(B);
            B_x(i, j, k) = B(1);
            B_y(i, j, k) = B(2);
            B_z(i, j, k) = B(3);
        end
    end
end

B_x = permute(B_x, [2 1 3]);
B_y = permute(B_y, [2 1 3]);
B_z = permute(B_z, [2 1 3]);
B_abs = permute(B_abs, [2 1 3]);

end

