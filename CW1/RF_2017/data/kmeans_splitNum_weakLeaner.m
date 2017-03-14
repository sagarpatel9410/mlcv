load rf_codebook_num_trees_acc.mat

figure(1);
plot(treeNum, accuracy_rf_all, 'LineWidth', 2);
axis([3 200 0.35 0.75]);
set(gca,'fontsize',20);
grid on; grid minor;
title('Impact of Size of Codebook on Accuracy','FontSize',40);
xlabel('Number of Trees', 'FontSize', 25);
ylabel('Classification Accuracy', 'FontSize', 25);
legend({'RF Codebook Size=86', 'RF Codebook Size=172', 'RF Codebook Size=323'}, 'FontSize', 25);
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


