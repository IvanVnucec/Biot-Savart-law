function r = define_custom_curve(c_point, R, N, L, inst)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

t = linspace(0, 40*pi, inst);

x = (3 + cos(sqrt(32)*t)).*cos(t);
y = sin(sqrt(32) * t);
z = (3 + cos(sqrt(32)*t)).*sin(t);

r = [x; y; z];

end


