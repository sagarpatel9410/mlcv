% Simple Function Assumes that the Input Data has 2 Dimensions, x1 and x2
% Output will have [x2, x1, x1^2]
function feats=get_quad_features(data)
    feats=[data(:,2), data(:,1), data(:,1).^2];
end
