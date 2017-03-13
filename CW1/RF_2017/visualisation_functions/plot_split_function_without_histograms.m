function plot_split_function_without_histograms(idx_best,data,dim,t,ig_best,row)
    
    % split function
    subplot(4,4,row);
    x=-1.5:0.001:1.5;
    pranav_choose_func_for_plotting;
    axis([-1.5 1.5 -1 1]);
    hold on;
    plot(data(~idx_best,1), data(~idx_best,2), '*', 'MarkerEdgeColor', [.8 .6 .6], 'MarkerSize', 10);
    hold on;
    plot(data(idx_best,1), data(idx_best,2), '+', 'MarkerEdgeColor', [.6 .6 .8], 'MarkerSize', 10);
    hold on;
    plot(data(data(:,end)==1,1), data(data(:,end)==1,2), 'o', 'MarkerFaceColor', [.9 .3 .3], 'MarkerEdgeColor','k');
    hold on;
    plot(data(data(:,end)==2,1), data(data(:,end)==2,2), 'o', 'MarkerFaceColor', [.3 .9 .3], 'MarkerEdgeColor','k');
    hold on;
    plot(data(data(:,end)==3,1), data(data(:,end)==3,2), 'o', 'MarkerFaceColor', [.3 .3 .9], 'MarkerEdgeColor','k');
    hold off;
    scale_graph;
end