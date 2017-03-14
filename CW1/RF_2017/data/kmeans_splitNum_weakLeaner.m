load kmeans_codebook_variation_with_splitNum_and_weak_learners.mat

figure(1);
plot(splitNum, accuracy_rf_all(1,:,1), 'LineWidth', 2);
hold on;
plot(splitNum, accuracy_rf_all(1,:,2), 'LineWidth', 2);
axis([3 150 0.4 0.7]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Impact of numSplits on Accuracy','FontSize',40);
xlabel('Number of Split Functions', 'FontSize', 25);
ylabel('Classification Accuracy', 'FontSize', 25);
legend({'Axis-Aligned', 'Two-Pixel'}, 'FontSize', 25);
scale_graph;

% figure(2);
% plot(splitNum, buildRfClassifierTime_all(1,:,1), 'LineWidth', 2);
% hold on;
% plot(splitNum, buildRfClassifierTime_all(1,:,2), 'LineWidth', 2);
% axis([3 150 0 5]);
% set(gca,'fontsize',20);
% grid on; grid minor;
% title('Computational Complexity of numSplits','FontSize',40);
% xlabel('Number of Split Functions', 'FontSize', 25);
% ylabel('Time Taken to Build RF Classifier (s)', 'FontSize', 25);
% legend({'Axis-Aligned', 'Two-Pixel'}, 'FontSize', 25);
% scale_graph;


