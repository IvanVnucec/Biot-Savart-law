% CONSTANTS
u0 = 4*pi*10^-7;
I = 5;

% X, Y, and Z MESH
x_start =  -2;
x_stop  =   2;
x_inst  =  51;

y_start =  -2;
y_stop  =   2;
y_inst  =  52;

z_start =   -2;
z_stop  =   2;
z_inst  =  53;

% PARAMETRIZATION VARIABLE
x = linspace(x_start, x_stop, x_inst);
y = linspace(y_start, y_stop, y_inst);
z = linspace(z_start, z_stop, z_inst);

line = define_line([0, 0, 0]', [0, 0, 1]', 4, 100);
circle1 = define_cicrle([0, 0, 0]', [0, 0, 1]', 1, 500);
circle2 = define_cicrle([0, 0, 0]', [0, 1, 0]', 1, 500);

[curve, dl] = define_curve(circle1, circle2);
draw_curve(circle1, circle2, line);

[X, Y, Z] = meshgrid(x, y, z);

B_abs = zeros(x_inst, y_inst, z_inst);
B_x = zeros(x_inst, y_inst, z_inst);
B_y = zeros(x_inst, y_inst, z_inst);
B_z = zeros(x_inst, y_inst, z_inst);

tic
for i = 1: x_inst
    for j = 1: y_inst
        for k = 1: z_inst
            r = [x(i); y(j); z(k)];     % for every point r calculate field

            R = r - curve;                % calculate R for every point r_t               
            
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
toc

B_x = permute(B_x, [2 1 3]);
B_y = permute(B_y, [2 1 3]);
B_z = permute(B_z, [2 1 3]);
B_abs = permute(B_abs, [2 1 3]);

figure(2);
slice(X, Y, Z, log(B_abs), [0], [0], []);
shading interp