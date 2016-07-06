function [r] = rank(data) 

%This gives us the ranking of the entries but assigns repeats with the same
%value and only goes one value up for the next rank
[~, ~, ranking] = unique(data)

%This ranks in accordance to usual rank function i.e. [3; 1; 2] says that
%the smallest number is in the third place, the second smallest is in the
%first place and the largest number is in the second place
[~, sorting] = sort(data)

%This uses the sorting and ranking vector to create a ranking with unique
%values
mean_ranks = accumarray(ranking(:), sorting(sorting), [], @mean)

%This assigns the nonunique entries the same averaged ranking
ranking = mean_ranks(ranking)

%This floors each value
frank = floor(ranking)

end
