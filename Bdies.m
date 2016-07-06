function [b] = Bdies(A, vertex, p_val, tend)
% takes in influence matrix, A
% vertex to infect
% p_value at the infected vertex
% tend, how long to until "eq" (equilibrium)
% returns boolean, 1 if bs died
    n = length(A);
    [u_init, p_init] = initU(n, vertex, p_val);
    [T, U] = tbMod1f(n,A,u_init,p_init,tend);
    bs = U(length(U),(n+1):(2*n));
    avgb = mean(bs);
    if avgb < 1*(10^(-7)),
        b = 1;
    else
        b = 0;
    end  
end