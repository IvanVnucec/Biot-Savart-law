function r = define_coil(c_point, R, N, L, inst)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

t = linspace(0, 2*pi, inst);

x = R * cos(N * t) + c_point(1);
y = R * sin(N * t) + c_point(2);
z = t * L / (2 * pi) + c_point(3);

r = [x; y; z];

end