function label = testTrees_fast(data,tree,learner)
% Faster version - pass all data at same time
disp('Testing Random Forest...');

cnt = 1;
for T = 1:length(tree)
    idx{1} = 1:size(data,1);
    % traverse through all the nodes in the tree
    for n = 1:length(tree(T).node);
        % check if the node is a leaf or not
        % if the node is a leave, then the dimension will be 0
        if ~tree(T).node(n).dim
            % obtain index of leave within the specfic tree, not the global leaf index
            leaf_idx = tree(T).node(n).leaf_idx;
            
            if ~isempty(tree(T).leaf(leaf_idx))
                label(idx{n}',T) = tree(T).leaf(leaf_idx).label;
            end
            continue;
        end
        
        switch learner
            case 'axis-aligned'
                idx_left = data(idx{n},tree(T).node(n).dim) < tree(T).node(n).t;
            case 'two-pixel'
                idx_left = data(idx{n},1)-data(idx{n},2) < tree(T).node(n).t;
            case 'linear'
                idx_left = data(idx{n},1:2)*tree(T).node(n).dim < tree(T).node(n).t;
            case 'quad-features'
                idx_left = get_quad_features(data(idx{n},1:2))*tree(T).node(n).dim < tree(T).node(n).t;
            case 'quad-features-x-axis-only'
                idx_left = get_quad_only_x_axis(data(idx{n},1:2))*tree(T).node(n).dim < tree(T).node(n).t;
            case 'cube-features'
                idx_left = get_cubic_features(data(idx{n},1:2))*tree(T).node(n).dim < tree(T).node(n).t;
            case 'cube-features-x-axis-only'
                idx_left = get_cubic_only_x_axis(data(idx{n},1:2))*tree(T).node(n).dim < tree(T).node(n).t;
        end
        
        idx{n*2} = idx{n}(idx_left');
        idx{n*2+1} = idx{n}(~idx_left');
    end
end

end
