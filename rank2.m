function [v] = rank2(data)
    [~,r] = sort(data);
    v = [];
    for i = 1:length(data),
        j = r(i);
        v(j) = i;
    end
end