function [idx_, dim, t] = linear_learner( ~, data )

    % get maximum and miminum y - values
    y_min = single(min(data(:,2))) + eps;
    y_max = single(max(data(:,2))) - eps;
    
    % get maximum and miminum x - values
    x_min = single(min(data(:,1))) + eps;
    x_max = single(max(data(:,1))) - eps;
    
    % get random point on the y - axis, between min and max
    y = y_min+rand*(y_max-y_min);
    
    % get random point on the x - axis, between min and max
    x = x_min+rand*(x_max-x_min);
    
    
    % get normal to the line
    dim = [x; y];
    
    % determine threshold
    t = [x 0]*dim;
    
    % Pick a random value within the range as threshold
    idx_ = data(:,1:2)*dim < t;

end
