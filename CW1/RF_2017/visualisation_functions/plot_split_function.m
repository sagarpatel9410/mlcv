function plot_split_function(idx_best,data,dim,t,ig_best,row)
    
    % split function
    subplot(4,4,row);
    x=-1.5:0.001:1.5;
    pranav_choose_func_for_plotting;
    axis([-1.5 1.5 -1 1]);
    grid on; grid minor;    
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
    
    % Histograms
    subplot(4,4,row+1);
    tmp = hist(data(:,end), unique(data(:,end)));
    bar(tmp);
    axis([0.5 3.5 0 max(tmp)]);
    title('Parent','FontSize', 20);
    subplot(4,4,row+2);
    bar(hist(data(idx_best,end), unique(data(:,end))));
    axis([0.5 3.5 0 max(tmp)]);
    title('Left','FontSize', 20);
    subplot(4,4,row+3);
    bar(hist(data(~idx_best,end), unique(data(:,end))));
    axis([0.5 3.5 0 max(tmp)]);
    title('Right','FontSize', 20);
    hold off;

    scale_graph;
end