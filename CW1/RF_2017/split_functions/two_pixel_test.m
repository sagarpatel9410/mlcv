function [idx_, dim, t] = two_pixel_test( D, data )

    dim = randperm(D-1);
    d_min = single(min(data(:,dim(1)) - data(:,dim(2)))) + eps;
    d_max = single(max(data(:,dim(1)) - data(:,dim(2)))) - eps;
    
    t = d_min + rand*((d_max-d_min)); % Pick a random value within the range as threshold
    idx_ = (data(:,dim(1)) - data(:,dim(2))) < t;

end

