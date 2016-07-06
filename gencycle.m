function m = gencycle(n, i)

%This generates a matrix with the i value along the diagonal
M = eye(n);
M = i*M;

%This inputs half of the external influence on to the corners
M(1,n) = (1-i)/2;
M(n,1) = (1-i)/2;

%This puts the other half of external influence on the off diagonals
for j=1:n, 
    for k=1:n,
        if abs((j-k))== 1
            M(j,k)= (1-i)/2
        end
    end
end

end