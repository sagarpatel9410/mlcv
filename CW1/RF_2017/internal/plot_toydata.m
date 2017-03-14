function  plot_toydata( data, type )
if(strcmp(type,'train'))
plot(data(data(:,end)==1,1), data(data(:,end)==1,2), 'o', 'MarkerSize', 15, 'MarkerFaceColor', [.9 .5 .5], 'MarkerEdgeColor','k');
hold on;
plot(data(data(:,end)==2,1), data(data(:,end)==2,2), 'o', 'MarkerSize', 15, 'MarkerFaceColor', [.5 .9 .5], 'MarkerEdgeColor','k');
hold on;
plot(data(data(:,end)==3,1), data(data(:,end)==3,2), 'o', 'MarkerSize', 15, 'MarkerSize', 15, 'MarkerFaceColor', [.5 .5 .9], 'MarkerEdgeColor','k');
elseif(strcmp(type,'test'))
plot(data(data(:,end)==1,1), data(data(:,end)==1,2), 'o', 'MarkerSize', 15, 'MarkerFaceColor', [0.8500 0.3250 0.0980], 'MarkerEdgeColor','k');
hold on;
plot(data(data(:,end)==2,1), data(data(:,end)==2,2), 'o', 'MarkerSize', 15, 'MarkerFaceColor', [0.4660 0.6740 0.1880], 'MarkerEdgeColor','k');
hold on;
plot(data(data(:,end)==3,1), data(data(:,end)==3,2), 'o', 'MarkerSize', 15, 'MarkerFaceColor', [0 0.4470 0.7410], 'MarkerEdgeColor','k');
elseif(strcmp(type,'train_small'))
plot(data(data(:,end)==1,1), data(data(:,end)==1,2), 'o', 'MarkerFaceColor', [.9 .5 .5], 'MarkerEdgeColor','k');
hold on;
plot(data(data(:,end)==2,1), data(data(:,end)==2,2), 'o', 'MarkerFaceColor', [.5 .9 .5], 'MarkerEdgeColor','k');
hold on;
plot(data(data(:,end)==3,1), data(data(:,end)==3,2), 'o', 'MarkerFaceColor', [.5 .5 .9], 'MarkerEdgeColor','k');
elseif(strcmp(type,'test_small'))
plot(data(data(:,end)==1,1), data(data(:,end)==1,2), 'o', 'MarkerFaceColor', [.9 .5 .5], 'MarkerEdgeColor','k');
hold on;
plot(data(data(:,end)==2,1), data(data(:,end)==2,2), 'o', 'MarkerFaceColor', [.5 .9 .5], 'MarkerEdgeColor','k');
hold on;
plot(data(data(:,end)==3,1), data(data(:,end)==3,2), 'o', 'MarkerFaceColor', [.5 .5 .9], 'MarkerEdgeColor','k');
end
axis([-1.5 1.5 -1.5 1.5]);
set(gca,'fontsize',20);
title('Axis, trees=100, depth=10, splitNum=7','FontSize', 40);
scale_graph
end

