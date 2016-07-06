function [M] = makeWheel(n, self_influence)
% Takes in a number of vertices n, and a self influence and returns a wheel
% centered at vertex 1 with each node having self influence given by the
% input and the influence of the center on every other verted is 1 -
% self_influence and the influence of every other vertex on the center is
% 1/(n-1)*self_influence
    M = self_influence*eye(n);
    center_i = 1 - self_influence;
    for i = 2:n
       M(1, i) = center_i; 
       M(i, 1) = (1/(n - 1))*center_i;
    end
end