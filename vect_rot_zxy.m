function rvector = vect_rot_zxy(vector, alpha, beta, gamma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Rz = rot_z(alpha);
Ry = rot_y(beta);
Rx = rot_x(gamma);

rvector = Rz * Ry * Rx * vector;
end

function Rz = rot_z(a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Rz = [cos(a), -sin(a), 0;
      sin(a),  cos(a), 0;
        0   ,    0   , 1];
end

function Ry = rot_y(a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Ry = [cos(a),    0   , sin(a);
        0   ,    1   ,      0;
     -sin(a),    0   , cos(a)];
end

function Rx = rot_x(a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Rx = [1 ,  0     ,       0;
      0 , cos(a) , -sin(a);
      0 , sin(a) , cos(a)];
end

