u0 = 4*pi*10^-7;

x_start =  -2;
x_stop  =   2;
x_inst  =  50;

y_start =  -2;
y_stop  =   2;
y_inst  =  50;

z_start =   -0.5;
z_stop  =   14;
z_inst  =  50;

t_start =    0;
t_stop  = 4*pi;
t_inst  =  20000;
w = 20;
I = 5;

t = linspace(t_start, t_stop, t_inst);
dt = abs(abs(t_start)-abs(t_stop))/t_inst;

r_t = [cos(w*t); sin(w*t); t];

dl = diff(r_t, 1, 2);
dl(:, t_inst) = dl(:, t_inst-1);

x = linspace(x_start, x_stop, x_inst);
y = linspace(y_start, y_stop, y_inst);
z = linspace(z_start, z_stop, z_inst);

[X, Y, Z] = meshgrid(x, y, z);

B_abs = zeros(x_inst, y_inst, z_inst);
B_x = zeros(x_inst, y_inst, z_inst);
B_y = zeros(x_inst, y_inst, z_inst);
B_z = zeros(x_inst, y_inst, z_inst);

tic
for i = 1: x_inst
    for j = 1: y_inst
        for k = 1: z_inst
            r = [x(i); y(j); z(k)];
            
            R = r - r_t;
            
            dB = my_cross(dl, R);
            
            R_norm = sum(R.*R, 1);
            R_norm = realsqrt(R_norm);
            R_den = R_norm.*R_norm.*R_norm;
            
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

figure(1);
slice(X, Y, Z, log(B_abs), [], [0], []);
shading interp