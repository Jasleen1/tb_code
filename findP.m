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