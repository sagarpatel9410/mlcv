load kmeans_codebook_variation_with_depth.mat

figure(1)
plot(depth, accuracy_rf_all(2,:,1), 'LineWidth', 2);
hold on;
plot(depth, accuracy_rf_all(2,:,2), 'LineWidth', 2);
axis([3 10 0 1]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Impact of Depth on Accuracy','FontSize',40);
xlabel('Depth of the Tree', 'FontSize', 25);
ylabel('Classification Accuracy', 'FontSize', 25);
legend({'Axis-Aligned', 'Two-Pixel', 'Linear', 'Quadratic', 'Cubic'}, 'FontSize', 25);
scale_graph;

figure(2)
plot(depth, buildRfClassifierTime_all(2,:,1), 'LineWidth', 2);
axis([3 10 0 4]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Computational Complexity of Tree Depth','FontSize',40);
xlabel('Depth of the Tree', 'FontSize', 25);
ylabel('Time Taken to Build RF Classifier (s)', 'FontSize', 25);
scale_graph;
