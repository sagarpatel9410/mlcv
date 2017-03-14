function [idx_, dim, t] = linear_learner( ~, data )

    % get maximum and minima along all axis
    axis_max=max(data);
    axis_min=min(data);
    
    % initialise normal to plane in 5 dimenions
    dim = zeros(size(data,2),1);
    
    % generate random points along the 5 axis
    for i=1:size(data,2)
        dim(i)=axis_min(i)+rand*(axis_max(i)-axis_min(i));
    end
    
    % determine threshold
    t = [dim(1) 0 0 0 0]*dim;
    
    
    % Pick a random value within the range as threshold
    idx_ = data(:,1:end-1)*dim < t;

end
