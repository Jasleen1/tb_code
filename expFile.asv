function [x, y] = expFile(n, k, tend)
% this the help page for expFile
    x = [];
    y = [];
    u = [];
    v = [];
     for i = n
         for j = 1:k
             disp(j);
             A = irrStoch(i, 1);
             r = eigRank(A);
             p_vals = findPs(A, tend);
             p = p_vals;
             x = [x, r];
             y = [y, p];
         end
     end
end



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

function [p] = findP(A, vertex, tend, startP, interval, repeat)
% takes in a matrix A of influences, a vertex and a tend and finds the
% least value of p ie number of zealots at the vertex for the entire B
% population on the graph to die.
    b = 0;
    i = 1;
    p = startP;
    while (b == 0 && p < 1+interval)
       b = Bdies(A, vertex, p, tend);
       p = p + interval;
       i = i + 1;
    end
    if repeat ~= 0
        p = findP(A, vertex, tend, p - 2*interval, interval/10, repeat - 1);
    end
end

function [b] = Bdies(A, vertex, p_val, tend)
% takes in influence matrix, A
% vertex to infect
% p_value at the infected vertex
% tend, how long to until "eq" 
% returns boolean, 1 if bs died
    n = length(A);
    [u_init, p_init] = initU(n, vertex, p_val);
    [T, U] = tbMod1f(n,A,u_init,p_init,tend);
    bs = U(length(U),(n+1):(2*n));
    avgb = mean(bs);
    if avgb < 1 - (1/16),
        b = 1;
    else
        b = 0;
    end  
end

function [u_init, p_init] = initU(n, vertex, p_val)
%Takes in an initial p_value and the vertex to infect, n= # of vertices on
%the graph and returns an initial p vector and u vector which have all Bs
%everywhere except the p_val on the specified vertex.
    u_init = [];
    p_init = [];
    for i = 1:n
       u_int(i) = 0;
       p_init(i) = 0;
    end
    
    p_init(vertex) = p_val;
    
    for i = (n+1):(2*n)
       u_init(i) = 1;
    end
        
    u_init(vertex) = 1 - p_val;
    u_init = u_init';
    p_init = p_init';
end

% function [r] = rank(v)
%     [s, r] = sort(v);
% end
