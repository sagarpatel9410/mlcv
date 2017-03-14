load kmeans_codebook_variation_with_splitNum_and_weak_learners.mat

plot(splitNum, accuracy_rf_all(3,:,1), 'LineWidth', 2);
hold on;
plot(splitNum, accuracy_rf_all(3,:,2), 'LineWidth', 2);
plot(splitNum, accuracy_rf_all(3,:,4), 'LineWidth', 2);
plot(splitNum, accuracy_rf_all(3,:,3), 'LineWidth', 2);
plot(splitNum, accuracy_rf_all(3,:,5), 'LineWidth', 2);
axis([3 11 0 1]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Impact of numSplits on Accuracy','FontSize',40);
xlabel('Number of Split Functions', 'FontSize', 25);
ylabel('Classification Accuracy', 'FontSize', 25);
legend({'Axis-Aligned', 'Two-Pixel', 'Linear', 'Quadratic', 'Cubic'}, 'FontSize', 25);
scale_graph;
