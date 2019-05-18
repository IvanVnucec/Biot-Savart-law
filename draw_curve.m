function draw_curve(varargin)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    hold on
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    view(3);
    
    for k = 1 : nargin
        curve = varargin{k};

        plot3(curve(1,:), curve(2,:),curve(3,:), '-.', 'LineWidth', 2);
    end
    hold off
end

