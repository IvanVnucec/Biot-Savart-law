function [curve, dl] = define_curve(varargin)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here

    curve = [];
    dl = [];

    for k = 1 : nargin
        r_k = varargin{k};

        % This function aproximates derivatives of adjecent elements
        dl_k = my_diff(r_k);

        curve = cat(2, curve, r_k);
        dl = cat(2, dl, dl_k);
    end
end

function out = my_diff(vect)
    out = diff(vect, 1, 2);

    out = cat(2, out, out(:, length(out)));
end

