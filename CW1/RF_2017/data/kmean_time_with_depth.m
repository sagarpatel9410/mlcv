figure(2)
plot(depth, buildRfClassifierTime_all(2,:,1), 'LineWidth', 2);
axis([3 10 0 4]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Computational Complexity of Tree Depth','FontSize',40);
xlabel('Depth of the Tree', 'FontSize', 25);
ylabel('Time Taken to Build RF Classifier (s)', 'FontSize', 25);
scale_graph;
