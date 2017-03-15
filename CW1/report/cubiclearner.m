%cubic feature learner
function [idx_, dim, t] = cube_feature_learner( ~, data )

    % transform into feature vector 
    non_linear_feat=get_cubic_features(data);
    
    % get maximum and minima along all axis
    axis_max=max(non_linear_feat);
    axis_min=min(non_linear_feat);
    
    % initialise normal to plane in 9 directions
    dim = zeros(size(non_linear_feat,2),1);
    
    % generate random points along the 9 axis
    for i=1:size(non_linear_feat,2)
        dim(i)=axis_min(i)+rand*(axis_max(i)-axis_min(i));
    end
    
    % determine threshold
    t = [dim(1) 0 0 0 0 0 0 0 0]*dim;
    
    % Pick a random value within the range as threshold
    idx_ = non_linear_feat*dim < t;

end

% Simple Function Assumes that the Input Data has 2 Dimensions, x1 and x2
% Output will have [x1, x2, x1x2, x1^2, x2^2, (x1^2)x2, x1(x2^2), x1^3, x2^3]
function feats=get_cubic_features(data)
    feats=[data(:,1), data(:,2), data(:,1).*data(:,2), data(:,1).^2, data(:,2).^2, (data(:,1).^2).*data(:,2), data(:,1).*(data(:,2).^2), data(:,1).^3, data(:,2).^3];
end