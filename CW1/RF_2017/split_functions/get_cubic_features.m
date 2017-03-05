% Simple Function Assumes that the Input Data has 2 Dimensions, x1 and x2
% Output will have [x1, x2, x1x2, x1^2, x2^2, (x1^2)x2, x1(x2^2), x1^3, x2^3]
function feats=get_cubic_features(data)
    feats=[data(:,1), data(:,2), data(:,1).*data(:,2), data(:,1).^2, data(:,2).^2, (data(:,1).^2).*data(:,2), data(:,1).*(data(:,2).^2), data(:,1).^3, data(:,2).^3];
end