%two pixel test
function [idx_, dim, t] = two_pixel_test( D, data )
    %generate two random dimensions
    dim = randperm(D-1);
    %find data range after applying two pixel test
    d_min = single(min(data(:,dim(1)) - data(:,dim(2)))) + eps;
    d_max = single(max(data(:,dim(1)) - data(:,dim(2)))) - eps;
    
    % Pick a random value within the range as threshold
    t = d_min + rand*((d_max-d_min));
    % return the index of the left node
    idx_ = (data(:,dim(1)) - data(:,dim(2))) < t;

end
