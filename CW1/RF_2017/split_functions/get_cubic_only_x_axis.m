% Simple Function Assumes that the Input Data has 2 Dimensions, x1 and x2
% Output will have [x2, x1, x1^2]
function feats=get_cubic_only_x_axis(data)
    feats=[data(:,2), data(:,1), data(:,1).^2, data(:,1).^3];
end
