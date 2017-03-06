%% axis-aligned learner
ig_best_axis_aligned = -inf;
idx_best = [];
for n = 1:iter
    [idx_, dim, t] = axis_aligned(D, data);
    ig = getIG(data,idx_);
    [node, ig_best_axis_aligned, idx_best] = updateIG(node,ig_best_axis_aligned,ig,t,idx_,dim,idx_best);
    
end
plot_split_function(idx_best,data,node.dim,node.t,ig_best_axis_aligned,0,row_offset+1);

%% linear learner
ig_best_linear = -inf;
idx_best = [];
for n = 1:iter
    [idx_, dim, t] = linear_learner(D, data);
    ig = getIG(data,idx_);
    [node, ig_best_linear, idx_best] = updateIG(node,ig_best_linear,ig,t,idx_,dim,idx_best);
    
end
plot_split_function(idx_best,data,node.dim,node.t,ig_best_linear,0,row_offset+2);

%% quadratic learner
ig_best_quad = -inf;
idx_best = [];
for n = 1:iter
    [idx_, dim, t] = quad_feature_x_axis_learner(D, data);
    ig = getIG(data,idx_);
    [node, ig_best_quad, idx_best] = updateIG(node,ig_best_quad,ig,t,idx_,dim,idx_best);
    
end
plot_split_function(idx_best,data,node.dim,node.t,ig_best_quad,0,row_offset+3);

%% cubic learner
ig_best_cubic = -inf;
idx_best = [];
for n = 1:iter
    [idx_, dim, t] = cube_feature_x_axis_learner(D, data);
    ig = getIG(data,idx_);
    [node, ig_best_cubic, idx_best] = updateIG(node,ig_best_cubic,ig,t,idx_,dim,idx_best);
    
end
plot_split_function(idx_best,data,node.dim,node.t,ig_best_cubic,0,row_offset+4);
