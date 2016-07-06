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
