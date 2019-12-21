% X, Y, and Z MESH (this specefies the drawing box
% x_inst is number of points from x_start to x_stop to calculate mag field.
x_start =  -5;
x_stop  =   5;
x_inst  =  30;

y_start =  -5;
y_stop  =   5;
y_inst  =  30;

z_start =  -5;
z_stop  =   5;
z_inst  =  30;

% PARAMETRIZATION VARIABLE
x = linspace(x_start, x_stop, x_inst);
y = linspace(y_start, y_stop, y_inst);
z = linspace(z_start, z_stop, z_inst);

% This functions calculates points on a coil curve
line = define_custom_curve(5000);

% This function calculates dl vectors
[curve, dl] = define_curve(line);

% This function calculates magnetic field with Bivot-Savart Law.
[B_abs, B_x, B_y, B_z] = b_calc(x, y, z, curve, dl);

% This is the same function as above but uses paralel for loop for speedup.
% [B_abs, B_x, B_y, B_z] = b_calc_par(x, y, z, curve, dl);

%============================== DRAWING ===================================
% Draw magnetic field
slice(x, y, z, log(B_abs), [0], [0], []);
shading interp

% Draw coil
hold on
plot3(line(1, :), line(2, :), line(3, :), 'Color', 'r', 'LineWidth', 2);