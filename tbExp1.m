%% true believers numerical experiment 1
% we want to test whether PageRank for nodes corresponds to the 
% number of zealots needed to infect the whole network.
% Step 1, create an irreducible stochastic matrix w/ colSum=1
% this becomes our influence matrix. 
% Step 2, calculate its eigenvector with eigenvalue=1
% Step 3, "rank" the nodes based on stationary values
% Step 4, infect each node with a value of zealots and increase the value 
% until it is critical, i.e., until it infects the entire network
% i.e., avg(nB) <= 1x10^-7 or some threshold.
% Step 5, take this matrix of critical Ps. 
% calculate the correlation between its ranking and the node ranking.
% Rinse, Wash, Repeat.
n = 10;
%% Step 1
m = irrStoch(n, 1);

% we find eigenvalues and vectors of our irreducible stochastic matrix
[V,D] = eig(m, 'matrix');

% I find the indices of the eigenvector matrix st its eignval=1
a=[];
for i = 1:n;
    if(abs(D(i,i) - 1.0000) < 1.0e-10);
        a = [a i]; % a is the index   
    end
end
stat_v = V(1:n,a); % eigenvect st its eignval = 1
stat_v = real(stat_v);
stat_v = stat_v / sum(stat_v); % I make it a stat. probability vect


function [r] = rank(v)
    [s, r] = sort(v);
end
