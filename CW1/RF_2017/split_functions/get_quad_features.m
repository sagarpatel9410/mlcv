% Simple Function Assumes that the Input Data has 2 Dimensions, x1 and x2
% Output will have [x1, x2, x1x2, x1^2, x2^2]
function feats=get_quad_features(data)
    feats=[data(:,1), data(:,2), data(:,1).*data(:,2), data(:,1).^2, data(:,2).^2];
end