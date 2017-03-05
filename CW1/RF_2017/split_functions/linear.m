function [idx_, dim, t] = linear( D, data )

    dim = randperm(D-1);
    
    % Find the data range of this dimension
    d_min = single(min(data(:,dim))) + eps; 
    d_max = single(max(data(:,dim))) - eps;
    
    % Pick a random value within the range as threshold
    t = d_min + rand*((d_max-d_min));
    idx_ = (data(:,dim(1)) - data(:,dim(2))) < t;

end

