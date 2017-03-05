function [node,nodeL,nodeR] = splitNode(data,node,param)

visualise = 0;

% Initilise child nodes
learner=param.weakLearner;
iter = param.splitNum;
nodeL = struct('idx',[],'t',nan,'dim',0,'prob',[]);
nodeR = struct('idx',[],'t',nan,'dim',0,'prob',[]);

% make this node a leaf if has less than 5 data points
if length(node.idx) <= 5 
    node.t = nan;
    node.dim = 0;
    return;
end

idx = node.idx;
data = data(idx,:);
[~,D] = size(data);
% Initialise best information gain
ig_best = -inf;
idx_best = [];

for n = 1:iter
    
    % Split function - Modify here and try other types of split function
    switch learner
        case 'axis-aligned'
            [idx_, dim, t] = axis_aligned(D, data);
        case 'two-pixel'
            [idx_, dim, t] = two_pixel_test(D, data);
        case 'linear'
            [idx_, dim, t] = linear_learner(D, data);
        case 'quad-features'
            [idx_, dim, t] = quad_feature_learner(D, data);
        case 'cube-features'
            [idx_, dim, t] = cube_feature_learner(D, data);
    end
    
    % Calculate information gain
    % Based on the split that was performed
    ig = getIG(data,idx_);
    
    if visualise
        visualise_splitfunc(idx_,data,dim,t,ig,n);
        pause();
    end
    
    % update the information gain and store the best out of all the split
    % function that were tried
    [node, ig_best, idx_best] = updateIG(node,ig_best,ig,t,idx_,dim,idx_best);
    
end


nodeL.idx = idx(idx_best);
nodeR.idx = idx(~idx_best);

if visualise
    visualise_splitfunc(idx_best,data,dim,t,ig_best,0)
    fprintf('Information gain = %f. \n',ig_best);
    pause();
end

end

% Information Gain - the 'purity' of data labels in both child nodes after split. The higher the purer.
function ig = getIG(data,idx)
L = data(idx);
R = data(~idx);
H = getE(data);
HL = getE(L);
HR = getE(R);
ig = H - sum(idx)/length(idx)*HL - sum(~idx)/length(idx)*HR;
end

% Entropy
function H = getE(X)
cdist= histc(X(:,1:end), unique(X(:,end))) + 1;
cdist= cdist/sum(cdist);
cdist= cdist .* log(cdist);
H = -sum(cdist);
end

% Update information gain
function [node, ig_best, idx_best] = updateIG(node,ig_best,ig,t,idx,dim,idx_best)
if ig > ig_best
    ig_best = ig;
    node.t = t;
    node.dim = dim;
    idx_best = idx;
else
    idx_best = idx_best;
end
end