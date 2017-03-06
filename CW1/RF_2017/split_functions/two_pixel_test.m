function [idx_, dim, t] = two_pixel_test( D, data )

    dim = randperm(D-1);
    d_min = single(min(data(:,1) - data(:,2))) + eps;
    d_max = single(max(data(:,1) - data(:,2))) - eps;
    
    % Pick a random value within the range as threshold
    t = d_min + rand*((d_max-d_min));
    idx_ = (data(:,1) - data(:,2)) < t;

end

