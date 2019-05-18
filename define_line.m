function r = define_line(start_point, dir, l, inst)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = dir ./ norm(dir);
end_point = l * n;

spx = start_point(1);
spy = start_point(2);
spz = start_point(3);
epx = end_point(1);
epy = end_point(2);
epz = end_point(3);

x = linspace(spx, epx, inst);
y = linspace(spy, epy, inst);
z = linspace(spz, epz, inst);

r = [x; y; z];
end
