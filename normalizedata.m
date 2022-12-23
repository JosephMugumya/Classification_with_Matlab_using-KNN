function [data] = normalizedata(data, std, mean) 
    for i = 1: (size(data, 2))
        data(:, i) = data(:, i) - mean(1, i);
        data(:, i) = data(:, i) / std(1, i) ;
    end   
end

%Normalized data by using standard scailing (x'=(x-mu)/sd)
