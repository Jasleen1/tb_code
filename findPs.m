function [p_vals] = findPs(A, tend)
% takes in an influence matrix and a tend and returns an array of the
% p_vals indexed the same as the vertices.
    n = length(A);
    p_vals = [];
    for i = 1:n
        p = findP(A, i, tend, 0, 10^(-1), 4);
        disp(p)
        p_vals(i) = p;
    end
end