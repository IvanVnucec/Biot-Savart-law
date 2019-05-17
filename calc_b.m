function [ B_X, B_Y, B_Z, B_ABS ] = calc_b( x, y, z, r_t, dt )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
numel_t = numel(r_t);

dl = diff(r_t, 1, 2)/dt;
dl(:, numel_t-1) = dl(:, numel_t-2);

numel_x = numel(x);
numel_y = numel(y);
numel_z = numel(z);

B_abs = zeros(numel_x, numel_y, numel_z);
B_x = zeros(numel_x, numel_y, numel_z);
B_y = zeros(numel_x, numel_y, numel_z);
B_z = zeros(numel_x, numel_y, numel_z);

for i = 1: numel_x
    for j = 1: numel_y
        for k = 1: numel_z
            r = [x(i); y(j); z(k)];
            
            R = r - r_t + [eps; eps; eps];
            
            R_norm = sum(R.^2, 1);
            R_norm = R_norm.^(3/2);
            
            dB = cross(dl, R, 1);
            dB = dB ./ R_norm;
            B =  sum(dB, 2);

            B_abs(i, j, k) = norm(B);
            B_x(i, j, k) = B(1)/norm(B);
            B_y(i, j, k) = B(2)/norm(B);
            B_z(i, j, k) = B(3)/norm(B);
        end
    end
end

B_X = permute(B_x, [2 1 3]);
B_Y = permute(B_y, [2 1 3]);
B_Z = permute(B_z, [2 1 3]);
B_ABS = permute(B_abs, [2 1 3]);

end

