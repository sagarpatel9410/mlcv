% To use this function, change the call to split node in growTrees
function [node,nodeL,nodeR] = splitNode_for_plotting(data,node,param)

% Initilise child nodes
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
aa_ig_best = -inf; aa_idx_best = [];
lin_ig_best = -inf; lin_idx_best = [];
quad_ig_best = -inf; quad_idx_best = [];
cube_ig_best = -inf; cube_idx_best = [];


% if we wanted to visualise the splits
% visualise_all_splits;

for n = 1:iter
    
    % Split function - Modify here and try other types of split function
    [aa_idx_, aa_dim, aa_t] = axis_aligned(D, data);
    [lin_idx_, lin_dim, lin_t] = linear_learner(D, data);
    [quad_idx_, quad_dim, quad_t] = quad_feature_learner(D, data);
    [cube_idx_, cube_dim, cube_t] = cube_feature_learner(D, data);
    
    % Calculate information gain
    % Based on the split that was performed
    aa_ig = getIG(data,aa_idx_);
    lin_ig = getIG(data,lin_idx_);
    quad_ig = getIG(data,quad_idx_);
    cube_ig = getIG(data,cube_idx_);
    
    % update the information gain and store the best out of all the split
    % function that were tried
    [node, aa_ig_best, aa_idx_best] = updateIG(node,aa_ig_best,aa_ig,aa_t,aa_idx_,aa_dim,aa_idx_best);
    [lin_node, lin_ig_best, lin_idx_best] = updateIG(node,lin_ig_best,lin_ig,lin_t,lin_idx_,lin_dim,lin_idx_best);
    [quad_node, quad_ig_best, quad_idx_best] = updateIG(node,quad_ig_best,quad_ig,quad_t,quad_idx_,quad_dim,quad_idx_best);
    [cube_node, cube_ig_best, cube_idx_best] = updateIG(node,cube_ig_best,cube_ig,cube_t,cube_idx_,cube_dim,cube_idx_best);

end


nodeL.idx = idx(aa_idx_best);
nodeR.idx = idx(~aa_idx_best);

plot_split_function_without_histograms(aa_idx_best,data,aa_dim,aa_t,aa_ig_best,mult);
plot_split_function_without_histograms(lin_idx_best,data,lin_dim,lin_t,lin_ig_best,1+mult);
plot_split_function_without_histograms(quad_idx_best,data,quad_dim,quad_t,quad_ig_best,2+mult);
plot_split_function_without_histograms(cube_idx_best,data,cube_dim,cube_t,cube_ig_best,3+mult);

end

% Information Gain - the 'purity' of data labels in both child nodes after split. The higher the purer.
function ig = getIG(data,idx)
L = data(idx,:);
R = data(~idx,:);
H = getE(data);
HL = getE(L);
HR = getE(R);
ig = H - sum(idx)/length(idx)*HL - sum(~idx)/length(idx)*HR;
end

% Entropy
function H = getE(X)
cdist= histc(X(:,1:end), unique(X(:,end))) + 1;
cdist= cdist(:,end);
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
