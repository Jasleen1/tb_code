function m = irrStoch(n, method,diagonal,s)
% m = irrStoch(n, method,diagonal)
% irrStoch returns an irreducible square stochastic matrix of size n
% method 1 fills a matrix with random numbers, adds a matrix
% whose entries are some scaled version 1/n, so that it is strongly connected
% and if diagonal = 1, adds in an identity matrix to reinforce the inner
% loops. It scales the columns by their sum so that it is stochastic. 
% Method 2 is a graph-hop method that has not yet been implemented.

% Google's method for a random stochastic matrix.
if method == 1,
    % creates a matrix filled with random values
    m1 = eye(n);
    for i = 1:n,
        for j = 1:n,
            m1(i,j) = rand(1);
        end
    end
    
    % creates the google dampening matrix filled with 1 / n
    m2 = eye(n);
    for i = 1:n,
        for j = 1:n,
            m2(i,j) = 1 / n;
        end
    end
    m2 = .15 * m2; % .15 is our dampening factor, like google's
    
    % sum the matrices
    m = m1 + m2;
    
    if diagonal == 1,
        m = m + s*eye(n);
    else
        m = m;
    end
    
    % want to scale by column sum
    for i = 1:n, 
        m(:,i) = m(:,i) / sum(m(:,i));
    end
    
end
% method 2, Jasleen's "graph hop"
if method == 2,
    display('method 2 has not been designed yet')
end
end