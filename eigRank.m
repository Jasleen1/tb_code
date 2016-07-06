function v = eigRank(m)
% eigRank takes a square irreducible stochastic matrix and returns
% a vector that ranks each "node" or row based on the values in its 
% stationary probability vector

[V,D] = eig(m, 'matrix');

n = length(m);

% I find the indices of the eigenvector matrix st its eignval=1
a=[];
for i = 1:n,
    if(abs(D(i,i) - 1.0000) < 1.0e-10);
        a = [a i]; % a is the index   
    end
end
stat_v = V(1:n,a); % eigenvect st its eignval = 1
stat_v = real(stat_v); % I only want the real part

% here's what we return
v = stat_v;

end

% Sorting Subfunction
function [r] = vrank(v)
    [s, r] = sort(v);
end
