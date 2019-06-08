function r = define_coil(c_point, dir, R, N, l, inst)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

dir = dir ./ norm(dir);

% circle_inst = inst / N;
% dl = (l / N) * dir;
% 
% r = [];
% for i = 1:N
%     r_i = define_cicrle(c_point, dir, R, circle_inst);
%     r = cat(2, r, r_i);
%     c_point = c_point + dl;
% end

t = linspace(0, 2*pi, inst);

x = R*cos(N*t);
y = R*sin(N*t);
z = t * l/(2*pi);

r = [x; y; z];

n = [0, 0, 1]';

alpha = vect_angle([0, 0, 1]', dir);
beta  = vect_angle([0, 1, 0]', dir);
gamma = vect_angle([1, 0, 0]', dir);

r = vect_rot_zxy(r, alpha, beta, gamma) + c_point;
end

function angle = vect_angle(vect1, vect2)
angle = acos(dot(vect1, vect2)/(norm(vect1)*norm(vect2)));
end