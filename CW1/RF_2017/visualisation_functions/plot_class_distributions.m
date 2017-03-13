function plot_class_distributions(trees)
    
    % get probabilities
    probs=trees(1).prob;
    
    figure();
    for i=1:16
        subplot(4,4,i);
        bar(probs(i+1,:));
        axis([0.5 3.5 0 1]);
        grid on; grid minor;
        str=sprintf('Leaf: %d', i);
        title(str,'FontSize', 20);
    end
    scale_graph;
%     graph_saving('../report/images/leaf_node_distributions') 
end