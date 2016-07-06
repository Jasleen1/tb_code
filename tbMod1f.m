function [T,U] = tbMod1f(n,I,u_0,p,tend)
% takes in n, number of nodes, 
% I, an nxn matrix of influence between the nodes (colSum = 1)
% p, a vector of zealots for each node
% initial conditions u_0
% and tend, the length of time for which we want to solve the system of 2n
% ODEs. 
% Returns [T,U], a matrix with first column = time steps, the remaining n
% colums equal to the nA values, and the next n+1:2n values equal to the nB
% values.

% we construct the right hand side of the system 
% using matrix algebra.
% here, u(1:n) = nAs, u(n+1:2n) are the nBs.

rhs = @(t, u) [(1 - u(1:n) - u((n+1):(2*n)) - p).*(I*(u(1:n) + p)) ...
    - u(1:n).*(I*u((n+1):(2*n)));
    (1 - u(1:n) - u((n+1):(2*n)) - p).*(I*u((n+1):(2*n))) ...
    - u((n+1):(2*n)).*(I*(u(1:n) + p))];

% we solve the system using ode45
[T,U] = ode45(@(t,u) rhs(t,u),[0:0.1:tend], u_0);

end