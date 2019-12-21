% X, Y, and Z MESH
x_start =  -2;
x_stop  =   2;
x_inst  =  40;

y_start =  -2;
y_stop  =   2;
y_inst  =  40;

z_start =  -5;
z_stop  =   5;
z_inst  =  40;

% PARAMETRIZATION VARIABLE
x = linspace(x_start, x_stop, x_inst);
y = linspace(y_start, y_stop, y_inst);
z = linspace(z_start, z_stop, z_inst);

%define_coil(c_point, R, N, L, inst)
line = define_coil([0, 0, -4]', 0.5, 5, 7, 1000);

[curve, dl] = define_curve(line);

[B_abs, B_x, B_y, B_z] = b_calc(x, y, z, curve, dl);

% This is the same function as above but uses paralel for loop for speedup.
% [B_abs, B_x, B_y, B_z] = b_calc_par(x, y, z, curve, dl);


%draw magnetic field
slice(x, y, z, log(B_abs), [0], [0], []);
shading interp

% draw coil
hold on
plot3(line(1, :), line(2, :), line(3, :), 'Color', 'r', 'LineWidth', 2);