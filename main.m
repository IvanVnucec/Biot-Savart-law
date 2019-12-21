% X, Y, and Z MESH
x_start =  -2;
x_stop  =   2;
x_inst  =  20;

y_start =  -2;
y_stop  =   2;
y_inst  =  20;

z_start =  -2;
z_stop  =   2;
z_inst  =   20;

% PARAMETRIZATION VARIABLE
x = linspace(x_start, x_stop, x_inst);
y = linspace(y_start, y_stop, y_inst);
z = linspace(z_start, z_stop, z_inst);

line = define_line([0, 0, 0]', [0, 0, 1]', 1, 2000);

[curve, dl] = define_curve(line);

[B_abs, B_x, B_y, B_z] = b_calc(x, y, z, curve, dl);
% [B_abs, B_x, B_y, B_z] = b_calc_par(x, y, z, curve, dl);

slice(x, y, z, log(B_abs), [0], [0], []);
shading interp